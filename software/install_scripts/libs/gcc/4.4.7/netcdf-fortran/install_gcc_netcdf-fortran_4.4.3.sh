#!/bin/bash -e

module purge
module load mpi/gcc/openmpi/1.10.1
module load libs/gcc/4.4.7/openmpi/1.10.1/hdf5/1.8.16

version=4.4.3
install_dir=/usr/local/packages6/libs/gcc/4.4.7/openmpi/1.10.1/netcdf-fortran/$version
mkdir -p $install_dir

rm -r /scratch/cs1sjm/netcdf
mkdir -p /scratch/cs1sjm/netcdf
cd /scratch/cs1sjm/netcdf

filename=netcdf-fortran-$version.tar.gz
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/$filename
tar -xzf $filename
cd netcdf-fortran-$version

env CC=gcc FC=h5pfc F90=h5pfc CFLAGS="-fpic" ./configure --prefix=$install_dir

make 2>&1 | tee make.log
make check 2>&1 | tee make-check.log
make install 2>&1 | tee make-install.log
