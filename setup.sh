#!/bin/bash

sudo apt update

# Setup your computer to accept software from packages.ros.org. 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Installation
sudo apt update
sudo apt install ros-noetic-desktop-full

# Enviroment setup
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential


# Initialize rosdep
sudo apt install python3-rosdep
sudo rosdep init
rosdep update


#####################################################
###############  OPENCV INSTALLATION  ###############
#####################################################

# Create Python 3 virtual environment
sudo apt-get install python3-venv
mkdir venvs
cd venvs
python3 -m venv cv_venv
source cv_venv/bin/activate

cd

# Install OpenCV
sudo apt-get install python3-opencv

# Install OpenCV dependencies
sudo apt-get install cmake
sudo apt-get install gcc g++

sudo apt-get install python3-dev python3-numpy

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

sudo apt-get install libgtk-3-dev

sudo apt-get install libpng-dev
sudo apt-get install libjpeg-dev
sudo apt-get install libopenexr-dev
sudo apt-get install libtiff-dev
sudo apt-get install libwebp-dev

sudo apt-get install git
git clone https://github.com/opencv/opencv.git

cd opencv

mkdir build
cd build

cmake ../

make
sudo make install