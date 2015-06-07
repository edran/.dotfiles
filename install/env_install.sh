#!/bin/bash

if [ -z "$(which octave)" ] ; then
    echo "++++++ Installing Octave"
    sudo apt-get install octave
else
    echo "====== Octave is already installed"
fi

if [ -z "$(which tex)" ] ; then
    echo "++++++ Installing TeX distribution"
    sudo apt-get install texlive-full auctex tex-gyre
else
    echo "====== LaTeX is already installed"
fi

if [ -z "$(which gcc-4.9)" ] ; then
    echo "++++++ Installing GCC 4.9"
    sudo apt-get install build-essential
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-4.9 g++-4.9 cpp-4.9
else
    echo "====== GCC 4.9 is already installed"
fi

# if [ -z "$(which pyenv)" ] ; then
#     echo "++++++ Installing pyenv"
#     curl -L \
#         https://raw.githubusercontent.com/yyuu/\
# pyenv-installer/master/bin/pyenv-installer | bash
#     sudo apt-get build-dep python2.7 python3.4
#     sudo apt-get install build-essential wget libreadline-dev libncurses5-dev \
#         libssl1.0.0 tk8.5-dev zlib1g-dev liblzma-dev
#     echo "++++++ Installing pip for python3"
#     sudo apt-get install python3-pip
#     pip install --install-option="--user" virtualenv
#     pip install --install-option="--user" stevedore
#     pip install --install-option="--user" virtualenvwrapper
# fi
