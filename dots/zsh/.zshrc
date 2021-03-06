# -*- mode: sh; -*-

export ZGEN_DIR="$HOME/.zgen"
export ZGEN_SOURCE="$ZGEN_DIR/zgen.zsh"
export ZGEN_RESET_ON_CHANGE=(`ls -a $ZDOTDIR`)

[ -d "$ZGEN_DIR" ] || git clone https://github.com/tarjoilija/zgen "$ZGEN_DIR"
source $ZGEN_SOURCE

if ! zgen saved; then
    echo "Initializing zgen"
    zgen load hlissner/zsh-autopair autopair.zsh
    zgen load zsh-users/zsh-history-substring-search
    zgen load zdharma/history-search-multi-word
    zgen load zsh-users/zsh-completions src
    zgen load junegunn/fzf shell
    zgen prezto git
    [ -z "$SSH_CONNECTION" ] && zgen load zdharma/fast-syntax-highlighting
    zgen save
fi

source $ZDOTDIR/config.zsh
if [[ $TERM != dumb  ]]; then
    source $ZDOTDIR/keybindings.zsh
    source $ZDOTDIR/completion.zsh
    source $ZDOTDIR/aliases.zsh
    source $ZDOTDIR/prompt2.zsh

    # # deals with ssh agent / passphrase
    # if type keychain &>/dev/null; then
    #     eval `keychain --eval --agents ssh --inherit any --quiet id_rsa`
    # fi

    ##
    function _cache {
        command -v "$1" >/dev/null || return 1
        local cache_dir="$CACHEDIR/${SHELL##*/}"
        local cache="$cache_dir/$1"
        if [[ ! -f $cache || ! -s $cache ]]; then
        echo "Caching $1"
        mkdir -p $cache_dir
        "$@" >$cache
        fi
        source $cache || rm -f $cache
    }

    # fd > find
    if command -v fd >/dev/null; then
        export FZF_DEFAULT_OPTS="--reverse --ansi"
        export FZF_DEFAULT_COMMAND="fd ."
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND="fd -t d . $HOME"
    fi
    _cache fasd --init posix-alias zsh-{hook,{c,w}comp{,-install}}

    test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

    eval $(thefuck --alias)

    if type direnv &>/dev/null; then
        eval "$(direnv hook zsh)"
    fi

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('$HOME/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/.conda/etc/profile.d/conda.sh" ]; then
            . "$HOME/.conda/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/.conda/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/nantas/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nantas/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/nantas/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nantas/google-cloud-sdk/completion.zsh.inc'; fi

    ##
    autoload -Uz compinit && compinit -u -d $CACHEDIR/zcompdump
    autopair-init

    [ -f "$BASHDIR/local.zsh" ] && source "$BASHDIR/local.zsh"
fi
