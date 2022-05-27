#! /usr/bin/env bash
# This script is intended to install Ettus UHD drivers
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

UHD=4.1.0.5
echo "---- UHD v${UHD} Installation Script ----"
if ! [ $(id -u) = 0 ]; then
    echo "The script need to be run as root." >&2
    exit 1
fi
if [ $SUDO_USER ]; then
    REAL_USER=$SUDO_USER
else
    REAL_USER=$(whoami)
fi
# Enable exit on error
set -e
echo " "
echo " "
echo " "
echo "1. Setting up prerequisites"
apt-get install -y autoconf automake build-essential ccache cpufrequtils doxygen ethtool \
inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml
echo " "
echo " "
echo " "
echo "2. Downloading UHD v${UHD}"
sudo -u $REAL_USER curl -o uhd-${UHD}.tar.gz -L https://github.com/EttusResearch/uhd/archive/refs/tags/v${UHD}.tar.gz
sudo -u $REAL_USER tar xvf uhd-${UHD}.tar.gz
cd uhd-${UHD}/host
echo " "
echo " "
echo " "
echo "3. Building UHD v${UHD}"
sudo -u $REAL_USER mkdir build
cd build
sudo -u $REAL_USER cmake ..
np=$(nproc)
jobs=$((np / 2))
jobs=$( (($jobs <= 1)) && echo "1" || echo "$jobs")
sudo -u $REAL_USER make -j ${jobs}
echo " "
echo " "
echo " "
echo "4. Installing UHD v${UHD}"
make install
ldconfig
echo " "
echo " "
echo " "
echo "5. Downloading UHD v${UHD} images"
uhd_images_downloader
echo " "
echo " "
echo " "
echo "Installation complete"
