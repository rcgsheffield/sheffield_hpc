ANSYSEM
=======

.. sidebar:: ANSYSEM

   :Version: 23.2
   :URL: http://www.ansys.com


ANSYS Electromagnetics Suite is a multiphysics simulation software solution that enables you to design and simulate electromagnetic devices and perform thermal analysis.

.. note::

    * The University of Sheffield ANSYS licence servers currently only support ANSYS EM 2020 R1 or higher.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

--------------------

Interactive jobs
----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

ANSYSEM software can be loaded using the following module command:

.. code-block:: 

    $ module load ANSYSEM/23.2/binary

If desired, the ANSYSEM GUI executable can be launched with the  ``ansysedt`` command. Note that to use the ANSYSEM GUI you will need to be in a :ref:`flight graphical session on Stanage <flight-desktop>`.

-------

Batch jobs
----------

The following is an example batch submission script which is submitted to the queue by typing ``sbatch my_job.sh``::

    #!/bin/bash
    #SBATCH --ntasks=4
    #SBATCH --cpus-per-task=1
    #SBATCH --mem-per-cpu=2G
    #SBATCH --job-name=test_job
    #SBATCH --output=test_output
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    module load ANSYSEM/23.2/binary

    ansysedt -ng -BatchSolve -Distributed -machinelist num=$SLURM_NTASKS -batchoptions 'HPCLicenseType'='pool' -useElectronicsPPE Tee.aedt

The script requests 4 cores with a runtime of 30 mins and 2 GB of real memory per core. The Ansys EM input file is ``Tee.aedt`` and batch options 
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

ANSYSEM was installed using the shipped installer (not EasyBuild).


