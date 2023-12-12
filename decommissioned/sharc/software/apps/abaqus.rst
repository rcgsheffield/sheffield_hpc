.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Abaqus
======

.. sidebar:: Abaqus

   :Versions: 2021, 2018, 2017-ga, 2017, 6.14-2
   :Dependencies: Module loaded for Intel compiler 15.0.7 (and Foxit for Abaqus version 6.14-2). User subroutines need Intel compiler 2011 or above, GCC 4.1.2 or above.
   :URL: http://www.3ds.com/products-services/simulia/products/abaqus/
   :Documentation: https://help.3ds.com/ (note: register for an account to access.)
   :Local URL: https://students.sheffield.ac.uk/it-services/research/software#a


Abaqus is a software suite for Finite Element Analysis (FEA) developed by Dassault Systèmes.


Usage
-----

Abaqus versions 2021, 2018, 2017-ga, 2017 or 6.14-2 can be activated using the module files::

    module load apps/abaqus/2021/binary
    module load apps/abaqus/2018/binary
    module load apps/abaqus/2017-ga/binary
    module load apps/abaqus/2017/binary
    module load apps/abaqus/6.14-2/binary

Type ``abaqus cae`` to launch the Abaqus GUI from an interactive session with X Window support (e.g. an interactive ``qsh`` session). Please see usage note below for graphics support options.
Type ``abaqus`` for the command line interface. Typing ``abaqus -help`` will display a list of usage options.

Abaqus 2017-ga (module ``apps/abaqus/2017-ga/binary``) has the Tosca component installed and is equivalent to Abaqus 2017 ('ga' is an accronym for 'general availabilty').

.. note::

  When using hardware-accelerated graphics rendering for Abaqus 6.14-2 on ShARC, i.e., during a ``qsh-vis`` interactive session, please run ``abq6142 cae`` to launch the GUI. When using a general compute node for Abaqus 2017, 2017-ga or 2018, 2021 on ShARC, please run ``abaqus cae -mesa`` or ``abq2017 cae -mesa`` (or ``abq2018 cae -mesa``) to launch the GUI without support for hardware-accelerated graphics rendering. The option ``-mesa`` disables hardware-accelerated graphics rendering within Abaqus's GUI.

------------

Abaqus example problems
-----------------------

Abaqus contains a large number of example problems which can be used to become familiar with Abaqus on the system.
These example problems are described in the Abaqus documentation and can be obtained using the Abaqus ``fetch`` command.
For example, after loading the Abaqus module enter the following at the command line to extract the input file for test problem s4d::

    abaqus fetch job=s4d

This will extract the input file ``s4d.inp`` to run the computation defined by the commands and batch submission script below.

------------

Batch jobs
----------

The easiest way of running a batch job for a particular version of Abaqus (e.g. 6.14-2) is::

    module load apps/abaqus/6.14-2/binary
    runabaqus

The ``runabaqus`` command submits an Abaqus input file into the batch queuing system and can take a number of different parameters according to your requirements.
Typing ``runabaqus`` will display information about its usage. **Note:** ``runabaqus`` is not setup for use with Abaqus 2017, 2017-ga and 2018.

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run the executable ``abq6142`` and which is submitted to the queue by typing ``qsub my_job.sh``::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 4

    module load apps/abaqus/6.14-2/binary

    abq6142 job=my_job input=s4d.inp scratch=$TMPDIR memory="2gb" interactive mp_mode=threads cpus=$NSLOTS

The above script requests 4 cores using the OpenMP parallel environment ``smp`` with a runtime of 30 mins and 2 GB of real memory per core. The Abaqus input file is ``s4d.inp``.

**User subroutines:** The script below is an example of a batch submission script for a single core job with a runtime of 30 mins, 8 GB of real memory and with user subroutine ``umatmst3.f`` and input file ``umatmst3.inp``::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=8G

    module load apps/abaqus/6.14-2/binary

    abq6142 job=my_user_job input=umatmst3.inp user=umatmst3.f scratch=$TMPDIR memory="8gb" interactive

The input file ``umatmst3.inp`` and the Fortran user subroutine ``umatmst3.f`` are obtained by typing ``abaqus fetch job=umatmst3*``.
Note that the module ``dev/intel-compilers/15.0.7``, required for user subroutines, is automatically loaded when the module for Abaqus is loaded.

