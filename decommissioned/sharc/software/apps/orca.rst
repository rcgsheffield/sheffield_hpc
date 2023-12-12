.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

ORCA
====

.. sidebar:: ORCA

   :Version: 4.0.1
   :Dependencies: Module for Open MPI 2.1.1 loaded. Open MPI 2.0.2 and above is required for the ORCA 4.0.1 MPI binaries.
   :URL: https://orcaforum.cec.mpg.de/
   :Documentation: https://cec.mpg.de/fileadmin/media/Forschung/ORCA/orca_manual_4_0_1.pdf


An ab initio, DFT and semiempirical SCF-MO package. The program ORCA is a modern electronic structure program package written by F. Neese, with contributions from many current and former coworkers and several collaborating groups. The binaries of ORCA are available free of charge for academic users for a variety of platforms.


Usage
-----

ORCA 4.0.1 can be activated using the module file::

    module load apps/orca/4.0.1/binary

The ORCA 4.0.1 executable is ``orca``. All the ORCA 4.0.1 executables are in ``/usr/local/packages/apps/orca/4.0.1/binary/orca_4_0_1_linux_x86-64_openmpi202``.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``orca`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G

    module load apps/orca/4.0.1/binary
    
    orca my_input.inp > my_input.out

The script requests a serial job with a runtime of 30 mins and 2G of real memory. The ORCA 4.0.1 input file is ``my_input.inp``.


Installation notes
------------------

ORCA 4.0.1 was installed as a binary installation using the
:download:`install_orca.sh </decommissioned/sharc/software/install_scripts/apps/orca/4.0.1/binary/install_orca.sh>` script;
the module file is
:download:`binary </decommissioned/sharc/software/modulefiles/apps/orca/4.0.1/binary>`.

The ORCA 4.0.1 installation was tested by running a batch job using the ``my_job.sh`` batch script, above, with the text, below, in an ORCA input file. ::

    #
    # My first ORCA calculation :-)
    #
    ! HF SVP
    * xyz 0 1
    C 0 0 0
    O 0 0 1.13
    *

