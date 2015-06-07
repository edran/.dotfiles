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

echo "~~~~~~~~~~~~~~~ Backupping home config files... ~~~~~~~~~~~~~~~"

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
mv -v $HOME/.fonts $BACKUP

set -e

echo "~~~~~~~~~~~~~~~~~~~~~ Linking dotfiles ~~~~~~~~~~~~~~~~~~~~~~~~"

ln -sv $DOTF/inputrc $HOME/.inputrc
ln -sv $DOTF/profile $HOME/.profile
ln -sv $DOTF/gitconfig $HOME/.gitconfig
ln -sv $DOTF/bashrc $HOME/.bashrc
ln -sv $DOTF/bin $HOME/bin
ln -sv $DOTF/config $HOME/.config
ln -sv $DOTF/fonts $HOME/.fonts

THIS_DIR="$(pwd)"

echo "~~~~~~~~~~~~~~~~~ Installing missing software ~~~~~~~~~~~~~~~~~"
/bin/bash ./install/emacs_install.sh
/bin/bash ./install/dev_install.sh
/bin/bash ./install/tools_install.sh
/bin/bash ./install/env_install.sh
/bin/bash ./install/ros_install.sh
/bin/bash ./install/other_install.sh

echo "~~~~~~~~~~~~~~~~ Everything has been installed ~~~~~~~~~~~~~~~~"
