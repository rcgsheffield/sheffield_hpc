.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

DL_POLY
=======

.. sidebar:: DL_POLY
   
   :Version: 4.08
   :Dependencies: GCC compiler and Open MPI. Modules loaded for GCC 6.2.0, Open MPI 2.1.1 and PLUMED 2.3.2. 
   :URL: https://www.scd.stfc.ac.uk/Pages/DL_POLY.aspx  
   :Documentation: ftp://ftp.dl.ac.uk/ccp5/DL_POLY/DL_POLY_4.0/DOCUMENTS/USRMAN4.pdf

DL_POLY is a general purpose classical molecular dynamics (MD) simulation software developed at Daresbury Laboratory by I.T. Todorov and W. Smith.

Usage
-----

DL_POLY 4.08 can be activated using the module file::

    module load apps/dl_poly/4.08/gcc-6.2-openmpi-2.1.1
	
The DL_POLY executable is ``DLPOLY.Z``. Three DL_POLY input files ``CONFIG``, ``CONTROL`` and ``FIELD`` are required in the directory where you run your job.

Batch usage
-----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``DLPOLY.Z`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 8

    module load apps/dl_poly/4.08/gcc-6.2-openmpi-2.1.1
    
    mpirun DLPOLY.Z

The script requests 8 cores using the MPI parallel environment ``mpi`` with a runtime of 30 mins and 2 GB of real memory per core.
*Note:* If your ``OUTPUT`` file appears truncated when running a DL_POLY job using MPI, then add the ``l_scr`` keyword to your ``CONTROL`` file to place the output in the standard output file (see section 5.2.5 Parallel I/O in the user manual).

Installation notes
------------------

DL_POLY 4.08 was installed using the
:download:`install_dl_poly.sh </decommissioned/sharc/software/install_scripts/apps/dl_poly/4.08/gcc-6.2-openmpi-2.1.1/install_dl_poly.sh>` script; the module
file is
:download:`gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/dl_poly/4.08/gcc-6.2-openmpi-2.1.1>`.

During compilation DL_POLY 4.08 was optionally interfaced with the PLUMED 2.3.2 library.

The installation of DL_POLY 4.08 was tested using TEST 28 (see the above installation script and ftp://ftp.dl.ac.uk/ccp5/DL_POLY/DL_POLY_4.0/DATA/ for details).
    

