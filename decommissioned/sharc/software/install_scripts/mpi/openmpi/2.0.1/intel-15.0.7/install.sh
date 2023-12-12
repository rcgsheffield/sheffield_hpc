#!/bin/bash
# Install OpenMPI 2.0.1 built with Intel 15.0.7 compilers on the ShARC cluster

##############################################################################
# Error handling
##############################################################################

handle_error () {
    errcode=$?
    echo "Error code: $errorcode" 
    echo "Error command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode 
} 
trap handle_error ERR

##############################################################################
# Module loads
##############################################################################

module purge
module load dev/intel-compilers/15.0.7

##############################################################################
# Variable setup
##############################################################################

short_version=2.0
version=${short_version}.1
compiler=intel-15.0.7
build_dir="${TMPDIR-/tmp}/${USER}/openmpi_${version}"
prefix="/usr/local/packages/mpi/openmpi/${version}/${compiler}"
modulefile="/usr/local/modulefiles/mpi/openmpi/${version}/${compiler}"
filename="openmpi-${version}.tar.gz"
baseurl="http://www.open-mpi.org/software/ompi/v${short_version}/downloads/"
mca_conf="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/openmpi-mca-params.conf"

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
make 
make check
make install

##############################################################################
# Configure default settings
##############################################################################
cp ${mca_conf} ${prefix}/etc/openmpi-mca-params.conf

##############################################################################
# Download and install examples
##############################################################################

pushd ${prefix}
curl -L https://github.com/open-mpi/ompi/archive/v${short_version}.x.tar.gz | tar -zx
mv ompi-${short_version}.x/examples .
rm -r ompi-${short_version}.x 
popd

echo "Next, install modulefile as $modulefile."
