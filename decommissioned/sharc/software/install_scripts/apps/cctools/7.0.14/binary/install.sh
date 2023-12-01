#!/bin/bash
# Install script used to install cctools on ShARC
# Requires tar file to be available in /usr/local/media/cctools

###############
# Set variables
###############
VERS=7.0.14

MEDIA_DIR="/usr/local/media/cctools/${VERS}"
TARBALL_FNAME="cctools-${VERS}-x86_64-centos7.tar.gz"
TARBALL_FPATH="${MEDIA_DIR}/${TARBALL_FNAME}"

INSTALL_DIR="/usr/local/packages/apps/cctools/${VERS}/binary"

################
# Error handling
################
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

if [[ ! -f $TARBALL_FPATH ]]; then
    echo "Could not find cctools tarball at: ${TARBALL_FPATH}; exiting." 2>&1 
    exit -1
fi

mkdir -m 2775 -p $INSTALL_DIR
chown -R ${USER}:hpc_app-admins $INSTALL_DIR
cd $INSTALL_DIR

if [[ ! -f bin/parrot_run ]]; then
    tar -zxf $TARBALL_FPATH
    mv cctools-${VERS}-x86_64-centos7/* .
    rmdir cctools-${VERS}-x86_64-centos7
fi

chmod -R g+w $INSTALL_DIR

