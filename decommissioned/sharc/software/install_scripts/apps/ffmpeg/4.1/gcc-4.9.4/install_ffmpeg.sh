wget https://ffmpeg.org/releases/ffmpeg-4.1.tar.bz2
tar xf ffmpeg-4.1.tar.bz2
cd ffmpeg-4.1
mkdir -p /usr/local/packages/apps/ffmpeg/4.1/gcc-4.9.4
module load dev/cmake/3.7.1/gcc-4.9.4
./configure --prefix=/usr/local/packages/apps/ffmpeg/4.1/gcc-4.9.4 --disable-x86asm
make
make install
