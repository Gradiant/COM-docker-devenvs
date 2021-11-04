
#! /usr/bin/env bash
# This script is intended to install ldpc simd library from the sdrmakerspace.
# https://gitlab.com/librespacefoundation/sdrmakerspace/ldpc_simd
# Copyright 2020 Centro Tecnolóxico de Telecomunicacións de Galicia (Gradiant)

wget https://gitlab.com/librespacefoundation/sdrmakerspace/ldpc_simd/-/archive/master/ldpc_simd-master.tar.gz
tar xzvf ldpc_simd-master.tar.gz
cd ldpc_simd-master
mkdir build
cd build
cmake ..
make
sudo make install 
cd ..
cd ..
rm ldpc_simd-master.tar.gz
# echo "---- arrayfire Download  ----"
