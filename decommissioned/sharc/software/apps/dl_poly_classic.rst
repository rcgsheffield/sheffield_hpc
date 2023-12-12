.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

DL_POLY_CLASSIC
===============

.. sidebar:: DL_POLY_CLASSIC
   
   :Version: 1.9
   :Dependencies: GCC compiler and Open MPI. Modules loaded for GCC 6.2.0, Open MPI 2.1.1 
   :URL: https://ccpforge.cse.rl.ac.uk/gf/project/dl_poly_classic/ 
   :Documentation: https://www.ccp5.ac.uk/sites/www.ccp5.ac.uk/files/dl_poly_classic/USRMAN.pdf

DL_POLY_CLASSIC is a general purpose classical molecular dynamics (MD) simulation software developed at Daresbury Laboratory by I.T. Todorov and W. Smith.

Usage
-----

DL_POLY_CLASSIC 1.9 can be activated using the module file::

    module load apps/dl_poly_classic/1.9/gcc-6.2-openmpi-2.1.1
	
The DL_POLY_CLASSIC executable is ``DLPOLY.X``. Three DL_POLY input files ``CONFIG``, ``CONTROL`` and ``FIELD`` are required in the directory where you run your job.

Batch usage
-----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``DLPOLY.X`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 8

    module load apps/dl_poly_classic/1.9/gcc-6.2-openmpi-2.1.1
    
    mpirun DLPOLY.X

The script requests 8 cores using the MPI parallel environment ``mpi`` with a runtime of 30 mins and 2 GB of real memory per core.
*Note:* If your ``OUTPUT`` file appears truncated when running a DL_POLY_CLASSIC job using MPI, then add the ``l_scr`` keyword to your ``CONTROL`` file to place the output in the standard output file.

Installation notes
------------------

DL_POLY_CLASSIC 1.9 can be installed using the
:download:`install_dl_poly_classic.sh </decommissioned/sharc/software/install_scripts/apps/dl_poly_classic/1.9/gcc-6.2-openmpi-2.1.1/install_dl_poly_classic.sh>` script; the module
file is
:download:`gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/dl_poly_classic/1.9/gcc-6.2-openmpi-2.1.1>`.


The installation of DL_POLY_CLASSIC was tested using TEST01 for DL_POLY_CLASSIC
(https://ccpforge.cse.rl.ac.uk/gf/download/frsrelease/145/8489/TEST1.tar.gz)
    

