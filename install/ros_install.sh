#!/bin/bash

if [ -z "$(which roscore)" ] ; then
    echo "++++++ Installing ROS"
    sudo sh -c \
    'echo "deb http://packages.ros.org/ros/ubuntu precise main" > \
/etc/apt/sources.list.d/ros-latest.list'
    sudo apt-get update
    sudo apt-get install ros-indigo-desktop-full python-wstool
else
    echo "====== ROS Indigo is already installed"
fi
