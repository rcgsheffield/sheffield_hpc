##!/bin/bash -e
##$ -l rmem=40G

#Set up environment variables and create directories
version=3.6.3
install_dir=/usr/local/packages/apps/R/$version/gcc-8.2.0/
build_dir=~/R-$version-build
mkdir -p $build_dir
mkdir -p $install_dir
module load dev/gcc/8.2
cd $build_dir

#Download the installer
wget https://cran.r-project.org/src/base/R-3/R-$version.tar.gz
tar -xzf ./R-$version.tar.gz
cd R-$version

tcl_config=/usr/local/packages/apps/tcl/8.6.10/gcc-8.2.0/lib/tclConfig.sh
tk_config=/usr/local/packages/apps/tk/8.6.10/gcc-8.2.0/lib/tkConfig.sh

#Configure and build
./configure --prefix $install_dir --with-tcltk --with-tcl-config=$tcl_config \
 --with-tk-config=$tk_config --with-blas --with-lapack \
--enable-R-shlib 2>&1 | tee config-R-$version.log
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
