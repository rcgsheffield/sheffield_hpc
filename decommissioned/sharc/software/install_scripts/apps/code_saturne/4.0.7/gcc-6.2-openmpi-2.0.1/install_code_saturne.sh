#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load dev/gcc/6.2
module load mpi/openmpi/2.0.1/gcc-6.2
module load libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1

############################## Variable Setup ################################
version=4.0.7
prefix=/usr/local/packages/apps/code_saturne/$version/gcc-6.2-openmpi-2.0.1
build_dir=/scratch/$USER/code_saturne

filename=code_saturne-4.0.7.tar.gz
baseurl=http://code-saturne.org/cms/sites/default/files/releases

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'


##############################################################################
# This should not need modifying
##############################################################################

# Create the build dir

if [ ! -d $build_dir ]
then
    mkdir -p $build_dir
fi

cd $build_dir

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown $USER:app-admins $prefix
fi

# Download the source
if [ -e $filename ]
then
  echo "Install tarball exists. Download not required."
else
  echo "Downloading source"
  wget $baseurl/$filename
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

tar -xvf $filename

cd code_saturne-$version

./configure --disable-gui --prefix=/usr/local/packages/apps/code_saturne/4.0.7/gcc-6.2-openmpi-2.0.1 --with-mpi=/usr/local/packages/mpi/openmpi/2.0.1/gcc-6.2 --with-scotch=/usr/local/packages/libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1

make -j 4 && make install

cd $prefix/etc
cp code_saturne.cfg.template code_saturne.cfg
# In file code_saturne.cfg edit the following lines as follows
# line 11   batch=SGE
# line 54   bindir = /usr/local/packages/mpi/openmpi/2.0.1/gcc-6.2
# line 56   mpiexec = mpiexec
# line 69   mpiexec_n_per_node = ''

cd $prefix/share/code_saturne/batch
# In file batch.SGE edit the following line as follows
# line 6    #$ -pe mpi 4

cd $prefix/lib/python2.7/site-packages/code_saturne
# In file cs_config.py edit the following lines as follows
# line 104  self.compilers = {'cc': "/usr/local/packages/dev/gcc/6.2.0/bin/gcc",
# line 105                    'cxx': "/usr/local/packages/dev/gcc/6.2.0/bin/g++",
# line 106                    'fc': "/usr/local/packages/dev/gcc/6.2.0/bin/gfortran",
# line 107                    'ld': "/usr/local/packages/dev/gcc/6.2.0/bin/gcc",
