#!/bin/bash
module load dev/cmake/3.7.1/gcc-4.9.4
module load libs/intel-mkl/2017.0/binary

install_dir=/usr/local/packages/libs/armadillo/7.950.1/gcc-4.9.4/mkl

wget http://sourceforge.net/projects/arma/files/armadillo-7.950.1.tar.xz
tar xvfJ armadillo-7.950.1.tar.xz
cd armadillo-7.950.1
cmake . 2>&1 | tee -a cmake_output.log
make 2>&1 | tee -a make_output.log
make install DESTDIR=$install_dir
