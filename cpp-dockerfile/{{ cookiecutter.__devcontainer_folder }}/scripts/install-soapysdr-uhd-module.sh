#! /usr/bin/env bash
# This script is intended to install Soapy SDR UHD module UHD module
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)
UHDMODULE=0.4.1
echo "---- Soapy SDR UHD module v${UHDMODULE} Installation Script ----"
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
apt-get install -y libpython3-dev python3-numpy swig
echo " "
echo " "
echo " "
echo "2. Downloading Soapy SDR UHD module v${UHDMODULE}"

sudo -u $REAL_USER curl -o soapysdr-uhd-module-${UHDMODULE}.tar.gz -L https://github.com/pothosware/SoapyUHD/archive/refs/tags/soapy-uhd-${UHDMODULE}.tar.gz
sudo -u $REAL_USER tar xvf soapysdr-uhd-module-${UHDMODULE}.tar.gz
cd SoapyUHD-soapy-uhd-${UHDMODULE}
echo " "
echo " "
echo " "
echo "3. Building Soapy SDR UHD module v${UHDMODULE}"
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
echo "4. Installing Soapy SDR UHD module v${UHDMODULE}"
make install
ldconfig
echo " "
echo " "
echo " "
echo "Installation complete"