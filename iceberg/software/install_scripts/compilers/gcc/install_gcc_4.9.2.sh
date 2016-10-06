#!/bin/bash
#Install script used to install gcc 4.9.2 on iceberg
#This does both the download and the install

# Set some env variables for convenience
export INSTALL_ROOT_DIR=/usr/local/packages6/compilers/gcc
export GVER=4.9.2
export INSTALL_DIR=$INSTALL_ROOT_DIR/$GVER
export SOURCE_DIR=/scratch/gcc_source_$GVER
export BUILD_DIR=/scratch/gcc_build_$GVER

# Make directories
mkdir -p $INSTALL_DIR
mkdir -p $SOURCE_DIR
mkdir -p $BUILD_DIR

# Download gcc
cd $SOURCE_DIR
if [ -e gcc-$GVER.tar.gz ]
then
  echo "Install tarball exists. Download not required."
else
  echo "Downloading gcc source"
  wget ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.gz
fi

# Untar source
if [ -e ./gcc-$GVER/untar_complete ]
then
  echo "Directory already untarred. Moving on"
else
echo "Untarring gcc"
time tar xzf ./gcc-$GVER.tar.gz
touch ./gcc-$GVER/untar_complete
fi

# Download pre-reqs
cd $SOURCE_DIR/gcc-4.9.2
$SOURCE_DIR/gcc-4.9.2/contrib/download_prerequisites

#Enter build dir and configure
cd $BUILD_DIR
$SOURCE_DIR/gcc-4.9.2/configure --prefix=$INSTALL_DIR --enable-languages=c,c++,fortran --disable-multilib 2>&1 | tee config-gcc4.9.2.log

# Run compilation on 4 cores (optional) - it takes for ever otherwise
make -j 4 2>&1 | tee make-gcc4.9.2.log
make install 2>&1 | tee make-install-gcc4.9.2.log
