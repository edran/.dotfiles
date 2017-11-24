#!/bin/bash

function p_err () {
    echo "$(tput bold)$(tput setaf 1)[e] $1$(tput sgr0)"
}


function p_info () {
    echo "$(tput bold)$(tput setaf 2)[i] $1$(tput sgr0)"
}

function p_warn () {
    echo "$(tput bold)$(tput setaf 3)[w] $1$(tput sgr0)"
}


command -v ansible > /dev/null 2>&1

if [ $? -ne 0 ];
then
    p_info "Installing ansible..."
    if [ "$(uname)" == "Darwin" ]; then
        # install brew
        TODO
        # install ansible
    else
        sudo apt-add-repository ppa:ansible/ansible -y
        sudo apt-get update -qq
        sudo apt-get install -qq ansible git
    fi
fi

# for TravisCI purposes, first argument specifies branch
if [ $# -eq 0 ]; then
    GIT_BRANCH="master"
else
    GIT_BRANCH=$1
fi

if [ ! -d "$HOME/.dotfiles" ];
then
    p_info "Cloning dotfiles..."
    git clone https://github.com/edran/.dotfiles.git "$HOME/.dotfiles" --recursive --branch $GIT_BRANCH
    pushd $HOME/.dotfiles > /dev/null
    git remote remove origin
    git remote add origin git@github.com:edran/.dotfiles
    popd > /dev/null
fi

# setting for ansible
set -e

pushd "$HOME/.dotfiles/" > /dev/null

if [ ! -z "$TRAVIS_OS_NAME" ]; then
   p_warn "Travis detected!"
fi

ansible-playbook -i ansible/inventory ansible/full.yml --ask-become-pass

popd > /dev/null  # getting out of repo

p_info "All done!"
