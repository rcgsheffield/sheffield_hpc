wget ftp://ftp.unidata.ucar.edu/pub/udunits/udunits-2.2.26.tar.gz
mkdir /usr/local/packages/libs/udunits/2.2.26/gcc-4.9.4
module load dev/gcc/4.9.4
module load libs/expat/2.2.7/gcc/gcc-4.9.4
./configure --prefix=/usr/local/packages/libs/udunits/2.2.26/gcc-4.9.4
make
make install
