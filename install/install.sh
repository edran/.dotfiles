#!/bin/bash

set -u
set -e # sigh

. install/common.sh

PATH_BACKUP="$HOME/.home_backup"
PATH_DOTFILES="~/.dotfiles"
PATH_BACKUP_FILE="$PATH_DOTFILES/install/backup.txt"
PATH_LINK_FILE="$PATH_DOTFILES/install/link.txt"

backup_everything () {
    # Creating / Cleaning up backup folder
    if [ ! -d "$BACKUP" ]; then
        mkdir -v $PATH_BACKUP
    else
        rm -rf $PATH_BACKUP
        mkdir -v $PATH_BACKUP
    fi

    IFS=$'\r\n' GLOBIGNORE='*' command eval  'BKPS=($(cat $PATH_BACKUP_FILE))'

    for i in "${BKPS[@]}"
    do
        backup_file $HOME/$i
    done
}

link_everything () {
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'LINKS=($(cat $PATH_LINK_FILE))'

    for i in "${LINKS[@]}"
    do
        arr=( $i )
        ln -sv $PATH_DOTFILES/${arr[0]} $HOME/${arr[1]}
    done
}

# -------------------------------

initial_check

print_bl "---- Backupping home config files\n"

backup_everything

print_bl "---- Linking dotfiles \n"

link_everything

print_gr "---- Home folder set up correctly\n"

print_bl "---- Configuring fonts\n"

. ./config_fonts.sh
config_fonts.sh

print_gr "---- Everything has been installed\n"
