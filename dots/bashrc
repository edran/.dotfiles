#!/bin/env bash

# Don't run if not interactive
[ -z "$PS1" ] && return

# Don't save duplicates and space-prefixed commands
HISTCONTROL=ignoreboth

# When exiting the shell, append the history instead of overwriting it
shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=20000

# Better history format
export HISTTIMEFORMAT="%h %d %H:%M:%S> "

# Update rows/columns with windows size changes
shopt -s checkwinsize

# Frendlier less for non-text input
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set working chroot
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Force colors in bash
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# load aliases
if [ -f "$HOME/.dotfiles/bash_aliases" ]; then
    . $HOME/.dotfiles/bash_aliases
fi

# bash completion
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

git-ssh() {
    eval `ssh-agent -s`
    ssh-add ~/.ssh/github_rsa
}

VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
export PROJECT_HOME="$HOME/Dev"
export WORKON_HOME="$HOME/.venvs"
if [ -x "/usr/local/bin/virtualenvwrapper.sh" ] ; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
