OpenMPI (Intel version)
=======================

.. sidebar:: OpenMPI (intel version)

   :Latest Version: 2.0.1
   :Dependancies: Intel compilers
   :URL: http://www.open-mpi.org/

The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. Open MPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. Open MPI offers advantages for system and software vendors, application developers and computer science researchers.

Versions
--------

You can load a specific version using ::

   module load mpi/openmpi/2.0.1/intel-17.0.0

See `here <https://mail-archive.com/announce@lists.open-mpi.org/msg00085.html>`__ for a brief guide to the new features in OpenMPI 2.x and `here <https://raw.githubusercontent.com/open-mpi/ompi/v2.x/NEWS>`__ for a detailed view of the changes between OpenMPI versions.

Examples
--------

Example programs are available in the ``/usr/local/packages/mpi/openmpi/XXX/intel-17.0.0/examples/`` directory (where ``XXX`` is the version of OpenMPI you are using e.g. ``2.0.1``).  

To compile and run these programs: copy that directory to your home directory, start an interactive MPI-aware session on a worker node, activate the version of OpenMPI you wish to use, compile the examples then run them.

In more detail ::

    # Connect to iceberg
    ssh user@iceberg  

    # Copy the examples to your home directory
    cp -r /usr/local/packages/mpi/openmpi/2.0.1/intel-17.0.0/examples/ ~/openmpi_2.0.1_examples

    # Start an interactive session from which we can run MPI processes using a core on each of four nodes
    qrsh -pe mpi 4

    # Compile all programs in the examples directory
    cd ~/openmpi_2.0.1_examples
    make

    # Once compiled, run an example program on all (or a subset) of your MPI nodes using the mpirun utility
    $ mpirun -np 4 hello_c
    Hello, world, I am 0 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 1 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 2 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 3 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)


Installation notes
------------------

These are primarily for administrators of the system.

**Version 2.0.1**

#. Ensure :ref:`Intel compilers 17.0.0 <sharc-intel-compilers>` are installed and licensed.
#. Download, compile and install OpenMPI 2.0.1 using the `install_openMPI_2.0.1_intel-17.0.0.sh <https://github.com/rcgsheffield/sheffield_hpc/blob/master/sharc/software/install_scripts/mpi/openmpi/2.0.1/install_openMPI_2.0.1_intel_17.0.0.sh>`_ script.
#. Install `this modulefile <https://github.com/rcgsheffield/sheffield_hpc/blob/master/sharc/software/modulefiles/mpi/openmpi/2.0.1/intel-17.0.0>`__ as ``/usr/local/modulefiles/mpi/openmpi/2.0.1/intel-17.0.0``
#. Test by running some <Examples>_.
