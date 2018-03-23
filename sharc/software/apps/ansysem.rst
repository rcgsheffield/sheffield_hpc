Ansys EM
========

.. sidebar:: Ansys EM
   
   :Versions: 16.1, 17.2, 18.0, 18.2 & 19.0
   :Dependencies: For integration with Ansys Workbench requires Ansys 16.1, 17.2, 18.0, 18.2 & 19.0
   :URL: http://www.ansys.com 
   :Local URL: http://www.shef.ac.uk/cics/research/software/fluent


ANSYS Electromagnetics Suite for Linux/Unix.


Usage
-----

Ansys EM can be activated using the module files::

    module load apps/ansysem/16.1
    module load apps/ansysem/17.2
    module load apps/ansysem/18.0/binary
    module load apps/ansysem/18.2/binary
    module load apps/ansysem/19.0/binary

Ansys EM is integrated with the Ansys Workbench GUI (the ``ansyswb`` executable) for each version. The Ansys EM exectuable is ``ansysedt``.

**Note:** An accelerated-graphics interactive session with X Window support (i.e. a :ref:`iceberg-hw-accel-gfx` interactive session on ShARC) is required to run the ``ansysedt`` executable as a GUI. On the login node, the command ``qsh-vis`` will initiate an accelerated-graphics interactive session.


Batch jobs
----------

The following is an example batch submission script which is submitted to the queue by typing ``qsub my_job.sh``::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 8

    module load apps/ansysem/16.1

    ansysedt -ng -BatchSolve -Distributed -machinelist num=8 -batchoptions 'HFSS/HPCLicenseType'='pool' -batchoptions 'HFSS-IE/HPCLicenseType'='pool' Tee.aedt
	
The script requests 8 cores using the MPI parallel environment ``mpi`` with a runtime of 30 mins and 2 GB of real memory per core. The Ansys EM input file is ``Tee.aedt`` and batch options ``'HFSS/HPCLicenseType'='pool'`` and ``'HFSS-IE/HPCLicenseType'='pool'`` change the HPC licencing from "pack" (the default) to "pool".	
	
Installation notes
------------------

Ansys EM 16.1 was installed using the
:download:`install_ansysem.sh </sharc/software/install_scripts/apps/ansysem/16.1/install_ansysem.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/16.1 </sharc/software/modulefiles/apps/ansysem/16.1>`.

Ansys EM 17.2 was installed using the
:download:`install_ansysem.sh </sharc/software/install_scripts/apps/ansysem/17.2/install_ansysem.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/17.2 </sharc/software/modulefiles/apps/ansysem/17.2>`.

Ansys EM 18.0 was installed using the
:download:`install_ansysem_180.sh </sharc/software/install_scripts/apps/ansysem/18.0/binary/install_ansysem_180.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/18.0/binary </sharc/software/modulefiles/apps/ansysem/18.0/binary>`.

Ansys EM 18.2 was installed using the
:download:`install_ansysem_182.sh </sharc/software/install_scripts/apps/ansysem/18.2/binary/install_ansysem_182.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/18.2/binary </sharc/software/modulefiles/apps/ansysem/18.2/binary>`.

Ansys EM 19.0 was installed using the
:download:`install_ansysem_190.sh </sharc/software/install_scripts/apps/ansysem/19.0/binary/install_ansysem_190.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansysem/19.0/binary </sharc/software/modulefiles/apps/ansysem/19.0/binary>`.

The binary installations were tested using ``ansyswb`` and the above batch submission script.
