#! /usr/bin/env bash
# This script is intended to install GDAL from source
# Copyright 2022 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

GDAL_VERSION=3.4.1

echo "---- GDAL v${GDAL_VERSION} Installation Script ----"

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
echo "1. Downloading GDAL v${GDAL_VERSION}"

sudo -u $REAL_USER curl -o gdal-${GDAL_VERSION}.tar.gz -L https://github.com/OSGeo/gdal/archive/v${GDAL_VERSION}.tar.gz
sudo -u $REAL_USER tar xvf gdal-${GDAL_VERSION}.tar.gz

cd gdal-${GDAL_VERSION}/gdal

echo " "
echo " "
echo " "
echo "2. Building GDAL v${GDAL_VERSION}"

./configure
make clean

np=$(nproc)

jobs=$((np / 2))

jobs=$( (($jobs <= 1)) && echo "1" || echo "$jobs")

sudo -u $REAL_USER make -j ${jobs}

echo " "
echo " "
echo " "
echo "3. Installing GDAL v${GDAL_VERSION}"

make install
ldconfig

echo " "
echo " "
echo " "
echo "Installation complete"
