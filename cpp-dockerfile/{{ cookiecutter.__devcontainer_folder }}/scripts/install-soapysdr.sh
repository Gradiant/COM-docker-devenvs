#! /usr/bin/env bash
# This script is intended to install SoapySDR drivers
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)
SOAPYSDR=0.8.1
echo "---- SoapySDR v${SOAPYSDR} Installation Script ----"
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
apt-get install -y libpython3-dev python3-numpy swig python3-distutils
echo " "
echo " "
echo " "
echo "2. Downloading SoapySDR v${SOAPYSDR}"
sudo -u $REAL_USER curl -o soapysdr-${SOAPYSDR}.tar.gz -L https://github.com/pothosware/SoapySDR/archive/refs/tags/soapy-sdr-${SOAPYSDR}.tar.gz
sudo -u $REAL_USER tar xvf soapysdr-${SOAPYSDR}.tar.gz
cd SoapySDR-soapy-sdr-${SOAPYSDR}
echo " "
echo " "
echo " "
echo "3. Building SoapySDR v${SOAPYSDR}"
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
echo "4. Installing SoapySDR v${SOAPYSDR}"
make install
ldconfig
echo " "
echo " "
echo " "
echo "Installation complete"
