.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Code Saturne
============

.. sidebar:: Code Saturne
   
   :Versions: 4.0.7, 5.0.4
   :Dependencies: GCC compiler, Open MPI, Scotch/PT-Scotch and Libxml2. Modules loaded for GCC 4.9.4 and Open MPI 1.10.4 *or* GCC 6.2.0 and Open MPI 2.0.1 for version 4.0.7; Intel 17.0.0 and Open MPI 2.0.1 for version 5.0.4
   :URL: http://code-saturne.org/cms/ 
   :Documentation: http://code-saturne.org/cms/documentation

*Code_Saturne* solves the Navier-Stokes equations for 2D, 2D-axisymmetric and 3D flows, steady or unsteady, laminar or turbulent, incompressible or weakly dilatable, isothermal or not, with scalars transport if required.

Usage
-----

Code Saturne 4.0.7 or 5.0.4 can be activated using the module files::

    module load apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4
    module load apps/code_saturne/4.0.7/gcc-6.2-openmpi-2.0.1
    module load apps/code_saturne/5.0.4/intel-17.0.0-openmpi-2.0.1
	
Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``run_solver.sh``, to run Code Saturne 4.0.7 and which is submitted to the queue by typing ``qsub run_solver.sh``.::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 4

    # Load environment if this script is run directly.
    module load apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4

    # Run solver.
    mpiexec -n 4 cs_solver --param case1.xml --mpi $@
    export CS_RET=$?

    exit $CS_RET

The script requests 4 cores using the MPI parallel environment ``mpi`` with a runtime of 30 mins and 2G of real memory per core. The Code Saturne input file is ``case1.xml``.
*Note:* The above batch script was adapted from the ``run_solver`` script generated during the batch usage test (see Installation notes below).

Installation notes
------------------

Code Saturne 4.0.7 was installed with GCC 4.9.4 and Open MPI 1.10.4 using the
:download:`install_code_saturne.sh </decommissioned/sharc/software/install_scripts/apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4/install_code_saturne.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4 </decommissioned/sharc/software/modulefiles/apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4>`.

Code Saturne 4.0.7 was installed with GCC 6.2.0 and Open MPI 2.0.1 using the
:download:`install_code_saturne.sh </decommissioned/sharc/software/install_scripts/apps/code_saturne/4.0.7/gcc-6.2-openmpi-2.0.1/install_code_saturne.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/code_saturne/4.0.7/gcc-6.2-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/apps/code_saturne/4.0.7/gcc-6.2-openmpi-2.0.1>`.

Code Saturne 5.0.4 was installed with Intel 17.0.0 and Open MPI 2.0.1 using the
:download:`install_code_saturne_5.0.4.sh </decommissioned/sharc/software/install_scripts/apps/code_saturne/5.0.4/intel-17.0.0-openmpi-2.0.1/install_code_saturne_5.0.4.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/code_saturne/5.0.4/intel-17.0.0-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/apps/code_saturne/5.0.4/intel-17.0.0-openmpi-2.0.1>`.

The above installations used the libraries Scotch/PT-Scotch 6.0.4 and Libxml2 2.9.1. No additional, optional libraries were used during compilation.  

**Post-installation:** Please read the instructions at the end of the install script for the Code Saturne files to manually edit.

The installation of Code Saturne 4.0.7 was tested using the following example calculations.

**Interactive usage** test::

    $ module load apps/code_saturne/4.0.7/gcc-4.9.4-openmpi-1.10.4
    $ code_saturne create -s T_junction -c case1
    $ cp $build_dir/examples/1-simple_junction/case1/case1.xml ./T_junction/case1/DATA
    $ cp $build_dir/examples/1-simple_junction/mesh/downcomer.des ./T_junction/MESH
    $ cd ./T_junction/case1/DATA
    $ code_saturne run --param case1.xml
    $ cd ../RESU/yyyymmdd-hhmm
	
The output ``./T_junction/case1/RESU/yyyymmdd-hhmm/listing`` file should contain "END OF CALCULATION".

**Batch usage** test using the parallel environment ``mpi 4`` (performed after the interactive test above)::

    $ cd ./T_junction/case1/DATA
    $ code_saturne run --initialize --param case1.xml --nprocs 4
    $ cd ../RESU/yyyymmdd-hhmm
    $ vi run_solver
    $ qsub run_solver
	
The output ``./T_junction/case1/RESU/yyyymmdd-hhmm/listing`` file should contain "END OF CALCULATION".

**User subroutines** test (performed after the above two tests)::

    $ cd ./T_junction/case1/SRC
    $ cp ./REFERENCE/cs_user_parameters.f90 .
    $ code_saturne compile


