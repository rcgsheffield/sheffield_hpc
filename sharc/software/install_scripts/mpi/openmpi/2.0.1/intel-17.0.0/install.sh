#!/bin/bash
# Install OpenMPI 2.0.1 built with Intel 17.0.0 compilers on the ShARC cluster

##############################################################################
# Error handling
##############################################################################

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

##############################################################################
# Module loads
##############################################################################

module load dev/intel-compilers/17.0.0

##############################################################################
# Variable setup
##############################################################################

short_version=2.0
version=${short_version}.1
compiler=intel-17.0.0
build_dir="${TMPDIR-/tmp}/${USER}/openmpi_${version}"
prefix="/usr/local/packages/mpi/openmpi/${version}/${compiler}"
modulefile="/usr/local/modulefiles/mpi/openmpi/${version}/${compiler}"
filename="openmpi-${version}.tar.gz"
baseurl="http://www.open-mpi.org/software/ompi/v${short_version}/downloads/"
workers=16  # for building in parallel

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
wget -c ${baseurl}/${filename}

##############################################################################
# Build and install
##############################################################################

tar -xzf openmpi-${version}.tar.gz
cd openmpi-${version}

./configure --prefix=${prefix} --with-psm2 CC=icc CXX=icpc FC=ifort
make -j${workers}
make check
make install

##############################################################################
# Download and install examples
##############################################################################

pushd ${prefix}
curl -L https://github.com/open-mpi/ompi/archive/v${short_version}.x.tar.gz | tar -zx
mv ompi-${short_version}.x/examples .
rm -r ompi-${short_version}.x 
popd

echo "Next, install modulefile as $modulefile."
