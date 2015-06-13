#!/bin/bash

# if [ -z "$(which idea)" ] ; then
#     echo "++++++ Installing Idea"
#     add-apt-repository ppa:webupd8team/java
#     apt-get update
#     apt-get install oracle-java7-installer
#     echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select \
#         true | sudo /usr/bin/debconf-set-selections
#     update-java-alternatives -s java-7-oracle
#     wget -O ~/.dotfiles/bin/intellij.tar.gz \
#         http://download.jetbrains.com/idea/ideaIC-14.0.2.tar.gz
#     tar xfz ~/.dotfiles/bin/intellij.tar.gz
#     rm -v ~/.dotfiles/bin/intellij.tar.gz
#     mv ~/.dotfiles/bin/idea-IC-139.659.2 ~/.dotfiles/bin/idea-dir
# else
#     echo "====== Idea is already installed"
# fi

if [ -z "$(which terminator)" ] ; then
    echo "++++++ Installing Terminator"
    sudo apt-get install terminator
else
    echo "====== Terminator is already installed"
fi

if [ -z "$(which xmonad)" ] ; then
    echo "++++++ Installing Xmonad"
    sudo apt-get install xmonad gnome-panel suckless-tools
else
    echo "====== Xmonad is already installed"
fi

if [ -z "$(which virtualbox)" ] ; then
    echo "++++++ Installing Virtualbox"
    sudo apt-get install virtualbox
else
    echo "====== Virtualbox is already installed"
fi
