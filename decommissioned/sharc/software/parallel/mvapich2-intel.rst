.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _mvapich2_intel_sharc:

MVAPICH2 (Intel version)
========================

.. sidebar:: MVAPICH2 (Intel version)

   :Latest Version: 2.3b
   :Dependencies: Intel compilers
   :URL: http://mvapich.cse.ohio-state.edu/

MVAPICH, also known as MVAPICH2, is, like OpenMPI, an implementation of the MPI standard for passing messages between machines in parallel computing environments.

Versions
--------

You can load MVAPICH2 using ::

   module load mpi/mvapich2/2.3b/intel-17.0.0

This version was build with the Intel compiler suite version 17.0.0.

See `here <http://mvapich.cse.ohio-state.edu/overview/>`__ for an overview of the features offered per MVAPICH2 release.

.. _mvapich2_benchmark_progs:

Running MPI programs
--------------------

A set of benchmarking programs programs, the *OSU Micro Benchmarks*, are available in the directory: ::

    ${MPI_HOME}/libexec/osu-micro-benchmarks/mpi/

Documentation and source code for these benchmarks can be found `online <http://mvapich.cse.ohio-state.edu/benchmarks/>`__.

To run one of these programs or another program built with this particular MPI software 
you want to submit an MPI-aware batch job (or interactive session) in which you load the MVAPICH2 module file then run the program.  

An example batch job that runs a benchmark program using 4 CPU cores: ::

    #!/bin/bash
    #$ -pe mpi 4

    # Display the scheduler's allocation of 'slots' to the job 
    # (where slots are equivalent to CPU cores in this case)
    echo $PE_HOSTFILE

    # Load an MPI implementation
    module load mpi/mvapich2/2.3b/intel-17.0.0

    # run an benchmark program on all of your MPI nodes using the mpirun utility
    mpirun $MVAPICH_ENV $MPI_HOME/libexec/osu-micro-benchmarks/mpi/collective/osu_allgather

    # or to run on a subset of the nodes:
    # (here we run a program that benchmarks bidirectional bandwidth between just 2 MPI 'ranks' (processes))
    mpirun -np 2 $MVAPICH_ENV $MPI_HOME/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_bibw

.. note::

   You should always specify the absolute or relative path to the MPI program you want to run; otherwise you will see errors like:

   .. code-block:: none
      
      [proxy:0:0@sharc-node129.shef.ac.uk] HYDU_create_process (utils/launch/launch.c:75): execvp error on file mpi_hello_world (No such file or directory)
      [proxy:0:0@sharc-node129.shef.ac.uk] HYDU_create_process (utils/launch/launch.c:75): execvp error on file mpi_hello_world (No such file or directory)

Building applications
---------------------

To build an MPI program (e.g. :download:`mpi_hello_world.c`)::

    # Connect to ShARC
    ssh user@sharc  

    # Start an interactive session 
    qrshx 

    # Load an MPI implementation
    module load mpi/mvapich2/2.3b/intel-17.0.0

    cd path/to/source/code

    # Compile the program using MVAPICH2's MPI-aware wrapper for the Intel 17.0 C compiler
    mpicc mpi_hello_world.c


Installation notes
------------------

These are primarily for administrators of the system.

Version 2.3b, Intel 17.0.0 compiler
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure :ref:`Intel compilers 17.0.0 <sharc-intel-compilers>` are installed and licensed.
#. Download, compile and install MVAPICH2 2.3b using :download:`install.sh </decommissioned/sharc/software/install_scripts/mpi/mvapich2/2.3b/intel-17.0.0/install.sh>`.
   :download:`The console log </decommissioned/sharc/software/install_scripts/mpi/mvapich2/2.3b/intel-17.0.0/install.log>` from running ``install.sh``.
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/mvapich2/2.3b/intel-17.0.0>` as ``/usr/local/modulefiles/mpi/mvapich2/2.3b/intel-17.0.0``
#. Tested by running the :ref:`OSU micro benchmarks <mvapich2_benchmark_progs>` using
   a :download:`mvapich2test.sge</decommissioned/sharc/software/install_scripts/mpi/mvapich2/2.3b/intel-17.0.0/mvapich2test.sge>` job submission script.
   Results: :download:`mvapich2test.sge.log</decommissioned/sharc/software/install_scripts/mpi/mvapich2/2.3b/intel-17.0.0/mvapich2test.sge.log>`.
#. NB the ``MVAPICH_ENV`` environment variable is set by the module file and 
   is used to pass multiple environment variables to slaves for controlling process binding.  
   See the module file for more info.

