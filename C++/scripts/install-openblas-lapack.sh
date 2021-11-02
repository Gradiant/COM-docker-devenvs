#! /usr/bin/env bash
# This script is intended to install LAPACK and openBLAS libraries
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

if ! [ $(id -u) = 0 ]; then
    echo "The script need to be run as root." >&2
    exit 1
fi

if [ $SUDO_USER ]; then
    REAL_USER=$SUDO_USER
else
    REAL_USER=$(whoami)
fi

echo "---- Install openblas ----"
apt-get install -y -qq libopenblas-dev
echo "---- Install lapack ------"
apt-get install -y -qq liblapack-dev
