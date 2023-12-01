#!/bin/bash -e
#$ -l rmem=40G

#Set up environment variables and create directories
version=3.4.0
install_dir=/usr/local/packages/apps/R/$version/gcc-4.8.5/
build_dir=~/R-$version-build
mkdir -p $build_dir
mkdir -p $install_dir

cd $build_dir

#Download the installer
wget https://cran.r-project.org/src/base/R-3/R-$version.tar.gz
tar -xzf ./R-$version.tar.gz
cd R-$version

#Configure and build
./configure --prefix $install_dir --with-blas --with-lapack --enable-R-shlib 2>&1 | tee config-R-$version.log
make 2>&1 | tee make-R-$version.log

#Check
make check 2>&1 | tee make_check-R-$version.log

#Install test directory
make install-tests

#Install
make install

#Build libRmath.so
cd $build_dir/R-$version/src/nmath/standalone
make 
mv libRmath.* $install_dir/lib64/R/lib

#Copy install,configure and test log files
mkdir -p $install_dir/install_logs
cd $build_dir/R-$version
mv ./*.log $install_dir/install_logs
