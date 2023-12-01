##!/bin/bash -e
##$ -l rmem=40G

#Set up environment variables and create directories
version=8.6.10
install_dir=/usr/local/packages/apps/tk/$version/gcc-10.1/
build_dir=~/builds/tk-$version-build
tcl_dir=/usr/local/packages/apps/tcl/8.6.10/gcc-10.1/lib #This is looking for tclConfig.sh
mkdir -p $build_dir
mkdir -p $install_dir
module load dev/gcc/10.1
cd $build_dir

#Download the installer
wget https://sourceforge.net/projects/tcl/files/Tcl/$version/tk$version-src.tar.gz
tar -xzf ./tk$version-src.tar.gz
cd tk$version/unix

#Configure and build
./configure --prefix $install_dir --with-tcl=$tcl_dir --enable-threads 2>&1 | tee config-tk-$version.log
make 2>&1 | tee make-tk-$version.log

#Install
make install

#Copy install,configure and test log files
mkdir -p $install_dir/install_logs
cd $build_dir/tk$version/unix
mv ./*.log $install_dir/install_logs
