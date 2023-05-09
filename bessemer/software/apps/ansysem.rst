Ansys EM
========

.. sidebar:: Ansys EM

   :Versions:  21.1 & 21.2
   :Dependencies: For integration with Ansys Workbench requires Ansys 21.1 & 21.2
   :URL: http://www.ansys.com



ANSYS Electromagnetics Suite for Linux/Unix.

.. note::

    * The University of Sheffield ANSYS licence servers currently only support ANSYS EM 2020 R1 or higher.


.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

Usage
-----

Ansys EM can be activated using the module files::

    module load ANSYSEM/21.1/binary
    module load ANSYSEM/21.2/binary



Ansys EM is integrated with the Ansys Workbench GUI (the ``runwb2`` executable) for each version. 
The Ansys EM exectuable is ``ansysedt``.


Batch jobs
----------

The following is an example batch submission script which is submitted to the queue by 
typing ``sbatch my_job.sh``::

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=8
    #SBATCH --mem=2000
    #SBATCH --job-name=name_ansysedt_smp_8
    #SBATCH --output=output_ansysedt_smp_8
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    module load ANSYSEM/21.1/binary

    ansysedt -ng -BatchSolve -Distributed -machinelist num=$SLURM_NTASKS -batchoptions 'HPCLicenseType'='pool' -useElectronicsPPE Tee.aedt

The script requests 8 cores with a runtime of 30 mins and 2 GB of real memory.
The Ansys EM input file is ``Tee.aedt`` and batch options ``'HPCLicenseType'='pool'`` 
to change the HPC licencing from "pack" (the default) to "pool".

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

Ansys EM 21.1: there is no install script;
the module file is
:download:`/usr/local/modulefiles/live/noeb/ANSYSEM/21.1/binary </bessemer/software/modulefiles/ANSYSEM/21.1/binary>`.

Ansys EM 21.2: there is no install script;
the module file is
:download:`/usr/local/modulefiles/live/noeb/ANSYSEM/21.2/binary </bessemer/software/modulefiles/ANSYSEM/21.2/binary>`.

The binary installations were tested using ``runwb2`` and the above batch submission script.
