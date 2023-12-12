##!/bin/bash -e
##$ -l rmem=40G

#Set up environment variables and create directories
version=10.36
install_dir=/usr/local/packages/libs/pcre2/$version/gcc-8.2.0/
build_dir=~/builds/pcre2-$version-build
mkdir -p $build_dir
mkdir -p $install_dir
module load dev/gcc/8.2
cd $build_dir

#Download the installer
wget https://ftp.pcre.org/pub/pcre/pcre2-$version.tar.gz      
tar -xzf ./pcre2-$version.tar.gz
cd pcre2-$version

#Configure and build
./configure --prefix $install_dir  2>&1 | tee config-pcre2-$version.log
make 2>&1 | tee make-pcre2-$version.log

#Install
make install

#Check
make check 2>&1 | tee make_check-R-$version.log

#Copy install,configure and test log files
mkdir -p $install_dir/install_logs
cd $build_dir/pcre2-$version
mv ./*.log $install_dir/install_logs
