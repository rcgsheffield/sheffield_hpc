#!/bin/bash

fftw_vers=3.3.5
fftw_tarball="fftw-${fftw_vers}.tar.gz"
fftw_tarball_url="http://www.fftw.org/${fftw_tarball}"

compiler=gcc
compiler_vers=4.9.2

prefix="/usr/local/packages6/libs/${compiler}/${compiler_vers}/fftw/${fftw_vers}/"

modulefile="/usr/local/modulefiles/libs/${compiler}/${compiler_vers}/fftw/${fftw_vers}"

workers=8

# Signal handling for failure
handle_error () {
    errcode=$? # save the exit code as the first thing done in the trap function 
    echo "error $errorcode" 
    echo "the command executing at the
    time of the error was" echo "$BASH_COMMAND" 
    echo "on line ${BASH_LINENO[0]}"
    # do some error handling, cleanup, logging, notification $BASH_COMMAND
    # contains the command that was being executed at the time of the trap
    # ${BASH_LINENO[0]} contains the line number in the script of that command
    # exit the script or return to try again, etc.
    exit $errcode  # or use some other value or do return instead 
}
trap handle_error ERR

# Download and unpack tarball
[[ -f $fftw_tarball ]] || wget $fftw_tarball_url
if ! [[ -f .fftw_tarball_unpacked ]]; then
    tar -zxf ${fftw_tarball}
    touch .fftw_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load compilers/${compiler}/${compiler_vers}

# Build and install
pushd fftw-${fftw_vers}
./configure --prefix=${prefix} --enable-threads --enable-openmp --enable-shared
make -j${workers}
make check
make install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
