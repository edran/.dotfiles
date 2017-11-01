#!/bin/bash

function p_info () {
        echo "$(tput bold)$(tput setaf 2)[i] $1$(tput sgr0)"
}

set -e

command -v ansible > /dev/null 2>&1
if [ $? -ne 0 ];
then
        p_info "Installing ansible..."
        sudo apt-get update -qq
        sudo apt-get install -qq ansible git
fi

if [ ! -d "$HOME/.dotfiles" ];
then
        p_info "Cloning dotfiles..."
        git clone https://github.com/edran/.dotfiles.git "$HOME/.dotfiles" --recursive
        pushd $HOME/.dotfiles
        git remote remove origin
        git remote add origin git@github.com:edran/.dotfiles
        popd
fi

pushd "$HOME/.dotfiles/"

# if [ -z "$TRAVIS_OS_NAME" ]; then
#    echo "Travis detected!"
#    sudo ansible-galaxy install -r ansible/requirements.yml
#    sudo ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
# else
#    sudo ansible-galaxy install -r ansible/requirements.yml
#    ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
# fi

popd  # getting out of repo

p_info "All done!"
