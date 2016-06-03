#!/bin/bash

set -u
set -e # sigh

. ./common.sh

PATH_BACKUP="$HOME/.home_backup"
PATH_DOTFILES=$(pwd)/../

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

print_bl "~~~~ Running ansible\n"

. ./ansible_install.sh

ansible_install $PATH_DOTFILES

print_gr "~~~~ ALL DONE!\n"
