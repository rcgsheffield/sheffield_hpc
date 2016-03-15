bless
=====

.. sidebar:: Bless

   :Version:  1.02
   :URL: http://sourceforge.net/p/bless-ec/wiki/Home/

BLESS: Bloom-filter-based Error Correction Solution for High-throughput Sequencing Reads

Interactive Usage
-----------------
Bless uses MPI and we currently have no interactive MPI environments available. As such, it is not possible to run Bless interactively on Iceberg.

Batch Usage
-----------
The latest version of bless (currently 1.02) is made available with the command ::

        module load apps/gcc/4.9.2/bless

Alternatively, you can load a specific version with ::

        module load apps/gcc/4.9.2/bless/1.02

The module create the environment variable BLESS_PATH which points to the Bless installation directory. It  also loads the dependent modules

* compilers/gcc/4.9.2
* mpi/gcc/openmpi/1.8.3

Here is an example batch submission script that makes use of two example input files we have included in our installation of BLESS ::

  #!/bin/bash
  #Next line is memory per slot
  #$ -l mem=5G -l rmem=5G
  #Ask for 4 slots in an OpenMP/MPI Hybrid queue
  #These 4 slots will all be on the same node
  #$ -pe openmpi-hybrid-4 4

  #load the module
  module load apps/gcc/4.9.2/bless/1.02

  #Output information about nodes where code is running
  cat $PE_HOSTFILE  > nodes

  data_folder=$BLESS_PATH/test_data
  file1=test_small_1.fq
  file2=test_small_2.fq

  #Number of cores per node we are going to use.
  cores=4
  export OMP_NUM_THREADS=$cores

  #Run BLESS
  mpirun $BLESS_PATH/bless -kmerlength 21 -smpthread $cores -prefix test_bless -read1 $data_folder/$file1 -read2 $data_folder/$file2

BLESS makes use of both MPI and OpenMP parallelisation frameworks. As such, it is necessary to use the hybrid MPI/OpenMP queues. The current build of BLESS does not work on more than one node. This will limit you to the maximum number of cores available on one node.

For example, to use all 16 cores on a 16 core node you would request the following parallel environment ::

    #$ -pe openmpi-hybrid-16 16

Remember that memory is allocated on a per-slot basis. You should ensure that you do not request more memory than is available on a single node or your job will be permanently stuck in a queue-waiting (`qw`) status.

Installation notes
------------------
Various issues were encountered while attempting to install bless. See https://github.com/rcgsheffield/iceberg_software/issues/143 for details.
It was necessary to install gcc 4.9.2 in order to build bless. No other compiler worked!

Here are the install steps ::

    tar -xvzf ./bless.v1p02.tgz

    mkdir -p /usr/local/modulefiles/apps/gcc/4.9.2/bless/
    cd v1p02/

Load Modules ::

    module load compilers/gcc/4.9.2
    module load mpi/gcc/openmpi/1.8.3

Modify the Makefile. Change the line ::

        cd zlib; ./compile

to ::

        cd zlib;

Manually compile zlib ::

  cd zlib/
  ./compile

Finish the compilation ::

  cd ..
  make

Copy the bless folder to the central location ::

  cd ..
  cp -r ./v1p02/ /usr/local/packages6/apps/gcc/4.9.2/bless/

Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.9.2/bless/1.02`
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/4.9.2/bless/1.02>`_.
