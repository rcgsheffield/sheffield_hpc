#!/bin/bash

install_dir=/usr/local/packages/apps/taverna/cli/2.5.0
mkdir -p $install_dir

#Download the 3.6 version
wget https://bitbucket.org/taverna/taverna-commandline-product/downloads/taverna-commandline-core-2.5.0-standalone.zip

#Install
unzip taverna-commandline-core-2.5.0-standalone.zip
mv taverna-commandline-core-2.5.0-standalone/* $install_dir/  
