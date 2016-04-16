#!/bin/bash -e

module purge

version=1.4
install_dir=/usr/local/packages6/apps/gcc/4.4.7/relion/$version

rm -rf /scratch/sa_cs1ab/relion
mkdir -p /scratch/sa_cs1ab/relion
cd /scratch/sa_cs1ab/relion

wget http://www2.mrc-lmb.cam.ac.uk/groups/scheres/1sep15/relion-1.4.tar.bz2
tar -xjf relion-1.4.tar.bz2

cd relion-1.4

module load mpi/gcc/openmpi/1.8.8
./configure --enable-mpi --prefix=$install_dir
make
make install


