#!/usr/bin/env bash
# This script is intended to install GCC/G++ 10
# Copyright 2021 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

if ! [ $(id -u) = 0 ]; then
    echo "The script need to be run as root." >&2
    exit 1
fi

apt-get install -y -qq gcc-10 g++-10
