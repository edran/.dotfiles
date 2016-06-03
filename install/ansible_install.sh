#!/bin/bash

set -e
set -u

# requires $1 to be dotfiles dir
ansible_install () {
    ansible-galaxy install -r $1/ansible/requirements.yml
    ansible-playbook -i $1/ansible/inventory $1/ansible/ubuntu.yml --sudo
}
