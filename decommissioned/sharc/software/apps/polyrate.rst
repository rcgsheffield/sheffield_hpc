.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Polyrate
========

.. sidebar:: Polyrate (with Gaussrate)

   :Version: 17 (20170808)
   :Dependencies: Modules for Open MPI 2.1.1, GCC 6.2.0 and Gaussian 09 D.01 loaded.
   :URL for Polyrate: https://comp.chem.umn.edu/polyrate/
   :URL for Gaussrate: https://t1.chem.umn.edu/gaussrate/
   :Documentation for Polyrate: https://comp.chem.umn.edu/polyrate/170808_Polyrate_Manual_v17.pdf
   :Documentation for Gaussrate: https://comp.chem.umn.edu/gaussrate/170808_Gaussrate_17B_Manual.pdf
   :Quickstart Guide for Gaussrate: https://comp.chem.umn.edu/gaussrate/GAUSSRATEQuickstartGuide.pdf


Polyrate 17: Computer Program for the Calculation of Chemical Reaction Rates for Polyatomics. Gaussrate 17-B provides an interface between two other programs: Polyrate version 2017 and Gaussian 16 / 09.
**Note:** Polyrate 17 and Gaussrate 17-B were compiled on ShARC to use the Reaction Path Variational Transition State Theory (RP-VTST) executables.


Usage
-----

Polyrate 17 and Gaussrate 17-B can be activated using the module file::

    module load apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1

The Polyrate/Gaussrate executable script is ``shuttle``. All the Polyrate 17 and Gaussrate 17-B executables are in ``/usr/local/packages/apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1/polyrate17/exe``.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 4

    module load apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1

    export GAUSS_SCRDIR=$TMPDIR
    export scratchdir=$TMPDIR

    ./ch5tr1.jc

The script requests 4 cores using the shared memory parallel environment ``smp`` with a runtime of 30 mins and 2 GB of real memory per core. The Polyrate job control script is ``ch5tr1.jc`` and is for the test run example *ch5tr1*.
**Note:** The Polyrate environment variables ``polydir`` and ``gausspath`` are set in the module file.

The *ch5tr1* test run, an example calculation using Gaussrate, is described in the documentation and the input files and job control script can be found at ``/usr/local/packages/apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1/polyrate17/gaussrate17-B/testrun/ch5``.


Installation notes
------------------

Polyrate 17 and Gaussrate 17-B were installed using the
:download:`install_polyrate17.sh </decommissioned/sharc/software/install_scripts/apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1/install_polyrate17.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1 </decommissioned/sharc/software/modulefiles/apps/polyrate/17_20170808/gaussrate17-B/gcc-6.2-openmpi-2.1.1>`.
Polyrate 17 and Gaussrate 17-B were compiled on ShARC to use the Reaction Path Variational Transition State Theory (RP-VTST) executables.

The Polyrate 17 and Gaussrate 17-B installation was tested by running a batch job using the ``my_job.sh`` batch script, above, for the *ch5tr1* test run.

