wget https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.2.0.tar.gz
module load dev/gcc/4.9.4
module load libs/blas/3.4.2-5/binary
module load libs/lapack/3.4.2-5/binary
tar xf JAGS-4.2.0.tar.gz
cd JAGS-4.2.0
mkdir /usr/local/packages/apps/jags/4.2/gcc-4.9.4/
install_dir=/usr/local/packages/apps/jags/4.2/gcc-4.9.4/
./configure --prefix=$install_dir --libdir=$install_dir/lib64
make
make install
