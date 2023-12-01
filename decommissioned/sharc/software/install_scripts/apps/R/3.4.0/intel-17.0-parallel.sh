#!/bin/bash -e
#$ -l rmem=8G
module load dev/intel-compilers/17.0.0

#Set up environment variables and create directories
version=3.4.0
install_dir=/usr/local/packages/apps/R/$version/intel-17.0-parallel
build_dir=~/R-intel_build_parallel_$version
mkdir -p $build_dir
mkdir -p $install_dir

cd $build_dir
#Download, untar and enter build directory
wget https://cran.r-project.org/src/base/R-3/R-$version.tar.gz
tar -xzf ./R-$version.tar.gz
cd R-$version

export CC=icc
export CFLAGS="-O3 -xHOST -axCORE-AVX-I,CORE-AVX2 -fp-model precise"
export FC=ifort
export F77=ifort
export FFLAGS="-O3 -xHOST -axCORE-AVX-I,CORE-AVX2 -fp-model precise"
export FCFLAGS="-O3 -xHOST -axCORE-AVX-I,CORE-AVX2 -fp-model precise"
export CXX=icpc
export CXXFLAGS="-std=c++11 -O3 -xHOST -axCORE-AVX-I,CORE-AVX2 -fp-model precise"
 
./configure --prefix=$install_dir --with-blas=-mkl=parallel --with-lapack=-mkl=parallel --enable-R-shlib | tee config-R-$version.log
make 2>&1 | tee make-R-$version.log

#Check
make check 2>&1 | tee make_check-R-$version.log
make install 2>&1 | tee make_check-R-$version.log

#Tests
make install-tests
cd tests
../bin/R CMD make check 2>&1 | tee make_install_tests-R-$version.log
