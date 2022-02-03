#! /usr/bin/env bash
# This script is intended to install OpenMP from source
# Copyright 2022 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

OPENMP_VERSION=13.0.1

echo "---- OpenMP v${OPENMP_VERSION} Installation Script ----"

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
echo "1. Downloading OpenMP v${OPENMP_VERSION}"

sudo -u $REAL_USER curl -o OpenMP-${OPENMP_VERSION}.tar.gz -L https://github.com/llvm/llvm-project/releases/download/llvmorg-${OPENMP_VERSION}/openmp-${OPENMP_VERSION}.src.tar.xz
sudo -u $REAL_USER tar xvf OpenMP-${OPENMP_VERSION}.tar.gz

cd OpenMP-${OPENMP_VERSION}.src

echo " "
echo " "
echo " "
echo "2. Building OpenMP v${OPENMP_VERSION}"

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
echo "3. Installing OpenMP v${OPENMP_VERSION}"

make install

ldconfig

echo " "
echo " "
echo " "
echo "Installation complete"
