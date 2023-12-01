##!/bin/bash -e
##$ -l rmem=40G

#Set up environment variables and create directories
version=8.44
install_dir=/usr/local/packages/libs/pcre/$version/gcc-8.2.0/
build_dir=~/builds/pcre-$version-build
mkdir -p $build_dir
mkdir -p $install_dir
module load dev/gcc/8.2
cd $build_dir

#Download the installer
wget https://ftp.pcre.org/pub/pcre/pcre-$version.tar.gz      
tar -xzf ./pcre-$version.tar.gz
cd pcre-$version

#Configure and build
./configure --prefix $install_dir  2>&1 | tee config-pcre-$version.log
make 2>&1 | tee make-pcre-$version.log

#Install
make install

#Check
make check 2>&1 | tee make_check-R-$version.log

#Copy install,configure and test log files
mkdir -p $install_dir/install_logs
cd $build_dir/pcre-$version
mv ./*.log $install_dir/install_logs
