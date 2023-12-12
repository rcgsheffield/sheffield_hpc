.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _ansys-sharc-mechanical:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/sharc-sidebar.rst

Mechanical / MAPDL
=========================

.. contents::
    :depth: 3

----------------

Ansys Mechanical is a finite element analysis (FEA) tool that enables you to analyze complex product architectures and solve difficult mechanical problems.
You can use Ansys Mechanical to simulate real world behavior of components and sub-systems, and customize it to test design variations quickly and accurately.
ANSYS Mechanical has interfaces to other pre and post processing packages supplied by ANSYS and can make use of  built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node CPUs and can scale to hundreds of cores.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-sharc.rst

--------------------

Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on ShARC with the ``qrshx`` command which supports graphical applications.
You can load an ANSYS module above and then start the ANSYS mechanical launcher program by running the ``launcher`` command.

If desired, the ANSYS Workbench GUI executable can be launched with the  ``runwb2`` command.
To use more than a single core, you should write a batch job script and ANSYS mechanical APDL script file for submission to the batch queues.

--------------------

Batch jobs
----------

MAPDL is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` parallel environments but will use its in-build MPI communications for both.
This necessitates the use of either the ``smp`` (up to 16 cores on a single node only) or ``mpi`` (as many cores as desired across many nodes) parallel processing environments.


Sample MPI MAPDL Scheduler Job Script
""""""""""""""""""""""""""""""""""""""""""

.. error::
    * Please use ANSYS versions 19.4 and above to avoid errors which result in MAPDL falling back to 
      using SMP rather than MPI mode. 

The following is an example batch submission script, ``mech_job.sh``, to run the mechanical executable ``mapdl`` with input file ``CrankSlot_Flexible.inp``, and carry out a mechanical simulation.
The script requests 4 cores using the MPI parallel environment with a runtime of 10 mins and 2 GB of real memory per core:

.. hint::

    * The ``#$ -V`` SGE option **can** be used to instruct SGE to import your current terminal environment variables. **CAUTION** - 
      this may not be desirable and can break job submission if jobs are submitted from an existing interactive job.
    * Use of the ``mpi`` parallel environment to run MPI parallel jobs for Ansys is required if using more than 16 cores on ShARC.
    * The argument ``$NSLOTS`` is a Sun of Grid Engine variable which will return the requested number of cores.
    * The argument ``-mpi=INTELMPI`` instructs MAPDL to use the in-built Intel MPI communications - 
      important for using the high performance :ref:`Omnipath networking <sharc-network-specs>` between nodes.
    * The exported ``I_MPI_FABRICS`` and ``I_MPI_FALLBACK`` variables instruct MAPDL to use the high performance :ref:`Omnipath networking <sharc-network-specs>`.


.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -N JobName
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:10:00
    #$ -l rmem=2G
    #$ -pe mpi 4
    module load apps/ansys/22.2/binary

    MACHINEFILE="machinefile.$JOB_ID"

    for host in `cat $PE_HOSTFILE | awk '{print $1}'`; do
        num=`grep $host $PE_HOSTFILE | awk '{print $2}'`
        for i in `seq 1 $num`; do
        echo $host >> $MACHINEFILE
        done
    done

    MACHINELIST=""
    for host in $(cat $MACHINEFILE)
    do
        MACHINELIST+="${host}:1:"
    done

    export I_MPI_FABRICS=shm:ofi    #Set Omnipath. 
    export I_MPI_FALLBACK=no        #You may wish to allow fallback to ethernet.

    mapdl -b -np $NSLOTS -machines $MACHINELIST -mpi=INTELMPI -i CrankSlot_Flexible.inp

-----------------------

Sample SMP MAPDL Scheduler Job Script
""""""""""""""""""""""""""""""""""""""""""""

The following is an example batch submission script, ``mech_job.sh``, to run the mechanical executable ``mapdl`` with input file ``CrankSlot_Flexible.inp``, and carry out a mechanical simulation.
The script requests 4 cores using the SMP (``single node shared memory``) parallel environment with a runtime of 10 mins and 2 GB of real memory per core:

.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -N JobName
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:10:00
    #$ -l rmem=2G
    #$ -pe smp 4
    module load apps/ansys/22.2/binary
    mapdl -b -np $NSLOTS -smp -i CrankSlot_Flexible.inp


Further details about how to construct batch jobs can be found on the :ref:`batch submission guide <submit_batch_sharc>` page

The job is submitted to the queue by typing:

.. code-block:: bash

    qsub mech_job.sh

-----------------------

ANSYS Mechnical training and help resources
-------------------------------------------

.. important::

  Academic support requests should be directed to the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_  or 
  the `ANSYS Learning Forum <https://forum.ansys.com/>`_ (**ensure you register with your University email for priority support**).

ANSYS provides numerous academic training and help resources including tutorials, video lectures and examples for for structural and mechnical products.
A short list of the resources ANSYS maintains is summarised below:

*  `"How to" youtube playlists for structural and mechnical products. <https://www.youtube.com/user/ANSYSHowToVideos/playlists?view=50&sort=dd&shelf_id=8>`_
*  `An extensive number of free online courses on structural and mechnical products and theory <https://courses.ansys.com/index.php/structures/>`_
