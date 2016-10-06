#!/bin/bash
#$ -l rmem=8G
#$ -l mem=8G

install_dir=/usr/local/packages6/apps/gcc/5.2/octave/4.0
mkdir -p $install_dir

tar -xvzf octave-4.0.0.tar.gz
cd octave-4.0.0
module load apps/binapps/java/1.8u60 
module load compilers/gcc/5.2
module load libs/gcc/5.2/fltk/1.3.3
module load libs/gcc/5.2/fftw/3.3.4

./configure --prefix=$install_dir 2>&1 | tee cofigure_octave4.0.0.log
make 2>&1 | tee make_octave4.0.0.log
make install

