#!/bin/bash

set -u

backup_file () {
    if [[ ! -f "$1" && ! -d "$1" ]]; then
        print_rd "Tried backing up $1, but file does not exists!\n"
    else
        mv -v $1 $2
    fi
}


initial_check () {
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
}

# ------------- PRINTING

RED='\033[0;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_bl () {
    echo -en "${BLUE}"
    printf "$1"
    echo -en "${NC}"
}

print_gr () {
    echo -en "${GREEN}"
    printf "$1"
    echo -en "${NC}"
}

print_rd () {
    echo -en "${RED}"
    printf "$1"
    echo -en "${NC}"
}

print_yl () {
    echo -en "${YELLOW}"
    printf "$1"
    echo -en "${NC}"
}
