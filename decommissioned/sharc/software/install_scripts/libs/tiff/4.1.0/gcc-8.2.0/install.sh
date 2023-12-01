#!/bin/bash

cd /data/$USER
mkdir install_tiff
cd install_tiff
wget http://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz

proj_vers=4.1.0
prefix=/usr/local/packages/libs/tiff/$proj_vers/gcc-8.2.0
mkdir $prefix

tar -xf tiff-4.1.0.tar.gz
cd tiff-4.1.0

module load dev/gcc/8.2

./configure --prefix=$prefix
make
make install

