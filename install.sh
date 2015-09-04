#!/bin/bash

set -e
set -u

. install/common.sh

BACKUP="$HOME/.home_backup"
DOTF="$(pwd)"

if [[ ! "$DOTF" == *.dotfiles ]]; then
    print_rd "Please run this script from the .dotfiles directory\n"
    print_rd "cd .dotfiles; ./install.sh\n"
    exit 1
fi

if [[ $UID != 0 ]]; then
    print_rd "Please run this script with sudo:\n"
    print_rd "sudo $0 $*\n"
    exit 1
fi

print_yl "This script is going to remove many files in your home.\n"
print_yl "Are you sure you want to run it? [Y,n]"
read -p " " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo # for newline
    exit 1
fi

echo # for newline

print_bl "~~~~~~~~~~~~ Backupping home config files... ~~~~~~~~~~~~\n"

backup_file () {
    if [[ ! -f "$1" && ! -d "$1" ]]; then
        print_rd "Tried backing up $1, but file does not exists!\n"
    else
        mv -v $1 $BACKUP
    fi
}

# Creating / Cleaning up backup folder
if [ ! -d "$BACKUP" ]; then
    mkdir -v $BACKUP
else
    rm -rf $BACKUP
    mkdir -v $BACKUP
fi

backup_file $HOME/.inputrc
backup_file $HOME/.profile
backup_file $HOME/.gitconfig
backup_file $HOME/.bashrc
backup_file $HOME/.bash_aliases
backup_file $HOME/bin
backup_file $HOME/.config
backup_file $HOME/.fonts

print_bl "~~~~~~~~~~~~~~~~~~~ Linking dotfiles ~~~~~~~~~~~~~~~~~~~~\n"
ln -sv $DOTF/inputrc $HOME/.inputrc
ln -sv $DOTF/profile $HOME/.profile
ln -sv $DOTF/gitconfig $HOME/.gitconfig
ln -sv $DOTF/bashrc $HOME/.bashrc
ln -sv $DOTF/bin $HOME/bin
ln -sv $DOTF/config $HOME/.config
ln -sv $DOTF/fonts $HOME/.fonts

print_gr "~~~~~~~~~~~~~~ Home folder set up correctly ~~~~~~~~~~~~~\n"


print_bl "~~~~~~~~~~~~~~~~ Installing dependencies ~~~~~~~~~~~~~~~~\n"
. ./install/install_dependencies.sh
install_dependencies
print_gr "~~~~~~~~~~~~~ Everything has been installed ~~~~~~~~~~~~~\n"
