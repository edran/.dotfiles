#!/bin/bash

# System

alias reload-xresources='xrdb ~/.Xresources'

# ROS
alias primessh='ssh edran@primec1.inf.ed.ac.uk'
alias pr2dash='rosrun rqt_pr2_dashboard rqt_pr2_dashboard'
alias rviz='rosrun rviz rviz'
alias givenet-prime='ssh -R 3128:127.0.0.1:3128 edran@primec1.inf.ed.ac.uk'
alias rosinfo='export | grep ROS'

alias givenet-megatron='ssh -R 3128:127.0.0.1:3128 youbot@megatron.inf.ed.ac.uk'
alias givenet-soundwave='ssh -R 3128:127.0.0.1:3128 youbot@soundwave.inf.ed.ac.uk'
alias givenet-starscream='ssh -R 3128:127.0.0.1:3128 youbot@starscream.inf.ed.ac.uk'
alias givenet-blackout='ssh -R 3128:127.0.0.1:3128 youbot@blackout.inf.ed.ac.uk'
alias givenet-thundercracker='ssh -R 3128:127.0.0.1:3128 youbot@thundercracker.inf.ed.ac.uk'

# Emacs
alias ec='emacsclient -c -n -a nano'
alias et='emacsclient -t -a nano'
alias virtualenv3='virtualenv -p python3.4'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i \
"$([ $? = 0 ] && echo terminal || echo error)" \
"$(history|tail -n1|sed -e \
'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# requires pip install thefuck
alias fuck='$(thefuck $(fc -ln -1))'
