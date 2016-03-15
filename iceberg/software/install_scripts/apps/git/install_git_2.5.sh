#!/bin/bash

module load compilers/gcc/5.2 

version=2.5.0
install_dir=/usr/local/packages6/apps/gcc/5.2/git/$version
mkdir -p $install_dir

tar -xzf git-${version}.tar.gz
cd git-${version}
make configure
./configure --prefix=$install_dir
make all
make install
