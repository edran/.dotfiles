#!/usr/bin/env bash

set -e

function p_err () {
    echo "$(tput bold)$(tput setaf 1)[e] $1$(tput sgr0)"
}


function p_info () {
    echo "$(tput bold)$(tput setaf 2)[i] $1$(tput sgr0)"
}

function p_warn () {
    echo "$(tput bold)$(tput setaf 3)[w] $1$(tput sgr0)"
}

# for TravisCI purposes, first argument specifies branch
if [ $# -eq 0 ]; then
    GIT_BRANCH="master"
else
    GIT_BRANCH=$1
fi

DOTS_PATH="$HOME/.dotfiles"

p_info "Installing dotfiles:$GIT_BRANCH at $DOTS_PATH"

if [ ! $(which ansible) ]; then  # ansible not on path
    p_warn "Ansible not found"
    p_warn "Attempting to install ansible..."
    if [ "$(uname)" == "Darwin" ]; then
        p_info "Detected MacOS!"
        if [ ! $(which brew) ]; then
            p_warn "Homebrew not found on path"
            p_info "Installing homebrew..."
            yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        else
            p_info "Found homebrew on PATH"
        fi
        p_info "Installing ansible package..."
        brew install ansible
        brew list git &>/dev/null || brew install git  # just in case
    else
        sudo apt-add-repository ppa:ansible/ansible -y
        sudo apt-get update -qq
        sudo apt-get install -qq ansible git
    fi
else
    p_info "Found ansible on PATH"
fi

if [ ! -d $DOTS_PATH ]; then
    p_warn "Dotfiles repository not found"
    p_info "Cloning dotfiles..."
    git clone https://github.com/edran/.dotfiles.git $DOTS_PATH --branch $GIT_BRANCH --recursive
    pushd $DOTS_PATH > /dev/null
    p_info "Point dotfiles repo to "
    git remote remove origin
    git remote add origin git@github.com:edran/.dotfiles
    popd > /dev/null
else
    p_info "Found dotfiles at $DOTS_PATH"
fi

# setting for ansible

pushd "$HOME/.dotfiles/" > /dev/null

ansible-playbook -i ansible/inventory ansible/full.yml --ask-become-pass

popd > /dev/null  # getting out of repo

p_info "All done!"
