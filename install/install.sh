#!/bin/bash

function p_err () {
    echo "$(tput bold)$(tput setaf 1)[i] $1$(tput sgr0)"
}


function p_info () {
    echo "$(tput bold)$(tput setaf 2)[i] $1$(tput sgr0)"
}

function p_warn () {
    echo "$(tput bold)$(tput setaf 3)[i] $1$(tput sgr0)"
}


command -v ansible > /dev/null 2>&1

if [ $? -ne 0 ];
then
    p_info "Installing ansible..."
    sudo apt-add-repository ppa:ansible/ansible -qq
    sudo apt-get update -qq
    sudo apt-get install -qq ansible git
fi

# for TravisCI purposes
if [ -z "$GIT_BRANCH"]; then
    GIT_BRANCH="master"
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

pushd "$HOME/.dotfiles/" > /dev/null

if [ ! -z "$TRAVIS_OS_NAME" ]; then
   p_warn "Travis detected!"
   sudo ansible-galaxy install -r ansible/requirements.yml
   ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
else
   sudo ansible-galaxy install -r ansible/requirements.yml
   ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
fi

popd > /dev/null  # getting out of repo

p_info "All done!"
