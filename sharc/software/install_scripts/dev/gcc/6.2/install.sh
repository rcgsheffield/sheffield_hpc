#!/bin/bash
# Install script used to install gcc 6.2 on sharc
# This does both the download and the install

###############
# Set variables
###############
export GVER=6.2.0
# Directory to store downloaded tarball and build logs
export MEDIA_DIR="/usr/local/media/gcc/${GVER}"
export TMPDIR="${TMPDIR:-/tmp}"
# Store unpacked source files
export SOURCE_DIR="${TMPDIR}/${USER}/gcc/${GVER}/source"
export TARBALL_FNAME="gcc-${GVER}.tar.gz"
export SOURCE_URL="ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${GVER}/${TARBALL_FNAME}"
# Build in this dir
export BUILD_DIR="${TMPDIR}/${USER}/gcc/${GVER}/build"
export APPLICATION_ROOT=/usr/local/packages
export INSTALL_ROOT_DIR="${APPLICATION_ROOT}/dev/gcc"
# Install in this dir
export INSTALL_DIR="${INSTALL_ROOT_DIR}/${GVER}"
workers=4

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

##############
# Download gcc
##############
mkdir -p ${MEDIA_DIR}
if [[ ! -e ${MEDIA_DIR}/${TARBALL_FNAME} ]]; then
    wget -P ${MEDIA_DIR} ${SOURCE_URL}
fi

##############
# Untar source
##############
mkdir -p $SOURCE_DIR
cd ${SOURCE_DIR}
if [[ -e ./gcc-$GVER/untar_complete ]]; then
    echo "Directory already untarred. Moving on"
else
    echo "Untarring gcc"
    tar xzf ${MEDIA_DIR}/${TARBALL_FNAME}
    touch ./gcc-$GVER/untar_complete
fi

###################
# Download pre-reqs
###################
cd $SOURCE_DIR/gcc-${GVER}
$SOURCE_DIR/gcc-${GVER}/contrib/download_prerequisites 2>&1 | tee ${MEDIA_DIR}/download_prereqs-gcc${GVER}.log

########################
# Configure in build dir
########################
mkdir -p $BUILD_DIR
cd $BUILD_DIR
$SOURCE_DIR/gcc-${GVER}/configure --prefix=$INSTALL_DIR --enable-languages=c,c++,fortran,go --disable-multilib 2>&1 | tee ${MEDIA_DIR}/configure-gcc${GVER}.log

######################################
# Compile, install and set permissions
######################################
mkdir -p $INSTALL_DIR
make -j ${workers} 2>&1 | tee ${MEDIA_DIR}/make-gcc${GVER}-$(date +%s).log
make install 2>&1 | tee ${MEDIA_DIR}/make-install-gcc${GVER}-$(date +%s).log
chown -R ${USER}:app-admins ${INSTALL_DIR}
chmod -R g+w ${INSTALL_DIR}
