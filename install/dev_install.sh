#!/bin/bash

set -e

if [ -z "$(which ag)" ] ; then
    echo "++++++ Installing ag"
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev \
        liblzma-dev
    git clone https://github.com/ggreer/the_silver_searcher
    cd the_silver_searcher
    ./build.sh
    sudo make install
    cd ..
    sudo rm -rf the_silver_searcher
else
    echo "====== ag is already installed"
fi

if [ -z "$(which xcape)" ] ; then
    echo "++++++ Installing xcape"
    sudo apt-get install git gcc make pkg-config libx11-dev \
        libxtst-dev libxi-dev
    mkdir xcape
    cd xcape
    git clone https://github.com/alols/xcape.git .
    make
    sudo make install
    cd ..
    rm -rf xcape
else
    echo "====== xcape is already installed"
fi
