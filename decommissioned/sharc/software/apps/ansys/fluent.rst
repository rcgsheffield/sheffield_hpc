.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _ansys-sharc-fluent:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/sharc-sidebar.rst

Fluent
========================

.. contents::
    :depth: 3

----------------

ANSYS Fluent is a Computational Fluid Dynamics (CFD) code for modelling fluid flow, heat transfer, mass transfer and chemical reactions.
Fluent has interfaces to other pre and post processing packages supplied by ANSYS such as ICEMCFD or Ensight and can incorporate user developed models via user defined functions.
Fluent can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPU and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst
  
.. caution::

    Do not use versions **prior** to ANSYS 19.0 if cross-node MPI is taking place as these older versions are no longer supported nor will 
    work correctly with cross-node MPI jobs.

----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-sharc.rst

--------------------

Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on ShARC with the ``qrshx`` command which supports graphical applications.
You can load an ANSYS module above and then start the fluent program by running the ``fluent`` command.

.. caution::

  Warning for ANSYS versions >= 18.0 using the command ``fluent`` results in an unresponsive fluent launcher. To launch fluent and bypass the launcher use ``fluent dim`` where dim = 2d, 2ddp, 3d or 3ddp **or** unset the following environment variables before running the command::

    unset SGE_TASK_ID
    unset RESTARTED

If desired, the ANSYS Workbench GUI executable can be launched with the  ``runwb2`` command.
To use more than a single core, you should write a batch job script and fluent journal file for submission to the batch queues.

--------------------

Batch jobs
----------

To submit Fluent jobs with larger resources a batch job must be submitted to the scheduler. A Fluent batch job is composed of a Fluent journal file which tells Fluent what to do and submission script which tells the scheduler how much resource to request and how to start Fluent.

Fluent Journal files
^^^^^^^^^^^^^^^^^^^^

A Fluent journal file is effectively a sequence of TUI and/or Scheme commands that you’ll supply to Fluent instead of using the GUI / TUI.
A more thorough explanation and tutorial on how to make a Fluent journal file can be found on the following page:  :ref:`Writing Fluent journal files. <writing-fluent-journal-files>`

.. important::

  It is critical that you consult with the :ref:`Fluent journal syntax <writing-fluent-journal-files>` documentation linked above in order to ensure features such as autosaving and intermediate save states are turned on and functioning correctly!

Batch Submission Script
^^^^^^^^^^^^^^^^^^^^^^^

Fluent is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` parallel environments but will use its in-built MPI communications for both.
On ShARC, cross process communication must use the RSH protocol instead of SSH.
This necessitates the use of either the ``smp`` (up to 16 cores on a single node only) or ``mpi-rsh`` (as many cores as desired across many nodes) parallel processing environments.


Sample MPI Fluent Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""

The following is an example batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``test.jou``, and carry out a 2D double precision CFD simulation.
The script requests 8 cores using the MPI parallel environment ``mpi-rsh`` with a runtime of 30 mins and 2 GB of real memory per core. The Fluent input journal file is ``test.jou``.

.. hint::

    * The ``#$ -V`` SGE option **can** be used to instruct SGE to import your current terminal environment variables. **CAUTION** - 
      this may not be desirable and can break job submission if jobs are submitted from an existing interactive job.
    * Use of the ``mpi-rsh`` parallel environment to run MPI parallel jobs for Ansys is required if using more than 16 cores on ShARC.
    * The ``2ddp`` argument is used to specify a 2D double precision simulation. Valid values include: ``2d``, ``2ddp``, ``3d`` and ``3ddp``
    * The argument ``$NSLOTS`` is a Sun of Grid Engine variable which will return the requested number of cores.
    * The argument ``-mpi=intel`` instructs Fluent to use the in-built Intel MPI communications - important for using the high performance :ref:`Omnipath networking <sharc-network-specs>` between nodes.
    * The argument ``-pib.infinipath`` instructs Fluent to use the high performance Omnipath networking. :ref:`Omnipath networking <sharc-network-specs>` This will not work on versions prior to 19.0.
    * The arguments ``-gu`` and ``-driver null`` instruct Fluent that it will be running with no GUI to avoid errors caused by plot / figure export.
    * The bash **for loop** logic is used to construct a machine file to ensure Fluent will allocate MPI tasks correctly.
    * The ``-cnf=$MACHINEFILE`` argument is used to supply the PATH to the machine file created for Fluent.

.. caution::

    * The arguments ``-sgepe mpi-rsh -sge`` are **not required** and will cause issues if used with Fluent 21.1 or above.


.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi-rsh 8
    #$ -N JobName

    MACHINEFILE="machinefile.$JOB_ID"

    for host in `cat $PE_HOSTFILE | awk '{print $1}'`; do
        num=`grep $host $PE_HOSTFILE | awk '{print $2}'`
        for i in `seq 1 $num`; do
        echo $host >> $MACHINEFILE
        done
    done

    module load apps/ansys/22.2/binary
    fluent 3ddp -i test.jou -gu -t $NSLOTS -rsh -mpi=intel -driver null -cnf=$MACHINEFILE -pib.infinipath

-----------------------

Sample SMP Fluent Scheduler Job Script
""""""""""""""""""""""""""""""""""""""""

The following is an example batch submission script, ``cfd_job.sh``, to run the executable ``fluent`` with input journal file ``test.jou``, and carry out a 2D double precision CFD simulation. The script requests 8 cores using the SMP parallel environment ``smp`` with a runtime of 30 mins and 2 GB of real memory per core. The Fluent input journal file is ``test.jou``. The infinipath option is omitted as this job runs within a single node.

.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 8
    #$ -N JobName

    module load apps/ansys/22.2/binary

    fluent 2ddp -i test.jou -gu -t $NSLOTS -driver null


Further details about how to construct batch jobs can be found on the :ref:`batch submission guide <submit_batch_sharc>` page

The job is submitted to the queue by typing:

.. code-block:: bash

    qsub cfd_job.sh

----------------

.. include:: ../../../../../referenceinfo/ANSYS/fluent/export-fluent-plots-while-using-batch-jobs.rst

---------------

ANSYS Fluent training and help resources
----------------------------------------

.. important::

  Academic support requests should be directed to the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_  or 
  the `ANSYS Learning Forum <https://forum.ansys.com/>`_ (**ensure you register with your University email for priority support**).

ANSYS provides numerous academic training and help resources including tutorials, video lectures and examples for computational fluid dynamics products.
A short list of the resources ANSYS maintains is summarised below:

*  `"How to" youtube playlists for computational fluid dynamics products. <https://www.youtube.com/user/ANSYSHowToVideos/playlists?view=50&sort=dd&shelf_id=3>`_
*  `An extensive number of free online courses on computational fluid dynamics products and theory <https://courses.ansys.com/index.php/fluids/>`_

Notes
-------

The previous options below have been removed due to a bug in Fluent 21.1 and above which results in incorrect job rewriting and resubmission to the scheduler. 
All available versions above 18.2 have been tested and should function correctly with the manually specified machine file for batch MPI jobs.

* **-sge** forcing Fluent to recognise job submission via SGE.
* **-sgepe** selecting the *mpi-rsh* SGE parallel environment.

