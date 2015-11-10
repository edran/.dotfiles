set -e
set -u

. install/common.sh

# Works for 1 package too
install_packages () {
    array=()
    for i in "$@"
    do
        if [ -z "$(which $i)" ] ; then
            array+=($i)
        else
            print_yl "$i is already installed\n"
        fi
    done
    if [ ${#array[@]} -gt 0 ] ; then
	print_bl "Installing ${array[@]} \n"
	sudo apt-get install "${array[@]}"
    fi
}

install_emacs () {
    local VERSION="24.5"
    if [ -z "$(which emacs)" ] ; then
        print_bl "Installing emacs (from source)\n"
        sudo apt-get build-dep emacs24 curl
        curl http://ftp.heanet.ie/mirrors/gnu/emacs/emacs-$VERSION.tar.gz | tar -zxv
        cd emacs-$VERSION
        ./configure
        make
        sudo make install
        cd ..
        rm -rf emacs-$VERSION/

    else
        print_yl "emacs is already installed\n"
    fi
}

install_ag () {
    if [ -z "$(which ag)" ] ; then
        print_bl "Installing ag\n"
        sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev \
            liblzma-dev
        git clone https://github.com/ggreer/the_silver_searcher
        cd the_silver_searcher
        ./build.sh
        sudo make install
        cd ..
        sudo rm -rf the_silver_searcher
    else
        print_yl "ag is already installed\n"
    fi
}

install_xcape () {
    if [ -z "$(which xcape)" ] ; then
        print_bl "Installing xcape\n"
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
        print_yl "xcape is already installed\n"
    fi
}

install_idea () {
    local VERSION="14.1.4"
    if [ -z "$(which idea)" ] ; then
        print_bl "Installing Idea\n"
        sudo apt-get install openjdk-7-jre openjdk-7-jdk
        wget -O ~/.dotfiles/bin/intellij.tar.gz \
            http://download.jetbrains.com/idea/ideaIC-"$(VERSION)".tar.gz
        mkdir ~/.dotfiles/bin/idea-dir
        tar xfz ~/.dotfiles/bin/intellij.tar.gz -C ~/.dotfiles/bin/idea-dir
        rm -v ~/.dotfiles/bin/intellij.tar.gz
    else
        print_yl "Idea is already installed\n"
    fi
}

install_gcc () {
    if [ -z "$(which gcc-4.8)" ] ; then
        print_bl "Installing GCC 4.8\n"
        sudo apt-get install gcc-4.8 g++-4.8
        sudo update-alternatives --install /usr/bin/gcc gcc \
            /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8
    else
        print_yl "GCC 4.8 is already installed\n"
    fi

    if [ -z "$(which gcc-4.9)" ] ; then
        print_bl "Installing GCC 4.9\n"
        sudo apt-get install build-essential
        sudo add-apt-repository ppa:ubuntu-toolchain-r/test
        sudo apt-get update
        sudo apt-get install gcc-4.9 g++-4.9 cpp-4.9
        sudo update-alternatives --install /usr/bin/gcc gcc \
            /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
    else
        print_yl "GCC 4.9 is already installed\n"
    fi
}

install_git () {
    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git
}

install_ros () {
    if [ ! -d /opt/ros/indigo/ ] ; then
        print_bl "Installing ROS\n"
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu \
$(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net \
            --recv-key 0xB01FA116
        sudo apt-get update
        sudo apt-get install ros-indigo-desktop-full python-wstool \
            python-rosinstall
    else
        print_yl "ROS is already installed\n"
    fi
}

install_python () {
    sudo apt-get install python-pip
    sudo pip install --upgrade pip
    sudo pip install virtualenv
}

install_dependencies () {
    install_git
    install_emacs
    install_ag
    install_xcape
    install_gcc
    install_ros
    install_python
    # install_idea
    # TODO xmonad/haskell stuff here
    # TODO pyenv
    install_packages \
        redshift \
        vim \
        htop \
        terminator \
        virtualbox \
        powertop \
        octave \
        texlive-full auctex tex-gyre \
        cmus
}
