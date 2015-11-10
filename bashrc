#! /bin/env bash

[ -z "$PS1" ] && return
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ -f "$HOME/.dotfiles/bash_aliases" ]; then
    . $HOME/.dotfiles/bash_aliases
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

####################################################################

# Prompt
PS1="\[\e[31m\][\[\e[33m\]\$PWD\[\e[31m\]]\[\e[0m\] "
PROMPT_COMMAND='echo -ne "\033];${PWD}"; echo -ne "\007"'
if [ -f $HOME/.dotfiles/vendor/bash-git-prompt/gitprompt.sh ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_LEADING_SPACE=1
  Time12a="\$(date +%H:%M"
  PathShort="\w"
  GIT_PROMPT_SEPARATOR="|"
  GIT_PROMPT_BRANCH="\[\e[35m\]"
  GIT_PROMPT_STAGED="\[\e[31m\]●"
  GIT_PROMPT_CONFLICTS="\[\e[31m\]✖ "
  GIT_PROMPT_CHANGED="\[\e[34m\]✚ "
  GIT_PROMPT_REMOTE=" "
  GIT_PROMPT_UNTRACKED="\[\e[36m\]…"
  GIT_PROMPT_STASHED="\[\e[34m\]⚑ "
  GIT_PROMPT_CLEAN="\[\e[32m\]✔"
  GIT_PROMPT_COMMAND_OK="\[\e[32m\]✔ "
  GIT_PROMPT_COMMAND_FAIL="\[\e[31m\]✘ "
  GIT_PROMPT_SYMBOLS_AHEAD="↑·"
  GIT_PROMPT_SYMBOLS_BEHIND="↓·"
  GIT_PROMPT_SYMBOLS_PREHASH=":"
  GIT_PROMPT_START="\[\e[31m\][\[\e[33m\]\$PWD\[\e[0m\]|"
  GIT_PROMPT_END="\[\e[31m\]]\[\e[0m\] "
  . $HOME/.dotfiles/vendor/bash-git-prompt/gitprompt.sh
fi

# Editors

export EDITOR="vim"
export GIT_EDITOR="vim"
ecs() { emacsclient -c -n -a emacs "/sudo::$*"; }
ets() { emacsclient -t -a emacs "/sudo::$*"; }
export TERM=xterm-256color

# External sources

if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/z" ] ; then
    . $HOME/.dotfiles/z/z.sh
fi

# ROS activation
if [ -d "/opt/ros/indigo" ] ; then
    source /opt/ros/indigo/setup.bash
fi

# Torch activation
if [ -d "$HOME/torch/install/bin/" ] ; then
    . $HOME/torch/install/bin/torch-activate
fi

export TORCH_DIR="$HOME/torch"
export PROTOBUF_DIR="$HOME/protobuf"

export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64/"

export VIRTUALENV_MASTER_PATH="$HOME/.dotfiles/venvs"
