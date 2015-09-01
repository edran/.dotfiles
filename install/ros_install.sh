#!/bin/bash

if [ -z "$(which roscore)" ] ; then
    echo "++++++ Installing ROS"
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu \
$(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
    sudo apt-get update
    sudo apt-get install ros-indigo-desktop-full python-wstool python-rosinstall
else
    echo "====== ROS Indigo is already installed"
fi
