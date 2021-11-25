.. _ansys-sharc-ls-dyna:

.. include:: ../ansys/sharc-sidebar.rst

ANSYS LS-DYNA
========================

.. contents::
    :depth: 3

----------------

Ansys LS-DYNA is the industry-leading explicit simulation software used for applications 
like drop tests, impact and penetration, smashes and crashes, occupant safety, and more.

ANSYS LS-DYNA can make use of built in :ref:`MPI <parallel_MPI>` to utilize multiple cross 
node CPU and can scale to hundreds of cores.

.. warning::

    For the academic year 2021-2022 a total of 12 MPP(multicore) licenses are available. 
    
    For any given MPI or SMP job you will use ``X-1`` ANSYS LS-DYNA MPP licenses where ``X`` is your 
    chosen number of cores.


----------------

.. include:: ../ansys/module-load-list.rst

--------------------

Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on ShARC with 
the ``qrshx`` command which supports graphical applications. You can load an ANSYS module above and then 
use the LS-DYNA executables as below.

The following code can be used in an interactive session to launch a single core ANSYS LS-DYNA process:


.. code-block:: bash

    module load apps/ansys/21.1/binary

    #Set license type and LM server 
    export LSTC_LICENSE_FILE=network
    export LSTC_LICENSE_SERVER=ansyslm.shef.ac.uk
    export LSTC_LICENSE=ANSYS

    # Add the LS-DYNA executables to the PATH
    export PATH=$ANSYSROOT/ansys/bin/linx64/:$PATH

    # Add the MPI executables and libs to the PATH / LD_LIBRARY_PATH
    # Depending on ANSYS version the MPI paths may require changing.
    export PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/bin/:$PATH
    export LD_LIBRARY_PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/lib/:$LD_LIBRARY_PATH

    # Setup my variables
    #
    # lsdyna_sp.e is for LS-DYNA single precision.
    # lsdyna_dp.e is for LS-DYNA double precision.

    lsdyna_dp.e i=i.k memory=50m ncpu=$NSLOTS

--------------------

Batch jobs
----------

ANSYS LS-DYNA is capable of running in both :ref:`MPI <parallel_MPI>` and :ref:`SMP <parallel_SMP>` 
parallel environments.

This necessitates the use of either the ``smp`` (up to 16 cores on a single node only) or ``mpi`` 
(as many cores as desired across many nodes) parallel processing environments. To use more than a 
single core, you should write a batch job script like one of the examples below.

Batch Submission Scripts
^^^^^^^^^^^^^^^^^^^^^^^^
.. hint::

    * Use of the ``#$ -V`` SGE option will instruct SGE to import your current terminal environment variables to be imported - **CAUTION** - this may not be desirable.
    * Use of the ``mpi`` parallel environment to run MPI parallel jobs for Ansys is required if using more than 16 cores on ShARC.
    * The argument ``$NSLOTS`` is a Sun of Grid Engine variable which will return the requested number of cores.

Sample MPI LS-DYNA Batch Job Script
"""""""""""""""""""""""""""""""""""""""""

.. code-block:: bash

    #!/bin/bash
    #$ -V
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 4
    #$ -N JobName

    #Only load ANSYS
    module load apps/ansys/21.1/binary

    #Set license type and LM server
    export LSTC_LICENSE_FILE=network
    export LSTC_LICENSE_SERVER=ansyslm.shef.ac.uk
    export LSTC_LICENSE=ANSYS

    # Add the LS-DYNA executables to the PATH
    export PATH=$ANSYSROOT/ansys/bin/linx64/:$PATH

    # Add the MPI executables and libs to the PATH / LD_LIBRARY_PATH
    # Depending on ANSYS version the MPI paths may require changing.
    export PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/bin/:$PATH
    export LD_LIBRARY_PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/lib/:$LD_LIBRARY_PATH

    MACHINEFILE="machinefile.$JOB_ID"

    for host in `cat $PE_HOSTFILE | awk '{print $1}'`; do
        num=`grep $host $PE_HOSTFILE | awk '{print $2}'`
    ##  for i in {1..$num}; do
        for i in `seq 1 $num`; do
        echo $host >> $MACHINEFILE
        done
    done

    echo -e " MACHINE FILE\n"
    echo $MACHINEFILE

    # Setup my variables
    #
    # lsdyna_sp_mpp.e is for LS-DYNA single precision massively parallel.
    # lsdyna_dp_mpp.e is for LS-DYNA double precision massively parallel.

    SOLVER=lsdyna_dp_mpp.e
    INPUT=i.k
    MEMORY=50m

    #Run your LS-DYNA work below:
    mpirun -hostfile $MACHINEFILE $SOLVER i=$INPUT memory=$MEMORY 




Sample SMP LS-DYNA Batch Job Script
"""""""""""""""""""""""""""""""""""""""""

.. code-block:: bash

    #!/bin/bash
    #$ -V
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 4
    #$ -N JobName

    #Only load ANSYS
    module load apps/ansys/21.1/binary

    #Set license type and LM server 
    export LSTC_LICENSE_FILE=network
    export LSTC_LICENSE_SERVER=ansyslm.shef.ac.uk
    export LSTC_LICENSE=ANSYS

    # Add the LS-DYNA executables to the PATH
    export PATH=$ANSYSROOT/ansys/bin/linx64/:$PATH

    # Add the MPI executables and libs to the PATH / LD_LIBRARY_PATH
    # Depending on ANSYS version the MPI paths may require changing.
    export PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/bin/:$PATH
    export LD_LIBRARY_PATH=$ANSYSROOT/commonfiles/MPI/Intel/2018.3.222/linx64/lib/:$LD_LIBRARY_PATH

    # Setup my variables
    #
    # lsdyna_sp.e is for LS-DYNA single precision.
    # lsdyna_dp.e is for LS-DYNA double precision.

    SOLVER=lsdyna_dp.e
    INPUT=i.k
    MEMORY=50m

    #Run your LS-DYNA work below:
    $SOLVER i=$INPUT memory=$MEMORY ncpu=$NSLOTS

Further details about how to construct batch jobs can be found on the 
:ref:`batch submission guide <submit_batch_sharc>` page

The job is submitted to the queue by typing:

.. code-block:: bash

    qsub my_job_script.sh

--------------------

Notes
-------

Due to the limited number of licenses available if issues are encountered with running 
jobs please check the logs to see if the program is indicating an insufficient number 
of available licenses. If this is the case, please resubmit your job until it runs.

For other issues or if you wish to purchase some reserved licenses please contact
Research IT.

If desired to perform post modelling analysis etc... the ANSYS Workbench GUI 
executable can be launched with the  ``runwb2`` command. 