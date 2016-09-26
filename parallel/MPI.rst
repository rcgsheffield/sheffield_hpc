.. _parallel_MPI:

Message Passing Interface (MPI)
===============================

The Message Passing Interface (MPI) Standard is a specification for a message passing library.  MPI was originally designed for distributed memory architectures and is used on systems ranging from a few interconnected `Raspberry Pi's <http://thenewstack.io/installing-mpi-python-raspberry-pi-cluster-runs-docker/>`_ through to the UK's national supercomputer, `Archer <http://www.archer.ac.uk/>`_.

MPI Implementations
-------------------
Our systems have several MPI implementations installed. See the :ref:`MPI` section in software for details

Example MPI jobs
----------------
Some example MPI jobs are available in the `HPC Examples repository <https://github.com/mikecroucher/HPC_Examples/tree/master/MPI>`_ of Sheffield's `Research Software Engineering group <http://rse.shef.ac.uk/>`_

Batch MPI
---------
The queue to submit to is `openmpi-ib`. Here is an example that requests 4 slots with 8Gb per slot using the gcc implementation of OpenMPI :: 

  #!/bin/bash
  #$ -l h_rt=1:00:00
  # Change 4 to the number of slots you want
  #$ -pe openmpi-ib 4
  # 8Gb per slot
  #$ -l rmem=8G
  #$ -l mem=8G

  module load mpi/gcc/openmpi
  mpirun  ./executable


Interactive MPI
---------------
Our general-access interactive queues currently don't have any MPI-compatible parallel environments enabled.
Thus, it is not possible to run MPI jobs interactively.

MPI Training
------------
Course notes from the national supercomputing centre are available `here <http://www.archer.ac.uk/training/course-material/2016/07/MPP_MPI_epcc/index.php>`_
