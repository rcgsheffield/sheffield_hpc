wget https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz
tar -xf gmp-6.2.0.tar.xz
cd gmp-6.2.0
module load apps/texinfo/6.7/gcc-8.2.0
#note loads gcc-8.2.0 compiler
./configure --prefix=/usr/local/packages/apps/gmp/6.2.0
make
make check
make install
