#!/bin/bash
################################################################################
# Install wxWidgets GUI toolkit on Iceberg
################################################################################

################################################################################
# Define constants
################################################################################
vers=3.1.0
tarball_url="https://github.com/wxWidgets/wxWidgets/releases/download/v${vers}/wxWidgets-${vers}.tar.bz2"
compiler=gcc
compiler_vers=4.9.2
workers=10

builddir="${TMPDIR-/tmp}/${USER}/wxWidgets/${vers}"
prefix="/usr/local/packages6/libs/${compiler}/${compiler_vers}/wxWidgets/${vers}"
modulefile="/usr/local/modulefiles/libs/${compiler}/${compiler_vers}/wxWidgets/${vers}"

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
module load compilers/${compiler}/${compiler_vers}

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
curl -L ${tarball_url} | tar -jx
pushd wxWidgets-${vers}

################################################################################
# Compile
################################################################################
./configure --enable-unicode --prefix=${prefix}
make -j${workers} 
make install
