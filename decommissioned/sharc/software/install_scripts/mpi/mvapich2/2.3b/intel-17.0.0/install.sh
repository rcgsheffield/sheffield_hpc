#!/bin/bash
# Install MVAPICH2 2.3b built with Intel 17.0.0 compilers on the ShARC cluster

##############################################################################
# Error handling
##############################################################################

handle_error () {
    errcode=$? 
    echo "Error: $errorcode" 
    echo "Command: $BASH_COMMAND" 
    echo "Line: ${BASH_LINENO[0]}"
    exit $errcode  
} 
trap handle_error ERR

##############################################################################
# Module loads
##############################################################################

module load dev/intel-compilers/17.0.0
# MVAPICH2 configure script by default errors with "F90 and F90FLAGS are
# replaced by FC and FCFLAGS respectively in this configure, please unset
# F90/F90FLAGS and set FC/FCFLAGS instead" so we now need
for var in F77 F90 F95; do 
    unset $var
done

##############################################################################
# Variable setup
##############################################################################

vers=2.3b
compiler=intel-17.0.0
build_dir="${TMPDIR-/tmp}/${USER}/mvapich2-${vers}"
prefix="/usr/local/packages/mpi/mvapich2/${vers}/${compiler}"
modulefile="/usr/local/modulefiles/mpi/mvapich2/${vers}/${compiler}"
filename="mvapich2-${vers}.tar.gz"
baseurl="http://mvapich.cse.ohio-state.edu/download/mvapich/mv2/"
file_md5="87c3fbf8a755b53806fa9ecb21453445"

##############################################################################
# Create build, install and modulefile dirs
##############################################################################

[[ -d $build_dir ]] || mkdir -p $build_dir

for d in $prefix $(dirname $modulefile); do 
    mkdir -m 2775 -p $d
    chown -R ${USER}:app-admins $d
done

##############################################################################
# Download source
##############################################################################

cd $build_dir
# Only download if tarball missing or checksum invalid
if ! (echo "${file_md5}  ${filename}" | md5sum -c &> /dev/null); then 
    wget -c ${baseurl}/${filename}
fi

##############################################################################
# Build and install
##############################################################################

if ! [[ -f mvapich2-${vers}/.unpacked ]]; then
    tar -xzf ${filename}
    touch mvapich2-${vers}/.unpacked
fi
cd mvapich2-${vers}

./configure \
    --prefix=${prefix} \
    --enable-fortran=yes \
    --enable-cxx \
    --with-device=ch3:psm \
    --with-psm2 \
    --enable-rsh \
    CC=icc CXX=icpc FC=ifort

make clean
make 
make check
make install

echo "Next, install modulefile as $modulefile."
