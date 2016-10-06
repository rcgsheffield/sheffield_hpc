#!/bin/bash

module load compilers/gcc/5.2

install_dir=/usr/local/packages6/apps/gcc/5.2/povray/3.7/
mkdir -p $install_dir

tar -xzf ./povray-3.7.0.0.tar.gz
cd povray-3.7.0.0/unix/
./prebuild.sh
cd ./../
./configure --prefix=$install_dir COMPILED_BY="Mike Croucher" --with-boost=/usr/local/packages6/libs/gcc/5.2/boost/1.59.0/
make
make check
make install
