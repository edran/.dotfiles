#!/usr/bin/env bash

set -e

function err () {
    echo "$(tput bold)$(tput setaf 1)[e] $1$(tput sgr0)"
}


function info () {
    echo "$(tput bold)$(tput setaf 2)[i] $1$(tput sgr0)"
}

function warn () {
    echo "$(tput bold)$(tput setaf 3)[w] $1$(tput sgr0)"
}

GIT_BRANCH="master"
NO_DROPBOX=0

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -b | --branch )
    shift; GIT_BRANCH=$1
    ;;
  -p | --no_dropbox )
    NO_DROPBOX=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

DB_PATH="$HOME/Dropbox"
if [[ NO_DROPBOX -eq 0 ]]; then
  if [ ! -e "$DB_PATH" ]; then
    err "Dropbox path $DB_PATH not detected."
    exit 1
  else
    info "Detected Dropbox directory at $DB_PATH"
  fi
else
  warn "Skipping Dropbox check because of flag"
fi

DOTS_PATH="$HOME/.dotfiles"

info "Installing dotfiles:$GIT_BRANCH at $DOTS_PATH"

if [ ! $(which ansible) ]; then  # ansible not on path
    warn "Ansible not found"
    if [ "$(uname)" == "Darwin" ]; then
        info "Detected MacOS"
        if [ ! $(which brew) ]; then
            warn "Homebrew not found on path"
            info "Installing homebrew..."
            yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            info "Homebrew has been installed"
        else
            info "Detected homebrew"
        fi
        info "Installing ansible..."
        brew install ansible
        brew list git &>/dev/null || brew install git  # just in case
        info "Homebrew has been installed"
    else
        info "Installing ansible repo/package..."
        sudo apt-add-repository ppa:ansible/ansible -y
        sudo apt-get update -qq
        sudo apt-get install -qq ansible git
        info "Homebrew has been installed"
    fi
else
    info "Detected ansible"
fi

if [ ! -d $DOTS_PATH ]; then
    warn "Dotfiles not found"
    info "Cloning dotfiles..."
    git clone https://github.com/edran/.dotfiles.git $DOTS_PATH --branch $GIT_BRANCH --recursive
    pushd $DOTS_PATH > /dev/null
    git remote remove origin
    git remote add origin git@github.com:edran/.dotfiles
    info "Updated dotfiles remote to use ssh"
    popd > /dev/null
else
    info "Detected dotfiles at $DOTS_PATH"
fi

info "Starting ansible playbook..."
pushd "$HOME/.dotfiles/" > /dev/null
ANSIBLE_NOCOWS=1 ansible-playbook -i ansible/inventory ansible/full.yml --ask-become-pass
popd > /dev/null  # getting out of repo

info "All done!"
