#!/bin/bash
. ./common.sh

set -e
set -u

print_bl "Checking dependencies..."
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

yes | sudo pip install setuptools --upgrade
yes | sudo pip install -q ansible

print_gr "DONE\n"
