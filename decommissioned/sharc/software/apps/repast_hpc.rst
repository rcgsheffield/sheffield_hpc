.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Repast HPC
==========

.. sidebar:: Repast HPC

   :Version: 2.2.0
   :Dependencies: Modules loaded for GCC 6.2.0 compiler and either MPICH-3.1.4 or Open MPI 2.1.1
   :URL: https://repast.github.io/
   :Documentation: https://repast.github.io/docs.html


The Repast Suite is a family of advanced, free, and open source agent-based modeling and simulation platforms that have collectively been under continuous development for over 15 years:
Repast for High Performance Computing 2.2.0, released on 30 September 2016, is a lean and expert-focused C++-based modeling system that is designed for use on large computing clusters and supercomputers. 


Usage
-----

Repast HPC 2.2.0 can be activated using the module file::

    module load apps/repast_hpc/2.2.0/gcc-mpich-3.1.4
    module load apps/repast_hpc/2.2.0/gcc-6.2-openmpi-2.1.1


Note that the above module files also loads GCC 6.2.0 compiler and either MPICH-3.1.4 or Open MPI 2.1.1.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run the ``zombie_model`` example in parallel and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=06:00:00
    #$ -l rmem=2G
    #$ -pe mpi 4

    module load apps/repast_hpc/2.2.0/gcc-mpich-3.1.4

    export repastroot=/usr/local/packages/apps/repast_hpc/2.2.0/gcc-6.2-mpich-3.1.4

    cp $repastroot/bin/zombie/* .

    mpirun ./zombie_model config.props model.props

The script requests four CPU cores using the MPI parallel environment ``mpi`` with 2 GB of real memory per CPU core. The requested runtime is 6 hours.


Installation notes
------------------

Repast HPC 2.2.0 was installed using the
:download:`install_repast_hpc.sh </decommissioned/sharc/software/install_scripts/apps/repast_hpc/2.2.0/gcc-6.2-mpich-3.1.4/install_repast_hpc.sh>` installation script.
The module file is
:download:`/usr/local/modulefiles/apps/repast_hpc/2.2.0/gcc-6.2-mpich-3.1.4 </decommissioned/sharc/software/modulefiles/apps/repast_hpc/2.2.0/gcc-6.2-mpich-3.1.4>`.

Third-party software required by Repast HPC 2.2.0 (Curl 7.42.1, NetCDF 4.2.1.1, NetCDF-CXX 4.2 and Boost 1.61.0) were installed in ``/usr/local/packages/apps/repast_hpc/2.2.0/third-party-mpich-3.1.4`` using the GCC 6.2.0 compiler with MPICH-3.1.4.

The installation of Repast HPC 2.2.0 was tested by running the example batch submission script (above).

