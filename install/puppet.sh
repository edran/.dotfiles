#!/bin/bash

install_puppet () {
    wget "http://apt.puppetlabs.com/puppetlabs-release-trusty.deb" -O /tmp/puppetlabs-release-trusty.deb
    sudo dpkg -i /tmp/puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get install puppet git-core
    sudo rm -rf /etc/puppet
}

puppet_sync () {
    echo ""
}
