#! /usr/bin/env bash
# This script is intended to install arrayfire library.
# https://github.com/arrayfire/arrayfire/wiki/Build-Instructions-for-Linux
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

# FIXME 20211104-aferreiro Add installation from source to ensure a specific version gets installed

if ! [ $(id -u) = 0 ]; then
    echo "The script need to be run as root." >&2
    exit 1
fi

apt-key adv --fetch-key https://repo.arrayfire.com/GPG-PUB-KEY-ARRAYFIRE-2020.PUB
echo "deb [arch=amd64] https://repo.arrayfire.com/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/arrayfire.list

apt-get update

apt-get install -y -qq gnupg2 ca-certificates apt-utils software-properties-common
apt-get install -y -qq arrayfire

# echo "---- arrayfire Download  ----"
