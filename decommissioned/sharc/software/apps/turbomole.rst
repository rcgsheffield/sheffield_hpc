.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

TURBOMOLE
=========

.. sidebar:: TURBOMOLE

   :Versions: 7.2, 7.2.1
   :Dependencies: No additional modules loaded.
   :URL: http://www.turbomole.com/
   :Documentation: http://www.turbomole-gmbh.com/turbomole-manuals.html


TURBOMOLE: Program Package for ab initio Electronic Structure Calculations.


Usage
-----

TURBOMOLE 7.2 or 7.2.1 can be activated using the module files::

    module load apps/turbomole/7.2/binary
    module load apps/turbomole/7.2.1/binary

An example of a TURBOMOLE executable is ``jobex``. **Note:** TURBOMOLE is configured on ShARC to use the serial and SMP executables (i.e. ``export PARA_ARCH=SMP``).

**Important note:** Only licensed users of TURBOMOLE are entitled to use the code; refer to TURBOMOLE's website for license details: http://www.turbomole-gmbh.com/how-to-buy.html. Access to TURBOMOLE on ShARC is restricted to members of the unix group ``turbomole``.
To be added to this group, please contact ``research-it@sheffield.ac.uk`` and provide evidence of your eligibility to use TURBOMOLE.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``ridft_smp`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 4

    module load apps/turbomole/7.2/binary

    export TURBOTMPDIR=$TMPDIR
    export PARNODES=4

    ridft_smp > ridft_smp.out

The script requests 4 cores using the OpenMP parallel environment ``smp`` with a runtime of 30 mins and 2 GB of real memory per core. The TURBOMOLE input files are required to be in the directory where you run your job.


Installation notes
------------------

TURBOMOLE 7.2 was installed as a binary installation using the
:download:`install_turbomole.sh </decommissioned/sharc/software/install_scripts/apps/turbomole/7.2/binary/install_turbomole.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/turbomole/7.2/binary </decommissioned/sharc/software/modulefiles/apps/turbomole/7.2/binary>`.

TURBOMOLE 7.2.1 was installed as a binary installation using the
:download:`install_turbomole_721.sh </decommissioned/sharc/software/install_scripts/apps/turbomole/7.2.1/binary/install_turbomole_721.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/turbomole/7.2.1/binary </decommissioned/sharc/software/modulefiles/apps/turbomole/7.2.1/binary>`.

The TURBOMOLE 7.2 and 7.2.1 installations were tested by running the ``TTEST`` command in the ``$TURBODIR/TURBOTEST`` directory as part of the installation procedure.

