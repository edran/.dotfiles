#!/usr/bin/env zsh

## Enables instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/config.zsh

# NOTE: ZDOTDIR needs to be defined before here!
export ZGENOM_DIR="$HOME/.zgenom"

if [ ! -d "$ZGENOM_DIR" ]; then
  echo "Installing jandamm/zgenom"
  git clone https://github.com/jandamm/zgenom "$ZGENOM_DIR"
fi
source $ZGENOM_DIR/zgenom.zsh

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

if ! zgenom saved; then
  echo "Initializing zgenom"
  rm -f $ZDOTDIR/*.zwc(N) \
        $XDG_CACHE_HOME/zsh/*(N) \
        $ZGEN_INIT.zwc

  zgenom load junegunn/fzf shell
  zgenom load jeffreytse/zsh-vi-mode
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-completions src
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load romkatv/powerlevel10k powerlevel10k
  zgenom load hlissner/zsh-autopair autopair.zsh

  zgenom save
  zgenom compile $ZDOTDIR
fi

## Bootstrap interactive sessions
if [[ $TERM != dumb ]]; then
  source $ZDOTDIR/keybindings.zsh
  source $ZDOTDIR/completion.zsh
  source $ZDOTDIR/aliases.zsh
  autopair-init

  # fd > find
  if type fd &>/dev/null; then
      export FZF_DEFAULT_OPTS="--reverse --ansi"
      export FZF_DEFAULT_COMMAND="fd ."
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd -t d . $HOME"
  fi

  if type zoxide &>/dev/null; then
      eval "$(zoxide init zsh)"
  fi

  if type direnv &>/dev/null; then
      eval "$(direnv hook zsh)"
  fi

  test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

  # The next line enables shell command completion for gcloud.
  if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi


  # TODO: make it lazy!
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

  # To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
  [[ ! -f $ZDOTDIR/prompt.zsh ]] || source $ZDOTDIR/prompt.zsh
fi
