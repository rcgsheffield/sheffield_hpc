#!/bin/bash

cd /data/$USER
mkdir install_sqlite
cd install_sqlite
wget https://www.sqlite.org/src/sqlite.tar.gz

proj_vers=3.32.3
prefix=/usr/local/packages/libs/sqlite/$proj_vers/gcc-8.2.0
mkdir $prefix

tar -xf sqlite.tar.gz
mkdir bld
cd bld

module load dev/gcc/8.2

../sqlite/configure --prefix=$prefix
make
make sqlite3.c
make test
make install

