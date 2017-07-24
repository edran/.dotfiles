#!/bin/bash

set -e

if [ -d "$HOME/.dotfiles" ]; then
    echo "[E] Some .dotfiles are already installed!"
    echo "[E] Exiting!"
    exit 1
fi

echo "[i] Updating and installing ansible dependencies..."
{
    sudo apt-get update -qq
    sudo apt-get install -qq \
         build-essential \
         sudo \
         fontconfig \
         git \
         libyaml-dev \
         libffi-dev \
         libssl-dev \
         python \
         python-dev \
         python-pip
    sudo apt-get clean
} > /dev/null 2>&1

{
yes | sudo pip install setuptools --upgrade
yes | sudo pip install -q ansible
} > /dev/null 2>&1

echo "[i] Installing edran/.dotfiles..."

git clone https://github.com/edran/.dotfiles.git "$HOME/.dotfiles" --recursive
cd "$HOME/.dotfiles/"

if [ -z "$TRAVIS_OS_NAME" ]; then
    echo "Travis detected!"
    sudo ansible-galaxy install -r ansible/requirements.yml
    sudo ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
else
    sudo ansible-galaxy install -r ansible/requirements.yml
    ansible-playbook -i ansible/inventory ansible/ubuntu.yml --ask-become-pass
fi
