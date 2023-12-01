#!/bin/bash
# Build and install Apache Spark 2.3.0 (using Java JDK 1.8.0_102) on ShARC
# Will Furnass, 2018

###############
# Set variables
###############
JDK_VERS='jdk1.8.0_102'
VERS='2.3.0'
TARBALL_NAME="spark-${VERS}.tgz"
TARBALL_URL="https://www.apache.org/dyn/closer.lua/spark/spark-${VERS}/${TARBALL_NAME}"
TARBALL_SHA512SUM='b929927da4b438f9c605a35f9b62dc459aee185a9f2e7b5ddf8f19ee5d4146d9b5fe847c79d6a3d7b8686d00f4ee3373c35e0607ea38cb9c3c2ed8925cc93e17'
INSTALL_DIR="/usr/local/packages/apps/spark/${VERS}/${JDK_VERS}"
MODULEFILE="/usr/local/modulefiles/apps/spark/${VERS}/${JDK_VERS}"
BUILD_DIR="$TMPDIR/building/apps/spark/${VERS}/${JDK_VERS}"

# From Spark install instructions
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"

################
# Error handling
################
handle_error () {
    errcode=$? 
    echo "Error code $errcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "On line ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

##############
# Module loads
##############
module load apps/java/${JDK_VERS}/binary

#############
# Create dirs
#############
mkdir -p $BUILD_DIR 
mkdir -m 2775 -p $INSTALL_DIR $(dirname $MODULEFILE)

#######################################
# Download, validate and unpack tarball
#######################################
pushd $BUILD_DIR
if [[ ! -f $TARBALL_NAME ]] || ! $(echo "$TARBALL_SHA512SUM  $TARBALL_NAME" | sha512sum -c --status); then
    wget $TARBALL_URL
    echo "$TARBALL_SHA512SUM  $TARBALL_NAME" | sha512sum -c --status
fi
tar -zxf $TARBALL_NAME

#############
# Build Spark
#############
pushd ${TARBALL_NAME/.tgz/}
./build/mvn -DskipTests clean package

##########################
# Reduce logging verbosity
##########################
sed 's/^log4j.rootCategory=INFO, console/log4j.rootCategory=WARN, console/' conf/log4j.properties.template > conf/log4j.properties

########################
# Copy to install prefix
########################
popd
cp -arT ${TARBALL_NAME/.tgz/} $INSTALL_DIR
