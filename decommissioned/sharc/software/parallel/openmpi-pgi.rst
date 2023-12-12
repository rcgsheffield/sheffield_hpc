.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

OpenMPI (pgi version)
=====================

.. sidebar:: OpenMPI (PGI version)

   :Latest Version: 4.0.1
   :Dependencies: PGI Compiler
   :URL: http://www.open-mpi.org/

The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. Open MPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. Open MPI offers advantages for system and software vendors, application developers and computer science researchers.

Versions
--------

You can load a specific version using ::

    module load mpi/openmpi/4.0.1/pgi-19.5
    module load mpi/openmpi/2.0.1/pgi-17.5

This also loads the relevant version of the PGI compiler (17.5 in this case).

See `here <https://www.mail-archive.com/announce@lists.open-mpi.org/msg00122.html>`__ for a brief guide to the new features in OpenMPI 4.x and `here <https://raw.githubusercontent.com/open-mpi/ompi/v4.0.x/NEWS>`__ for a detailed view of the changes between OpenMPI versions.

Examples
--------

Example programs are available in the ``$MPI_HOME/examples/`` directory.  

To compile and run these programs: copy that directory to your home directory, start an interactive MPI-aware session on a worker node, activate the version of OpenMPI you wish to use, compile the examples then run them.

In more detail ::

    # Connect to ShARC
    ssh user@sharc  

    # Start an interactive session from which we can run MPI processes using a core on each of four nodes
    qrsh -pe mpi 4

    # Load an MPI implementation
    module load mpi/openmpi/2.0.1/pgi-17.5

    # Copy the examples to your home directory
    cp -r $MPI_HOME/examples ~/openmpi_2.0.1_examples

    # Compile all programs in the examples directory
    cd ~/openmpi_2.0.1_examples
    make

    # Once compiled, run an example program on all (or a subset) of your MPI nodes using the mpirun utility
     mpirun -np 4 hello_c


    Hello, world, I am 0 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 1 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 2 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)
    Hello, world, I am 3 of 4, (Open MPI v2.0.1, package: Open MPI user@sharc-node002.shef.ac.uk Distribution, ident: 2.0.1, repo rev: v2.0.0-257-gee86e07, Sep 02, 2016, 141)


Installation notes
------------------

These are primarily for administrators of the system.

**Version 4.0.1, PGI 19.5**

1. Download, compile and install OpenMPI 4.0.1 using :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/4.0.1/pgi-19.5/install.sh>`
2. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/openmpi/4.0.1/pgi-19.5>` as ``/usr/local/modulefiles/mpi/openmpi/4.0.1/pgi-19.5``

**Version 2.0.1, PGI 17.5**

1. Download, compile and install OpenMPI 2.0.1 using :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/2.0.1/pgi-17.5/install_pgi_openmpi_2.0.1.sh>`
2. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/openmpi/2.0.1/pgi-17.5>` as ``/usr/local/modulefiles/mpi/openmpi/2.0.1/pgi-17.5``


