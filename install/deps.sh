#!/bin/bash

set -e
set -u

DEBIAN_FRONTEND=noninteractive

sudo apt-get -y install python3-pip

sudo pip3 install -y --upgrade pip
sudo pip3 install -y plumbum
sudo pip3 install -y yaml
