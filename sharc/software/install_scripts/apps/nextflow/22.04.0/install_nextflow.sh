#!/bin/bash

install_dir=/usr/local/packages/apps/Nextflow/22.04.0/binary/bin
mkdir -p $install_dir

#Download the 22.04.0 version
wget https://github.com/nextflow-io/nextflow/archive/v22.04.0.tar.gz

#Install
tar -xvzf v22.04.0.tar.gz
mv nextflow-22.04.0/nextflow nextflow-22.04.0/gradlew $install_dir/

#Clean up
rm -r nextflow-22.04.0/ v22.04.0.tar.gz