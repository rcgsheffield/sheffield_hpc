#!/bin/bash

version=7.47.1
install_dir=/usr/local/packages6/libs/gcc/4.4.7/curl/$version


tar -xzf ./curl-$version.tar.gz
cd curl-$version
./configure --prefix=$install_dir
make
make install
