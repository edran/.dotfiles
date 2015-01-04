#!/bin/bash

set -e # errors yeah

BACKUP="$HOME/.home_backup"
DOTF="$(pwd)"

if [[ ! "$DOTF" == *.dotfiles ]]; then
    echo "Please run this script from the .dotfiles directory"
    echo "cd .dotfiles; ./install.sh"
    exit 1
fi

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

echo "This script is going to remove many files in your home."
read -p "Are you sure you want to run it? [y,n] " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo # for newline

echo "Backupping home config files..."

if [ ! -d "$BACKUP" ]; then
    mkdir -v $BACKUP
else
    rm -rf $BACKUP
    mkdir -v $BACKUP
fi

set +e


mv -v $HOME/.inputrc $BACKUP
mv -v $HOME/.profile $BACKUP
mv -v $HOME/.gitconfig $BACKUP
mv -v $HOME/.bashrc $BACKUP
mv -v $HOME/.bash_aliases $BACKUP
mv -v $HOME/bin $BACKUP
mv -v $HOME/.config $BACKUP

set -e

echo "Linking dotfiles"
ln -sv $DOTF/inputrc $HOME/.inputrc
ln -sv $DOTF/profile $HOME/.profile
ln -sv $DOTF/gitconfig $HOME/.gitconfig
ln -sv $DOTF/bashrc $HOME/.bashrc
ln -sv $DOTF/bin $HOME/bin
ln -sv $DOTF/config $HOME/.config

THIS_DIR="$(pwd)"

echo "Installing missing software"
if [ -z "$(which emacs)" ] ; then
    echo "++++++ Installing emacs (from source)"
    sudo apt-get build-dep emacs23
    cur http://ftp.heanet.ie/mirrors/gnu/emacs/emacs-24.3.tar.gz | tar xvf
    cd emacs-24.3
    ./configure
    make
    sudo make install
    cd ..
    rm -rf emacs-24.3/
    rm emacs-24.3.tar.gz
fi

if [ -z "$(which ag)" ] ; then
    echo "++++++ Installing ag"
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev \
        liblzma-dev
    git clone https://github.com/ggreer/the_silver_searcher
    cd the_silver_searcher
    ./build
    sudo make install
    cd ..
    rm the_silver_searcher
fi

if [ -z "$(which xcape)" ] ; then
    echo "++++++ Installing xcape"
    sudo apt-get install git gcc make pkg-config libx11-dev \
        libxtst-dev libxi-dev
    mkdir xcape
    cd xcape
    git clone https://github.com/alols/xcape.git .
    make
    sudo make install
    cd ..
    rm -rf xcape
fi

if [ -z "$(which tex)" ] ; then
    echo "++++++ Installing TeX distribution"
    sudo apt-get install texlive-full auctex tex-gyre
fi

# python

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

# ROS

if [ -z "$(which roscore)" ] ; then
    echo "++++++ Installing ROS"
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > \
/etc/apt/sources.list.d/ros-latest.list'
    sudo apt-get update
    sudo apt-get install ros-hydro-desktop-full
fi

# Octave

if [ -z "$(which octave)" ] ; then
    echo "++++++ Installing Octave"
    sudo apt-get install octave3.2 octave3.2-info octave3.2-doc
fi



echo "============ Dev install, done"

if [ -z "$(which cmus)" ] ; then
    echo "++++++ Installing cmus"
    sudo apt-get install cmus
fi

if [ -z "$(which xmonad)" ] ; then
    echo "++++++ Installing xmonad"
    sudo apt-get install xmonad xmonad-contrib gnome-panel suckless-tools
fi

echo "============ Common install, done"
