
#! /usr/bin/env bash
# http://itpp.sourceforge.net/4.3.1/installation.html
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)


ITPP_VERSION=4.3.1

if ! [ $(id -u) = 0 ]; then
    echo "The script need to be run as root." >&2
    exit 1
fi

if [ $SUDO_USER ]; then
    REAL_USER=$SUDO_USER
else
    REAL_USER=$(whoami)
fi

echo "---- itpp expected version v${ITPP_VERSION}"
echo "---- This script must be updated to change the version. ----"
sudo -u $REAL_USER wget https://sourceforge.net/projects/itpp/files/itpp/${ITPP_VERSION}/itpp-${ITPP_VERSION}.tar.bz2/download -o download.tar.gz
#dowload is the default name of the downloaded file
sudo -u $REAL_USER bzip2 -cd download | tar xf -
cd itpp-${ITPP_VERSION}
sudo -u $REAL_USER mkdir build
cd build
sudo -u $REAL_USER cmake ..
sudo -u $REAL_USER make
sudo make install
cd ..
cd ..

# directory where the library is installed
ldconfig /usr/local/lib



