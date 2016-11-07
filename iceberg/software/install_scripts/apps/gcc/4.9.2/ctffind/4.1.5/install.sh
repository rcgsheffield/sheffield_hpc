#!/bin/bash
################################################################################
# Install ctffind 4.1.5 on Iceberg
################################################################################

################################################################################
# Define constants
################################################################################
vers=4.1.5
tarball_url="http://grigoriefflab.janelia.org/sites/default/files/ctffind-${vers}.tar.gz"
compiler=gcc
compiler_vers=4.9.2
workers=8

builddir="${TMPDIR-/tmp}/${USER}/ctffind/${vers}"
prefix="/usr/local/packages6/apps/${compiler}/${compiler_vers}/ctffind/${vers}"
modulefile="/usr/local/modulefiles/apps/${compiler}/${compiler_vers}/ctffind/${vers}"

################################################################################
# Error handling
################################################################################
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

################################################################################
# Activate modulefiles
################################################################################
module purge
module load compilers/${compiler}/${compiler_vers}
module load libs/${compiler}/${compiler_vers}/wxWidgets/3.1.0
module load libs/intel-mkl/11.2.3

################################################################################
# Make dirs and set permissions
################################################################################
mkdir -m 0700 -p ${builddir} 
mkdir -m 2775 -p ${prefix} $(dirname $modulefile)
chown -R ${USER}:app-admins $prefix $(dirname $modulefile)

################################################################################
# Get source
################################################################################
pushd ${builddir}
curl -L ${tarball_url} | tar -zx
pushd ctffind-${vers}

################################################################################
# Patch source
################################################################################
# See http://grigoriefflab.janelia.org/node/5387 for why
sed -i '59,62s/\(#include "[a-zA-Z0-9_-]*.h"\)/\/* \1 *\//' src/core/core_headers.h

################################################################################
# Compile and install
################################################################################
./configure --disable-debugmode --enable-mkl  --prefix=${prefix}
make -j${workers} 
make install
