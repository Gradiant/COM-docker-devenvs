#!/usr/bin/env bash
# This script is intended to install PROJ
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

PROJ_VERSION=9.0.1

echo "---- PROJ Installation Script ----"

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
echo "0. Installing prerequisites"
apt-get install -y sqlite3 libtiff-dev libcurl4-openssl-dev libsqlite3-dev pkg-config

echo " "
echo " "
echo " "
echo "1. Downloading PROJ v${PROJ_VERSION}"

sudo -u $REAL_USER curl -o proj-${PROJ_VERSION}.tar.gz -L https://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz
sudo -u $REAL_USER tar xvf proj-${PROJ_VERSION}.tar.gz

cd proj-${PROJ_VERSION}

echo " "
echo " "
echo " "
echo "2. Building PROJ v${PROJ_VERSION}"

mkdir build
cd build

cmake ..
cmake --build .

echo " "
echo " "
echo " "
echo "3. Installing PROJ v${PROJ_VERSION}"

cmake --build . --target install

echo " "
echo " "
echo " "
echo "4. Installing PROJ data"

ldconfig

projsync --system-directory --all

ldconfig

echo " "
echo " "
echo " "
echo "Installation complete"
