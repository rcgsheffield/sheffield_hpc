.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _intelmpi_sharc:

Intel MPI 
=======================

.. sidebar:: Intel MPI 

   :Versions: 2019.9.304, 2018.5.288
   :URL: https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/mpi-library.html

Intel® MPI Library is a multifabric message-passing library that implements the open-source MPICH specification. 
Use the library to create, maintain, and test advanced, complex applications that perform better on high-performance 
computing (HPC) clusters based on Intel® processors.

--------

Versions
--------

You can load a specific version using ::

   module load mpi/impi/2018.5.288/binary
   module load mpi/impi/2019.9.304/binary


--------

Examples
--------

Two examples are given below, the first assessing the MPI performance and the second demonstrating the use 
of the Intel MPI compilers.

Example: MPI Performance testing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A simple test of these modules can be performed by running the built in performance benchmark tests 
supplied by Intel. An example of this using 2 cores in the required MPI environment is given below: 

.. code-block:: bash

   #!/bin/bash
   #$ -M a.person@sheffield.ac.uk
   #$ -m abe
   #$ -l h_rt=00:10:00
   #$ -l rmem=1G
   #$ -pe mpi 2
   #$ -j yes
   #$ -N intelmpi-test

   module load mpi/impi/2018.5.288/binary

   MACHINEFILE="machinefile.$JOB_ID"

   # Show which nodes you have been allocated CPU cores on
   echo -e "\nShow node core allocation:\n"
   cat $PE_HOSTFILE

   for host in `cat $PE_HOSTFILE | awk '{print $1}'`; do
      num=`grep $host $PE_HOSTFILE | awk '{print $2}'`
      for i in `seq 1 $num`; do
         echo $host >> $MACHINEFILE
      done
   done

   MACHINELIST="$(awk '{for (i=0; i<$2; i++) {print $1}}' $PE_HOSTFILE | paste -sd:)"

   echo -e "\nBegin running application:\n"
   mpirun -np $NSLOTS IMB-MPI1

This will generate output of the form:

.. code-block:: bash

   Show node core allocation:

   sharc-node010.shef.ac.uk 1 all.q@sharc-node010.shef.ac.uk UNDEFINED
   sharc-node072.shef.ac.uk 1 all.q@sharc-node072.shef.ac.uk UNDEFINED

   Begin running application:


   #------------------------------------------------------------
   #    Intel (R) MPI Benchmarks 2018, MPI-1 part
   #------------------------------------------------------------
   # Date                  : Tue Sep 14 15:20:13 2021
   # Machine               : x86_64
   # System                : Linux
   # Release               : 3.10.0-1160.36.2.el7.x86_64
   # Version               : #1 SMP Wed Jul 21 11:57:15 UTC 2021
   # MPI Version           : 3.1
   # MPI Thread Environment:

   # Calling sequence was:

   # IMB-MPI1

   # Minimum message length in bytes:   0
   # Maximum message length in bytes:   4194304
   #
   # MPI_Datatype                   :   MPI_BYTE
   # MPI_Datatype for reductions    :   MPI_FLOAT
   # MPI_Op                         :   MPI_SUM
   #
   #

This is followed by a series of test benchmark results for each of the many tests.


Example: Using the Intel MPI compilers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Another simple test of these modules can be performed by compiling and running the example executable 
provided by Intel. An example of this using 2 cores in the required MPI environment is given below:

.. code-block:: bash

   #!/bin/bash
   #$ -M a.person@sheffield.ac.uk
   #$ -m abe
   #$ -l h_rt=00:10:00
   #$ -l rmem=1G
   #$ -pe mpi 2
   #$ -j yes
   #$ -N intelmpi-test

   module load mpi/impi/2018.5.288/binary

   MACHINEFILE="machinefile.$JOB_ID"

   # Show which nodes you have been allocated CPU cores on
   echo -e "\nShow node core allocation:\n"
   cat $PE_HOSTFILE

   for host in `cat $PE_HOSTFILE | awk '{print $1}'`; do
      num=`grep $host $PE_HOSTFILE | awk '{print $2}'`
      for i in `seq 1 $num`; do
         echo $host >> $MACHINEFILE
      done
   done

   MACHINELIST="$(awk '{for (i=0; i<$2; i++) {print $1}}' $PE_HOSTFILE | paste -sd:)"

   cd /data/$USER
   cp -R $I_MPI_ROOT/test ./ && cd test/
   # Compiling the fortran example
   mpif90 test.f90
   # Alternatively you can compile the C example instead
   #mpicc test.c

   echo -e "\nBegin running application:\n"
   mpirun -np $NSLOTS /data/$USER/test/a.out

This will generate output of the form:

.. code-block:: bash

   Show node core allocation:

   sharc-node046.shef.ac.uk 1 all.q@sharc-node046.shef.ac.uk UNDEFINED
   sharc-node091.shef.ac.uk 1 all.q@sharc-node091.shef.ac.uk UNDEFINED

   Begin running application:

   Hello world: rank            0  of            2  running on sharc-node046.shef.ac.uk                                                                                                       
   Hello world: rank            1  of            2  running on sharc-node091.shef.ac.uk


--------

Installation notes
------------------

These are primarily for administrators of the system.

.. hint::

   The ``-print-rank-map`` argument can be used with ``mpirun`` to print out the node/core locations of the 
   allocated MPI tasks as Intel-MPI / hydra uses them for comparison with ``$PE_HOSTFILE``.


Version 2019.9.304
^^^^^^^^^^^^^^^^^^

This version was installed using the CLI installer found in the protected media directory for Intel MPI. 
Full installation was chosen following by using the process 
`described by Intel <https://software.intel.com/content/www/us/en/develop/articles/using-environment-modules-with-the-intel-development-tools.html>`_ 
using the `env2 <https://sourceforge.net/projects/env2/>`_ utility to 
generate the module files.

The module file is adjusted to include the statement below to enable usage of the Omnipath high speed networking: ::

   # Set the Infini/omnipath fabric
   setenv I_MPI_FABRICS shm:ofi

This module file can be downloaded here: :download:`impi/2019.9.304/binary </decommissioned/sharc/software/modulefiles/mpi/impi/2019.9.304/binary>`.



The module was subsequently tested using the built in 
`IMB-MPI1 <https://software.intel.com/content/www/us/en/develop/documentation/imb-user-guide/top/mpi-1-benchmarks.html>`_ 
tests with the script in the examples section.

Version 2018.5.288
^^^^^^^^^^^^^^^^^^

This version was installed using the CLI installer found in the protected media directory for Intel MPI. 
Full installation was chosen following by using the process 
`described by Intel <https://software.intel.com/content/www/us/en/develop/articles/using-environment-modules-with-the-intel-development-tools.html>`_ 
using the `env2 <https://sourceforge.net/projects/env2/>`_ utility to 
generate the module files.

The module file is adjusted to include the statement below to enable usage of the Omnipath high speed networking: ::

   # Set the Infini/omnipath fabric
   setenv I_MPI_FABRICS shm:ofi

This module file can be downloaded here: :download:`impi/2018.5.288/binary </decommissioned/sharc/software/modulefiles/mpi/impi/2018.5.288/binary>`.

The module was subsequently tested using the built in 
`IMB-MPI1 <https://software.intel.com/content/www/us/en/develop/documentation/imb-user-guide/top/mpi-1-benchmarks.html>`_ 
tests with the script in the examples section.


