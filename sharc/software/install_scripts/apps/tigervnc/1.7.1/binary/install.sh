#!/bin/bash
# Install script used to install TigerVNC 1.7.1 on ShARC
# This does both the download and the install

###############
# Set variables
###############
VERS=1.7.1

MEDIA_DIR="/usr/local/media/tigervnc/${VERS}"
TARBALL_FNAME="tigervnc-1.7.1.x86_64.tar.gz"
TARBALL_FPATH="${MEDIA_DIR}/${TARBALL_FNAME}"

INSTALL_DIR="/usr/local/packages/apps/tigervnc/1.7.1/binary"

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
    echo "Could not find tigervnc tarball at: ${TARBALL_FPATH}; exiting." 2>&1 
    exit -1
fi

mkdir -m 2775 -p $INSTALL_DIR
chown ${USER}:app-admins $INSTALL_DIR
cd $INSTALL_DIR

if [[ ! -f .tarball_unpacked ]]; then
    tar -zxf $TARBALL_FPATH
    mv tigervnc-1.7.1.x86_64/* .
    rmdir tigervnc-1.7.1.x86_64 
fi

chmod -R g+w $INSTALL_DIR
