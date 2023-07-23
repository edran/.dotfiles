#!/usr/bin/env zsh
## Enables instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Compinit is handled manually rather than through zgenom.
export ZGEN_AUTOLOAD_COMPINIT=0
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

  # Initialise completion and other plugins as necessary
  autoload -Uz compinit && compinit -u -d $ZSH_CACHE/zcompdump
  autopair-init

  source $ZDOTDIR/aliases.zsh
  # All the nonsense should be contained in here.
  source $ZDOTDIR/extras.zsh

  # NOTE: p10k configure by default puts it somewhere else, so it always needs
  # to be renamed in case it needs to be generated again.
  [[ ! -f $ZDOTDIR/prompt.zsh ]] || source $ZDOTDIR/prompt.zsh
fi
