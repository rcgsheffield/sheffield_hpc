.. _parallel_MPI:

Message Passing Interface (MPI)
===============================

The Message Passing Interface is a standard for passing data and other messages between running `processes <https://en.wikipedia.org/wiki/Process_(computing)>`_ 
which may or may not be on a single computer.  
It is commonly used on computer clusters as a means by which a set of related processes can work together in parallel on one or more tasks.
Unlike the :ref:`SMP / OpenMP <parallel_SMP>` approaches to parallelism, the parallel strands of execution in a MPI environment do not share any memory: 
these strands (processes) must therefore communicate data and other information by passing messages between each other.

MPI is used on systems ranging from a few interconnected `Raspberry Pi's <http://thenewstack.io/installing-mpi-python-raspberry-pi-cluster-runs-docker/>`_ through to 
the UK's national supercomputer, `Archer <http://www.archer.ac.uk/>`_.  

.. _mpi_impl:

MPI Implementations
-------------------
The `Message Passing Interface (MPI) <http://mpi-forum.org/>`_ itself is just a *specification* for a message passing library.  

There are multiple implementations of this specification, each produced by a different organisation, 
including `OpenMPI <https://www.open-mpi.org/>`_ and `MVAPICH <http://mvapich.cse.ohio-state.edu/>`_.
This documentation includes information on the MPI implementations available on :ref:`ShARC <sharc-parallel>`.  
These implementations have been compiled in a way that allows them to make optimal use of the cluster's high-speed network infrastructure (*OmniPath* on ShARC).
If you are not sure which implementation to use then try the latest available version of OpenMPI.

Batch MPI
---------
To use MPI you need to: 

* Include information in your :ref:`batch job submission script <submit_batch_sharc>` that tells the Grid Engine scheduler you want to use a particular **Parallel Environment** (``mpi`` on ShARC);
* Use ``module load`` to activate a particular :ref:`MPI implementation <mpi_impl>` (or ``module load`` an application that itself loads an MPI implementation behind the scenes).

Here is an example that requests 4 *slots* (CPU cores) with 8GB of RAM per slot then runs a program called ``executable`` in the current directory using the OpenMPI library (version 2.0.1, built using version 6.2 of the gcc compiler).  It is assumed that ``executable`` was previously compiled using that exact same MPI library.  The Parallel Environment is specified using ``-pe``. :: 

   #!/bin/bash
   # Request 4 MPI 'slots' (cores)
   #$ -pe mpi 4
   # Request 8GB of RAM per slot
   #$ -l rmem=8G

   # Load a MPI library
   module load mpi/openmpi/1.10.4/gcc-6.2

   # Run a program previously compiled using that specific MPI library
   mpirun ./executable

Example MPI jobs
----------------
Some more example MPI jobs are available in the `HPC Examples repository <https://github.com/mikecroucher/HPC_Examples/tree/master/MPI>`_ of Sheffield's `Research Software Engineering group <https://rse.shef.ac.uk/>`_

Interactive MPI
---------------
Our general-access interactive queues currently don't have any MPI-compatible parallel environments enabled.
Thus, it is not possible to run MPI jobs interactively.

MPI Training
------------
Course notes from the national supercomputing centre are available `here <http://www.archer.ac.uk/training/course-material/2016/07/MPP_MPI_epcc/index.php>`_
