.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Ansys EM
========

.. sidebar:: Ansys EM

   :Versions: 16.1, 17.2, 18.0, 18.2, 19.0, 19.1, 19.2, 19.3,  19.4, 20.2, 21.1 & 22.2
   :Dependencies: For integration with Ansys Workbench requires Ansys 16.1, 17.2, 18.0, 18.2, 19.0, 19.1, 19.2, 19.3, 19.4, 20.2, 21.1 & 22.2
   :URL: http://www.ansys.com



ANSYS Electromagnetics Suite for Linux/Unix.

.. note::

    * The University of Sheffield ANSYS licence servers currently only support ANSYS EM 2020 R1 or higher.


.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

Usage
-----

Ansys EM can be activated using the module files::

    module load apps/ansysem/16.1
    module load apps/ansysem/17.2
    module load apps/ansysem/18.0/binary
    module load apps/ansysem/18.2/binary
    module load apps/ansysem/19.0/binary
    module load apps/ansysem/19.1/binary
    module load apps/ansysem/19.2/binary
    module load apps/ansysem/19.3/binary
    module load apps/ansysem/19.4/binary
    module load apps/ansysem/20.2/binary
    module load apps/ansysem/21.1/binary
    module load apps/ansysem/22.2/binary


Ansys EM is integrated with the Ansys Workbench GUI (the ``runwb2`` executable) for each version. The Ansys EM exectuable is ``ansysedt``.


.. note::

        An accelerated-graphics interactive session with X Window support (i.e. a :ref:`hw-accel-gfx` interactive session on ShARC) is required to run the ``ansysedt`` executable as a GUI. On the login node, the command ``qsh-vis`` will initiate an accelerated-graphics interactive session.



Batch jobs
----------

The following is an example batch submission script which is submitted to the queue by typing ``qsub my_job.sh``::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 8

    module load apps/ansysem/22.2

    ansysedt -ng -BatchSolve -Distributed -machinelist num=8 -batchoptions 'HPCLicenseType'='pool' -useElectronicsPPE Tee.aedt

The script requests 8 cores using the MPI parallel environment ``mpi`` with a runtime of 
30 mins and 2 GB of real memory per core. The Ansys EM input file is ``Tee.aedt`` and batch options 
``'HPCLicenseType'='pool'`` to change the HPC licencing from "pack" (the default) to "pool".

.. note::

    * The University of Sheffield ANSYS licence servers currently only support ANSYS EM 2020 R1 or higher.
    * The ``-useElectronicsPPE`` argument is required if you are using the University of Sheffield ANSYS 
      licence server however if you are using an alternative licencing method (e.g. a flat-file) 
      and one of the older modules this option is unlikely to be required.
    * If you are using an older module the batch options may need adjusting from 
      ``-batchoptions 'HPCLicenseType'='pool'`` to project type specific options 
      `click here and see post 4. <https://forum.ansys.com/discussion/5955/hfsshpc-vs-hfsshpc-pack-license>`_
    * If you are using commercial licenses the use of ``-batchoptions 'HPCLicenseType'='pack'`` 
      is likely compulsory.

Installation notes
------------------

Ansys EM 16.1 was installed using the
:download:`install_ansysem.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/16.1/install_ansysem.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/16.1 </decommissioned/sharc/software/modulefiles/apps/ansysem/16.1>`.

Ansys EM 17.2 was installed using the
:download:`install_ansysem.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/17.2/install_ansysem.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/17.2 </decommissioned/sharc/software/modulefiles/apps/ansysem/17.2>`.

Ansys EM 18.0 was installed using the
:download:`install_ansysem_180.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/18.0/binary/install_ansysem_180.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/18.0/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/18.0/binary>`.

Ansys EM 18.2 was installed using the
:download:`install_ansysem_182.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/18.2/binary/install_ansysem_182.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/18.2/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/18.2/binary>`.

Ansys EM 19.0 was installed using the
:download:`install_ansysem_190.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/19.0/binary/install_ansysem_190.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/19.0/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/19.0/binary>`.

Ansys EM 19.1 was installed using the
:download:`install_ansysem_191.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/19.1/binary/install_ansysem_191.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/19.1/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/19.1/binary>`.

Ansys EM 19.2 was installed using the
:download:`install_ansysem_192.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/19.2/binary/install_ansysem_192.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/19.2/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/19.2/binary>`.

Ansys EM 19.3 was installed using the
:download:`install_ansysem_193.sh </decommissioned/sharc/software/install_scripts/apps/ansysem/19.3/binary/install_ansysem_193.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/19.3/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/19.3/binary>`.

Ansys EM 19.4: there is no install script;
the module file is
:download:`/usr/local/modulefiles/apps/ansysem/19.4/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/19.4/binary>`.

Ansys EM 20.2: there is no install script;
the module file is
:download:`/usr/local/modulefiles/apps/ansysem/20.2/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/20.2/binary>`.

Ansys EM 21.1: there is no install script;
the module file is
:download:`/usr/local/modulefiles/apps/ansysem/21.1/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/21.1/binary>`.

Ansys EM 21.1: there is no install script;
the module file is
:download:`/usr/local/modulefiles/apps/ansysem/22.2/binary </decommissioned/sharc/software/modulefiles/apps/ansysem/22.2/binary>`.


The binary installations were tested using ``runwb2`` and the above batch submission script.

