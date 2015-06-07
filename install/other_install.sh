#!/bin/bash

if [ -z "$(which cmus)" ] ; then
    echo "++++++ Installing cmus"
    sudo apt-get install cmus
else
    echo "====== Cmus is already installed"
fi
