#!/bin/bash
# Install CASTEP 18.1 on the ShARC cluster (cp of WF's install script for 16.11)

##############################################################################
# Error handling
##############################################################################

handle_error () {
    errcode=$? # save the exit code as the first thing done in the trap function 
    echo "Error code: $errorcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error line: ${BASH_LINENO[0]}"
    exit $errcode  
} 
trap handle_error ERR

##############################################################################
# Variables
##############################################################################

vers="18.1"
compiler="intel"
compiler_vers="17.0.0"
mpi="openmpi"
mpi_vers="2.0.1"
tarball_path="/usr/local/media/protected/CASTEP/${vers}/CASTEP-${vers}.tar.gz"
base_prefix="/usr/local/packages/apps/castep"
prefix="${base_prefix}/${vers}/${compiler}-${compiler_vers}-${mpi}-${mpi_vers}/bin/"
serial_build_dir="/data/$USER/sharc/castep/${vers}/${compiler}-${compiler_vers}/serial"
parallel_build_dir="/data/$USER/sharc/castep/${vers}/${compiler}-${compiler_vers}/parallel"

##############################################################################
# Create dirs
##############################################################################

mkdir -m 0700 -p $serial_build_dir $parallel_build_dir
mkdir -m 2750 -p $prefix

##############################################################################
# Build and install serial version
##############################################################################

module purge
module load dev/${compiler}-compilers/${compiler_vers}
module load libs/intel-mkl/2017.0/binary

tar -xzf ${tarball_path} -C ${serial_build_dir}
pushd ${serial_build_dir}/CASTEP-${vers}

#make clean
make INSTALL_DIR=$prefix FFT=mkl MATHLIBS=mkl10
make INSTALL_DIR=$prefix FFT=mkl MATHLIBS=mkl10 install install-tools

##############################################################################
# Build and install parallel version
##############################################################################

module load mpi/${mpi}/{$mpi_vers}/${compiler}-${compiler_vers}

tar -xzf ${tarball_path} -C ${parallel_build_dir}
pushd ${parallel_build_dir}/CASTEP-${vers}

if [[ $compiler == "intel" ]] && [[ $compiler_vers =~ ^15\. ]]; then
    # Workaround for bug described at http://www.cmth.ph.ic.ac.uk/computing/software/castep.html
    sed 's/-static-intel/-shared-intel/' obj/platforms/linux_x86_64_ifort15.mk -i
fi

make clean
make COMMS_ARCH=mpi  FFT=mkl MATHLIBS=mkl10
mv ./obj/linux_x86_64_*/castep.mpi $prefix

##############################################################################
# Set permissions
##############################################################################

chgrp -R castep $prefix

