.. index::
    single: Abaqus

Abaqus
======

.. sidebar:: Abaqus

   :Versions:  6.13,6.12 and 6.11
   :Support Level: FULL
   :Dependancies: Intel Compiler
   :URL: http://www.3ds.com/products-services/simulia/products/abaqus/
   :Local URL:  https://www.shef.ac.uk/wrgrid/software/abaqus

Abaqus is a software suite for Finite Element Analysis (FEA) developed by Dassault Systèmes.

Interactive usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command. Alternatively, if you require more memory, for example 16 gigabytes, use the command :code:`qsh -l mem=16G` 

The latest version of Abaqus (currently version 6.13) is made available with the command

.. code-block:: none

        module load apps/abaqus

Alternatively, you can make a specific version available with one of the following commands

.. code-block:: none

      module load apps/abaqus/613
      module load apps/abaqus/612
      module load apps/abaqus/611

After that, simply type :code:`abaqus` to get the command-line interface to abaqus or type :code:`abaqus cae` to get the GUI interface.

Abaqus example problems
-----------------------
Abaqus contains a large number of example problems which can be used to become familiar with Abaqus on the system. These example problems are described in the Abaqus documentation, and can be obtained using the Abaqus fetch command. For example, after loading the Abaqus module enter the following at the command line to extract the input file for test problem s4d ::

    abaqus fetch job=s4d

This will extract the input file s4d.inp, to run the computation defined by this input file replace input=myabaqusjob with input=s4d in the commands and scripts below.

Batch submission of a single core job
-------------------------------------
In this example, we will run the s4d.inp file on a single core using 8 Gigabytes of memory.  After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qrsh` command.

Load version 6.13-3 of Abaqus and fetch the s4d example by running the following commands ::

    module load apps/abaqus/613
    abaqus fetch job=s4d

Now, you need to write a batch submission file. We assume you'll call this :code:`my_job.sge` ::

    #!/bin/bash
    #$ -S /bin/bash
    #$ -cwd
    #$ -l rmem=8G
    #$ -l mem=8G

    module load apps/abaqus

    abq6133 job=my_job input=s4d.inp scratch=/scratch memory="8gb" interactive

Submit the job with the command ``qsub my_job.sge``

Important notes:

* We have requested 8 gigabytes of memory in the above job. The ``memory="8gb"`` switch tells abaqus to use 8 gigabytes. The ``#$ -l rmem=8G`` and ``#$ -l mem=8G`` tells the system to reserve 8 gigabytes of real and virtual memory resptively. It is important that these numbers match.
* Note the word ``interactive`` at the end of the abaqus command. Your job will not run without it.

Batch submission of a single core job with user subroutine
----------------------------------------------------------
In this example, we will fetch a simulation from Abaqus' built in set of problems that makes use of user subroutines (UMATs) and run it in batch on a single core.  After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qrsh` command.

Load version 6.13-3 of Abaqus and fetch the umatmst3 example by running the following commands ::

    module load apps/abaqus/613
    abaqus fetch job=umatmst3*

This will produce 2 files: The input file ``umatmst3.inp`` and the Fortran user subroutine ``umatmst3.f``.

Now, you need to write a batch submission file. We assume you'll call this :code:`my_user_job.sge` ::

    #!/bin/bash
    #$ -S /bin/bash
    #$ -cwd
    #$ -l rmem=8G
    #$ -l mem=8G

    module load apps/abaqus/613
    module load compilers/intel/12.1.15

    abq6133 job=my_user_job input=umatmst3.inp user=umatmst3.f scratch=/scratch memory="8gb" interactive

Submit the job with the command ``qsub my_user_job.sge``

Important notes:

* In order to use user subroutimes, it is necessary to load the module for the intel compiler.
* The user-subroutine itself is passed to Abaqus with the switch ``user=umatmst3.f``
