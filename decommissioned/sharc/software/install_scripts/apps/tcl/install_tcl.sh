##!/bin/bash -e
##$ -l rmem=40G

#Set up environment variables and create directories
version=8.6.10
install_dir=/usr/local/packages/apps/tcl/$version/gcc-10.1/
build_dir=~/builds/tcl-$version-build
mkdir -p $build_dir
mkdir -p $install_dir
module load dev/gcc/10.1
cd $build_dir

#Download the installer
wget https://sourceforge.net/projects/tcl/files/Tcl/$version/tcl$version-src.tar.gz
tar -xzf ./tcl$version-src.tar.gz
cd tcl$version/unix

#Configure and build
./configure --prefix $install_dir --enable-threads 2>&1 | tee config-tcl-$version.log
make 2>&1 | tee make-tcl-$version.log

#Install
make install

#Copy install,configure and test log files
mkdir -p $install_dir/install_logs
cd $build_dir/tcl$version/unix
mv ./*.log $install_dir/install_logs
