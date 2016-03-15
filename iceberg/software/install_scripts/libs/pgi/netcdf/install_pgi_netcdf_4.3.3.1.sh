#!/bin/bash

module load compilers/pgi/15.7
module load mpi/pgi/openmpi/1.8.8
module load libs/hdf5/pgi/1.8.15-patch1

install_dir=/usr/local/packages6/libs/pgi/netcdf/4.3.3.1
mkdir -p $install_dir

tar -xzf netcdf-c-4.3.3.1.tar.gz
cd netcdf-c-4.3.3.1

env CPP=cpp CC=mpicc CXX=mpicxx FC=mpif90 F90=mpif90 CPPFLAGS="-DpgiFortran" CFLAGS="-fpic" ./configure --prefix=$install_dir

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
make install 2>&1 | tee make-install.log
