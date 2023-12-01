wget http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
tar -zvxf libsndfile-1.0.28.tar.gz
cd libsndfile-1.0.28
module load dev/cmake/3.7.1/gcc-4.9.4
./configure --prefix=/usr/local/packages/libs/libsndfile/1.0.28/gcc-4.9.4/
make
make install
#note module file at: #/usr/local/modulefiles/libs/libsndfile/1.0.28/gcc-4.9.4
