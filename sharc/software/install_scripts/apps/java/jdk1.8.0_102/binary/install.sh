#!/bin/bash
# Install script used to install Java JDK 1.8.0_102 on ShARC
# This does both the download and the install

###############
# Set variables
###############
VERS=1.8.0_102

MEDIA_DIR="/usr/local/media/java/${VERS}"
TARBALL_FNAME="jdk-8u102-linux-x64.tar.gz"
TARBALL_FPATH="${MEDIA_DIR}/${TARBALL_FNAME}"

INSTALL_DIR="/usr/local/packages/apps/java/jdk1.8.0_102/binary"

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
    echo "Could not find Java JDK tarball at: ${TARBALL_FPATH}; exiting." 2>&1 
    exit -1
fi

mkdir -m 2775 -p $INSTALL_DIR
chown ${USER}:app-admins $INSTALL_DIR
cd $INSTALL_DIR

if [[ ! -f .tarball_unpacked ]]; then
    tar -zxf $TARBALL_FPATH
    mv jdk1.8.0_102/* .
    rmdir jdk1.8.0_102
fi

chmod -R g+w $INSTALL_DIR
