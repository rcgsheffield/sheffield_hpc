#!/bin/bash

fftw_vers=3.3.5
fftw_tarball="fftw-${fftw_vers}.tar.gz"
fftw_tarball_url="http://www.fftw.org/${fftw_tarball}"
compiler=gcc
compiler_vers=4.9.4
build_dir="${TMPDIR-/tmp}/fftw/${fftw_vers}/${compiler}-${compiler_vers}/"
prefix="/usr/local/packages/libs/fftw/${fftw_vers}/${compiler}-${compiler_vers}/"
modulefile="/usr/local/modulefiles/libs/fftw/${fftw_vers}/${compiler}-${compiler_vers}"
workers=16

# Signal handling for failure
handle_error () {
    errcode=$? 
    echo "Error code: $errorcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

# Activate a compiler
module purge
module load dev/${compiler}/${compiler_vers}

# Create build, install and modulefile dirs
mkdir -m 0700 -p $build_dir
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Download and unpack tarball
curl -L $fftw_tarball_url | tar -zx -C $build_dir

# Build and install
pushd $build_dir/fftw-${fftw_vers}
./configure --prefix=${prefix} --enable-threads --enable-openmp --enable-shared --enable-avx2
make -j${workers}
make check
make install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
