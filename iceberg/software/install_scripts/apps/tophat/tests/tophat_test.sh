#!/bin/bash

module load apps/gcc/4.8.2/tophat/2.1.0
module load apps/gcc/5.2/bowtie2/2.2.6 
module load libs/gcc/4.8.2/boost/1.58

if [ -e ./test_data.tar.gz ]                                               
then                                                                            
  echo "Data tarball exists. Download not required."                         
else                                                                            
  echo "Downloading data" 
  wget http://ccb.jhu.edu/software/tophat/downloads/test_data.tar.gz
fi

tar zxvf test_data.tar.gz
cd test_data
tophat -r 20 test_ref reads_1.fq reads_2.fq

