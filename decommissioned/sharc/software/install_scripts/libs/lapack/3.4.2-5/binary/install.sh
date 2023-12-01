#!/bin/bash
# Install script used to install the contents of the LAPACK and LAPACK development packages

###############
# Set variables
###############
VERS=3.4.2-5

MEDIA_DIR="/usr/local/media/lapack/${VERS}"
RPM_FNAME="lapack-$VERS.el7.x86_64.rpm"
RPM_DEV_FNAME="lapack-devel-$VERS.el7.x86_64.rpm"

RPM_FPATH="${MEDIA_DIR}/${RPM_FNAME}"
RPM_DEV_FPATH="${MEDIA_DIR}/${RPM_DEV_FNAME}"

INSTALL_DIR="/usr/local/packages/libs/lapack/${VERS}/binary"

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

if [[ ! -f $RPM_FPATH ]]; then
    echo "Could not find LAPACK RPM  at: ${RPM_FPATH}; exiting." 2>&1 
    exit -1
fi

if [[ ! -f $RPM_DEV_FPATH ]]; then
    echo "Could not find LAPACK DEV RPM  at: ${RPM_DEV_FPATH}; exiting." 2>&1 
    exit -1
fi


mkdir -m 2775 -p $INSTALL_DIR
chown ${USER}:app-admins $INSTALL_DIR
cd $INSTALL_DIR
rpm2cpio $RPM_FPATH | cpio -idm
rpm2cpio $RPM_DEV_FPATH | cpio -idm
mv usr/lib64 lib64
mv usr/share share
mv usr/include include
rmdir usr
chmod -R g+w $INSTALL_DIR

