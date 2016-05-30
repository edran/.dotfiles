#!/bin/bash

set -e
set -u

. ./common.sh

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

sudo pip install -yq ansible

print_gr "DONE\n"