**Important information:** Please note that at present Abaqus will not run on more than one node when using MPI on ShARC. The SGE option ``-l excl=true`` can be used to request that an MPI job runs on one compute node only. The recommended way to run Abaqus in parallel on ShARC is to use OpenMP.

------------

Documentation
-------------

The PDF viewer ``foxit`` can be launched to view the PDF documentation for Abaqus 6.14-2 located at ``/usr/local/packages/apps/abaqus/6.14-2/binary/Documentation/docs/v6.14/pdf_books``.

Abaqus 2017 documentation in HTML format is located at ``/usr/local/packages/apps/abaqus/2017/binary/Documentation/DSSIMULIA_Established_homepage_English.htm``.

Abaqus 2017-ga documentation in HTML format is located at ``/usr/local/packages/apps/abaqus/2017-ga/binary/SIMULIA2017doc/DSSIMULIA_Established_homepage_English.htm``.

Abaqus 2018 documentation in HTML format is located at ``/usr/local/packages/apps/abaqus/2018/binary/SIMULIA2018doc/DSSIMULIA_Established_homepage_English.htm``.

Abaqus 2021 documentation can be found online via Dassault Systèmes help website https://help.3ds.com/ as version 2021 under SIMULIA Established Products (Abaqus, fe-safe, Isight, and Tosca). Login required.

------------

Licensed options
----------------

All available Abaqus licenses can be viewed using ``abaqus licensing r`` e.g. ::

   $ module load apps/abaqus/2017/binary
   $ abaqus licensing r

Run ``abaqus licensing`` for usage info for the Abaqus licensing sub-command. Run ``abaqus licensing ru`` to see current licence usage.

------------

Checkpointing your work
-----------------------

Abaqus has a built-in checkpoint and restart feature.

Add the following to the input file (refer to official Abaqus documentation for detail): ::

   *RESTART, WRITE, OVERLAY, FREQUENCY=10

**OVERLAY** saves only one state, i.e. overwrites the restart file every time new restart information is written

**FREQUENCY=N** writes restart information every N timesteps

And, to restart the job, create a new input file newJobName with only a single line:  ::

   *RESTART, READ

Then run Abaqus specifying both the new and old job names:  ::

   abaqus jobname=newJobName oldjob=oldJobName

------------

Installation notes
------------------
Abaqus 2021 was installed using the Dassault StartGUI.sh interactive GUI installer. The module file is
:download:`/usr/local/modulefiles/apps/abaqus/2021/binary </decommissioned/sharc/software/modulefiles/apps/abaqus/2021/binary>`.

Abaqus 2018 was installed using the
:download:`install_abaqus_2018.sh </decommissioned/sharc/software/install_scripts/apps/abaqus/2018/binary/install_abaqus_2018.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/abaqus/2018/binary </decommissioned/sharc/software/modulefiles/apps/abaqus/2018/binary>`.

Abaqus 2017-ga was installed using the
:download:`install_abaqus_2017-ga.sh </decommissioned/sharc/software/install_scripts/apps/abaqus/2017-ga/binary/install_abaqus_2017-ga.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/abaqus/2017-ga/binary </decommissioned/sharc/software/modulefiles/apps/abaqus/2017-ga/binary>`.

Abaqus 2017 was installed using the
:download:`install_abaqus_2017.sh </decommissioned/sharc/software/install_scripts/apps/abaqus/2017/binary/install_abaqus_2017.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/abaqus/2017/binary </decommissioned/sharc/software/modulefiles/apps/abaqus/2017/binary>`.

Abaqus 6.14-2 was installed using the
:download:`install_abaqus.sh </decommissioned/sharc/software/install_scripts/apps/abaqus/6.14-2/binary/install_abaqus.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/abaqus/6.14-2/binary </decommissioned/sharc/software/modulefiles/apps/abaqus/6.14-2/binary>`.

The binary installations were tested by launching ``abaqus cae`` and by using the above batch submission scripts.
Abaqus at present does not run on more than one node when using MPI due to password-less ssh being disabled across nodes on ShARC.

