.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

SIESTA
======

.. sidebar:: SIESTA

   :Version: 4.0.1
   :Dependencies: Modules loaded for Intel 17.0.0 compiler, Intel MKL 2017 library and, for MPI parallel support, Open MPI 2.0.1.
   :URL: https://launchpad.net/siesta
   :Documentation: https://launchpadlibrarian.net/326727596/siesta.pdf


A first-principles materials simulation code using DFT.
SIESTA is both a method and its computer program implementation, to perform efficient electronic structure calculations and ab initio molecular dynamics simulations of molecules and solids. SIESTA's efficiency stems from the use of strictly localized basis sets and from the implementation of linear-scaling algorithms which can be applied to suitable systems. A very important feature of the code is that its accuracy and cost can be tuned in a wide range, from quick exploratory calculations to highly accurate simulations matching the quality of other approaches, such as plane-wave and all-electron methods.


Usage
-----

SIESTA 4.0.1 can be activated using the module files::

    module load apps/siesta/4.0.1/intel-17.0.0
    module load apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1

Where the latter module file ``apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1`` loads the version compiled to run in parallel using Open MPI and loads the module for Open MPI 2.0.1.
The SIESTA executable is ``siesta``.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``siesta`` in parallel and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=06:00:00
    #$ -l rmem=2G
    #$ -pe mpi 8

    module load apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1

    mpirun siesta < my_input.fdf | tee my_input.out

The script requests eight CPU cores using the MPI parallel environment ``mpi``, with 2 GB of real memory per CPU core. The requested runtime is 6 hours.
The SIESTA input file is ``my_input.fdf``.


Installation notes
------------------

SIESTA 4.0.1 is available on ShARC as a serial version and as a parallel version using Open MPI. Both compilations use the Intel MKL maths library.

The serial version and the parallel version of SIESTA 4.0.1 were installed using the
:download:`install_siesta_4.0.1.sh </decommissioned/sharc/software/install_scripts/apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1/install_siesta_4.0.1.sh>` installation script.

The module file for the serial version is
:download:`/usr/local/modulefiles/apps/siesta/4.0.1/intel-17.0.0 </decommissioned/sharc/software/modulefiles/apps/siesta/4.0.1/intel-17.0.0>`.

The module file for the parallel version is
:download:`/usr/local/modulefiles/apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/apps/siesta/4.0.1/intel-17.0.0-openmpi-2.0.1>`.

The installations of SIESTA 4.0.1 were tested by using ``make check`` to run tests as part of the installation process (see the installation script for details).

