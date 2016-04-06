#!/bin/bash

set -u
set -e # sigh

. ./common.sh

PATH_BACKUP="$HOME/.home_backup"
PATH_DOTFILES=$(pwd)/../
PATH_BACKUP_FILE="$PATH_DOTFILES/install/backup.txt"
PATH_LINK_FILE="$PATH_DOTFILES/install/link.txt"

backup_everything () {
    # Creating / Cleaning up backup folder
    if [ ! -d "$PATH_BACKUP" ]; then
        mkdir -v $PATH_BACKUP
    else
        rm -rf $PATH_BACKUP
        mkdir -v $PATH_BACKUP
    fi

    IFS=$'\r\n' GLOBIGNORE='*' command eval  'BKPS=($(cat $PATH_BACKUP_FILE))'

    for i in "${BKPS[@]}"
    do
        backup_file $HOME/$i $PATH_BACKUP
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

OPTIND=1
no_check=false

while getopts "h?n" opt; do
    case "$opt" in
        h|\?)
            echo "Usage:\n    `sudo ./install.sh`"
            exit 0
            ;;
        n)  no_check=true
            ;;
    esac
done

shift $((OPTIND-1))

set +u
[ "$1" = "--" ] && shift
set -u

if [ "$no_check" == false ] ; then
    initial_check
fi

print_bl "~~~~ Backupping home config files\n"

backup_everything

print_bl "~~~~ Linking dotfiles \n"

link_everything

print_gr "~~~~ Home folder set up correctly\n"

print_bl "~~~~ Configuring fonts\n"

. ./config_fonts.sh
config_fonts

print_gr "~~~~ Everything has been installed\n"
