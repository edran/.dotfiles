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
START_PART="\[\e[1;31m\]["
END_PART="\[\e[1;31m\]]\[\e[0;0m\] "
PWD_PART="\[\e[0;33m\]\w"
HOST_PART="\[\e[0;32m\]\h"
USER_PART="\[\e[0;34m\]\u"
AT_PART="\[\e[0;37m\]@"
COL_PART="\[\e[0;37m\]:"
PS1="$START_PART$USER_PART$AT_PART$HOST_PART$COL_PART$PWD_PART$END_PART"

if [ -f $HOME/.dotfiles/vendor/bash-git-prompt/gitprompt.sh ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_LEADING_SPACE=0
  GIT_PROMPT_PREFIX="\[\e[1;34m\]["
  GIT_PROMPT_SUFFIX="\[\e[1;34m\]]"
  GIT_PROMPT_SEPARATOR="\[\e[0;37m\]|"
  GIT_PROMPT_THEME=Single_line
  GIT_PROMPT_START="$PS1"
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
