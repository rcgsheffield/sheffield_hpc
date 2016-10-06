#!/bin/bash

install_dir=/usr/local/packages6/hdf5/pgi-15.7/hdf5-1.8.15-patch1
mkdir -p $install_dir

tar -xzf hdf5-1.8.15-patch1.tar.gz
cd hdf5-1.8.15-patch1

module load compilers/pgi/15.7 
module load mpi/pgi/openmpi/1.8.8

env CC=mpicc FC=mpif90 LDFLAGS=-lnuma CPP=cpp ./configure --enable-fortran --enable-fortran2003 --enable-production --enable-unsupported --enable-parallel --enable-cxx --with-zlib --with-szlib --prefix=$i
nstall_dir

make
make install
