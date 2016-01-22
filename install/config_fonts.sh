#!/bin/bash

install_adobe () {
    mkdir -p ~/.fonts/adobe-fonts/source-code-pro
    git clone https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
    fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
}

config_fonts () {
    install_adobe
}
