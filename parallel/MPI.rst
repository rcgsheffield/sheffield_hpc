.. _parallel_MPI:

Message Passing Interface (MPI)
===============================

The Message Passing Interface is a standard for passing data and other messages between running `processes <https://en.wikipedia.org/wiki/Process_(computing)>`_ 
which may or may not be on a single computer.  
It is commonly used on computer clusters as a means by which a set of related processes can work together in parallel on one or more tasks. 
These strands (processes) must therefore communicate data and other information by passing messages between each other.

MPI is used on systems ranging from a few interconnected `Raspberry Pi's <http://thenewstack.io/installing-mpi-python-raspberry-pi-cluster-runs-docker/>`_ through to 
the UK's national supercomputer, `Archer <http://www.archer2.ac.uk/>`_.  

.. _mpi_impl:

MPI Implementations
-------------------
The `Message Passing Interface (MPI) <http://mpi-forum.org/>`_ itself is just a *specification* for a message passing library.  

There are multiple implementations of this specification, each produced by a different organisation, 
including `OpenMPI <https://www.open-mpi.org/>`_ and `Intel MPI <https://www.intel.com/content/www/us/en/developer/tools/oneapi/mpi-library.html>`_.
This documentation includes information on the MPI implementations available on :ref:`Stanage <stanage-parallel>` and :ref:`Bessemer <bessemer-parallel>`. 
On the Stanage cluster these implementations have been compiled in a way that allows them to make optimal use of the high-speed network infrastructure (OmniPath).
If you are not sure which implementation to use then try the latest available version of OpenMPI.

Batch MPI
---------
To use MPI you need use ``module load`` to activate a particular :ref:`MPI implementation <mpi_impl>` 
(or ``module load`` an application that itself loads an MPI implementation behind the scenes).

Here is an example that requests 4 *slots* (CPU cores) with 8GB of RAM per slot then runs a program called ``executable`` 
in the current directory using the OpenMPI library (version 4.1.4, built using version 12.2.0 of the gcc compiler).  
It is assumed that ``executable`` was previously compiled using that exact same MPI library.  

.. code-block:: console 

   #!/bin/bash
   # Request one node
   #SBATCH --nodes=1
   # Request 4 cores per node
   #SBATCH ntasks=4
   # Request 8GB of RAM per node
   #SBATCH mem=8G

   # Load a MPI library
   module load OpenMPI/4.1.4-GCC-12.2.0

   # Run a program previously compiled using that specific MPI library
   srun --export=ALL ./executable


MPI Training
------------
Training courses from the national supercomputing centre are available `here <https://www.archer2.ac.uk/training/courses/210000-mpi-self-service/>`_
