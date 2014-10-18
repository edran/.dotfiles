#!/bin/bash

rm ~/.inputrc
rm ~/.profile
rm ~/.gitconfig
rm ~/.config/autostart
rm ~/bin

ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.profile ~/.profile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/config/autostart ~/.config/autostart
ln -s ~/.dotfiles/bin ~/bin

THIS_DIR="$(pwd)"

if [ -z "$(which emacs24)" ] ; then
    echo "++++++ Installing emacs"
    sudo apt-get update
    sudo apt-get install emacs24
fi

if [ -z "$(which ag)" ] ; then
    echo "++++++ Installing ag"
    sudo apt-get install silversearcher-ag
fi

if [ -z "$(which xcape)" ] ; then
    echo "++++++ Installing xcape"
    sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
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
    sudo apt-get install texlive-full auctex
fi

# python

if [ -z "$(which pyenv)" ] ; then
    echo "++++++ Installing pyenv"
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    sudo apt-get build-dep python2.7 python3.4
    sudo apt-get install build-essential wget libreadline-dev libncurses5-dev \
        libssl1.0.0 tk8.5-dev zlib1g-dev liblzma-dev
    echo "++++++ Installing pip for python3"
    sudo apt-get install python3-pip
    pip install --install-option="--user" virtualenv
    pip install --install-option="--user" stevedore
    pip install --install-option="--user" virtualenvwrapper
fi

echo "============ Dev install, done"

if [ -z "$(which cmus)" ] ; then
    echo "++++++ Installing cmus"
    sudo apt-get install cmus
fi

if [ -z "$(which xmonad)" ] ; then
    echo "++++++ Installing xmonad"
    sudo apt-get install xmonad xmonad-contrib gnome-panel
fi

echo "============ Common install, done"
