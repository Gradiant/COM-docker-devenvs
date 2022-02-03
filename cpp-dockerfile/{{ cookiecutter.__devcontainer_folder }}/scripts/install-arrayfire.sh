#! /usr/bin/env bash
# This script is intended to install arrayfire library.
# https://github.com/arrayfire/arrayfire/wiki/Build-Instructions-for-Linux for more options and
# possible configurations.
#
# Copyright 2022 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

ARRAYFIRE_VERSION=3.8.1

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
echo "1. Installing prerequisites"

apt-get install -y -qq --no-install-recommends build-essential software-properties-common libfreeimage-dev cmake-curses-gui libopenblas-dev libfftw3-dev liblapacke-dev libglfw3-dev libfontconfig1-dev

# TODO 20220124-aferreiro Make Boost installation independent
sudo -u $REAL_USER wget https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz
sudo -u $REAL_USER tar xf boost_1_78_0.tar.gz
cp -r boost_1_78_0/boost /usr/local/include

# # TODO 20220124-aferreiro Make CUDA toolkit installation independent
# sudo -u $REAL_USER wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
# mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
# apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
# add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
# apt-get update
# apt-get install -y --no-install-recommends -qq cuda

echo " "
echo " "
echo " "
echo "2. Downloading Arrayfire v${ARRAYFIRE_VERSION}"

sudo -u $REAL_USER curl -o arrayfire-${ARRAYFIRE_VERSION}.tar.xz -L https://github.com/arrayfire/arrayfire/releases/download/v${ARRAYFIRE_VERSION}/arrayfire-full-${ARRAYFIRE_VERSION}.tar.bz2
sudo -u $REAL_USER tar xvf arrayfire-${ARRAYFIRE_VERSION}.tar.xz

cd arrayfire-full-${ARRAYFIRE_VERSION}

echo " "
echo " "
echo " "
echo "3. Building Arrayfire v${ARRAYFIRE_VERSION}"

sudo -u $REAL_USER mkdir build && cd build
sudo -u $REAL_USER cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DAF_BUILD_EXAMPLES=OFF -DAF_COMPUTE_LIBRARY=BLAS

np=$(nproc)

jobs=$((np / 2))

jobs=$( (($jobs <= 1)) && echo "1" || echo "$jobs")

sudo -u $REAL_USER make -j ${jobs}

echo " "
echo " "
echo " "
echo "4. Installing Arrayfire v${ARRAYFIRE_VERSION}"

make install

ldconfig

echo " "
echo " "
echo " "
echo "Installation complete"
