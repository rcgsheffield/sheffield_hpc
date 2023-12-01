#!/bin/bash

install_dir=/usr/local/packages/libs/hdf5/1.10.4/gcc-8.2.0
mkdir -p $install_dir

tar -xzf hdf5-1.10.4.tar.gz
cd hdf5-1.10.4

module load dev/gcc/8.2 

./configure --enable-fortran --enable-cxx --prefix=/usr/local/packages/libs/hdf5/1.10.4/gcc-8.2.0/

make
make check
make install
