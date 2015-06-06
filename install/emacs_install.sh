#!/bin/bash

set -e # errors yeah

VERSION="24.5"

if [ -z "$(which emacs)" ] ; then
    echo "++++++ Installing emacs (from source)"
    sudo apt-get build-dep emacs24 curl
    curl http://ftp.heanet.ie/mirrors/gnu/emacs/emacs-$VERSION.tar.gz | tar -zxv
    cd emacs-$VERSION
    ./configure
    make
    sudo make install
    cd ..
    rm -rf emacs-$VERSION/
    rm emacs-$VERSION.tar.gz
else
    echo "emacs is already installed"
fi

