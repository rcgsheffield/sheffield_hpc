.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _openmpi_intel_sharc:

OpenMPI (Intel version)
=======================

.. sidebar:: OpenMPI (intel version)

   :Latest Version: 2.0.1
   :Dependencies: Intel compilers
   :URL: http://www.open-mpi.org/

The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. Open MPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. Open MPI offers advantages for system and software vendors, application developers and computer science researchers.

Versions
--------

You can load a specific version using ::

   module load mpi/openmpi/2.0.1/intel-17.0.0
   module load mpi/openmpi/2.0.1/intel-15.0.7
   module load mpi/openmpi/1.10.4/intel-15.0.7

See `here <https://mail-archive.com/announce@lists.open-mpi.org/msg00085.html>`__ for a brief guide to the new features in OpenMPI 2.x and `here <https://raw.githubusercontent.com/open-mpi/ompi/v2.x/NEWS>`__ for a detailed view of the changes between OpenMPI versions.

**C++ bindings** If you are using the C++ bindings then you should use OpenMPI 1.10.4 as the bindings have been deprecated in OpenMPI 2.0.1.

Examples
--------

Example programs are available in the ``/usr/local/packages/mpi/openmpi/XXX/intel-17.0.0/examples/`` directory (where ``XXX`` is the version of OpenMPI you are using e.g. ``2.0.1``).  

To compile and run these programs: copy that directory to your home directory, start an interactive MPI-aware session on a worker node, activate the version of OpenMPI you wish to use, compile the examples then run them.

In more detail ::

    # Connect to ShARC
    ssh user@sharc  

    # Start an interactive session from which we can run MPI processes using a core on each of four nodes
    qrsh -pe mpi 4

    # Load an MPI implementation
    module load mpi/openmpi/2.0.1/intel-17.0.0

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

Version 2.0.1, Intel 17.0.0 compiler
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure :ref:`Intel compilers 17.0.0 <sharc-intel-compilers>` are installed and licensed.
#. Download, compile and install OpenMPI 2.0.1 using :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/2.0.1/intel-17.0.0/install.sh>`.
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/openmpi/2.0.1/intel-17.0.0>` as ``/usr/local/modulefiles/mpi/openmpi/2.0.1/intel-17.0.0``
#. Test by running some Examples_.

Version 2.0.1, Intel 15.0.7 compiler
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure :ref:`Intel compilers 15.0.7 <sharc-intel-compilers>` are installed and licensed.
#. Download, compile and install OpenMPI 2.0.1 using :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/2.0.1/intel-15.0.7/install.sh>`.
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/openmpi/2.0.1/intel-15.0.7>` as ``/usr/local/modulefiles/mpi/openmpi/2.0.1/intel-15.0.7``
#. Test by running some Examples_.

Version 1.10.4, Intel 15.0.7 compiler
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure :ref:`Intel compilers 15.0.7 <sharc-intel-compilers>` are installed and licensed.
#. Download, compile and install OpenMPI 1.10.4 using :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/1.10.4/intel-15.0.7/install.sh>`.
#. Configure the OpenMPI *Modular Component Architecture* (MCA) by copying :download:`this script </decommissioned/sharc/software/install_scripts/mpi/openmpi/1.10.4/intel-15.0.7/openmpi-mca-params.conf>` to ``/usr/local/packages/mpi/openmpi/1.10.4/intel-15.0.7/openmpi-mca-params.conf``; this configures: 

   * the ``mtl`` (MCA *Matching Transport Layer*) to use the ``psm2`` driver (i.e. use the high-bandwidth, low-latency Intel OmniPath fabric);
   * the ``btl`` (MCA *Byte Transport Layer*) to use Omnipath but (not not Ethernet);
   * the ``oob`` (MCA out of band messaging) to use the intra-cluster Ethernet fabric (specified using a network address in CIDR format rather than by specifying Ethernet interface name, which can vary between nodes).

#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/mpi/openmpi/1.10.4/intel-15.0.7>` as ``/usr/local/modulefiles/mpi/openmpi/1.10.4/intel-15.0.7``
#. Test by running some Examples_.

