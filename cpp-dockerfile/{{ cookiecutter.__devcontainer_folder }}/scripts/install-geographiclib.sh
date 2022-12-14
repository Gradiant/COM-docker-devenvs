#! /usr/bin/env bash
# This script is intended to install geographiclib from source
# Copyright 2022 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

GEOGRAPHICLIB_VERSION=2.1

echo "---- GeographicLib v${GEOGRAPHICLIB_VERSION} Installation Script ----"

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
echo "1. Downloading GeographicLib v${GEOGRAPHICLIB_VERSION}"

sudo -u $REAL_USER curl -o geographiclib-${GEOGRAPHICLIB_VERSION}.tar.gz -L https://sourceforge.net/projects/geographiclib/files/distrib-C++/GeographicLib-${GEOGRAPHICLIB_VERSION}.tar.gz/download
sudo -u $REAL_USER tar xvf geographiclib-${GEOGRAPHICLIB_VERSION}.tar.gz

cd GeographicLib-${GEOGRAPHICLIB_VERSION}

echo " "
echo " "
echo " "
echo "2. Building GeographicLib v${GEOGRAPHICLIB_VERSION}"

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
echo "3. Installing GeographicLib v${GEOGRAPHICLIB_VERSION}"

make install

ldconfig

echo " "
echo " "
echo " "
echo "Installation complete"
