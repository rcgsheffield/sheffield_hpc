.. _ansys-bessemer-ls-dyna:

.. include:: ../ansys/bessemer-sidebar.rst

ANSYS LS-DYNA
========================

.. contents::
    :depth: 3

----------------

Ansys LS-DYNA is the industry-leading explicit simulation software used for applications like drop 
tests, impact and penetration, smashes and crashes, occupant safety, and more.

ANSYS LS-DYNA can make use of built in :ref:`MPI <parallel_MPI>` to utilize multiple cross node 
CPU and can scale to hundreds of cores.


.. warning::

    For the academic year 2021-2022 a total of 12 MPP (multicore) licenses are available. 
    
    For any given job you will use ``X-1`` ANSYS LS-DYNA MPP licenses where ``X`` is your chosen 
    number of cores.


----------------

.. include:: ../ansys/module-load-list.rst

--------------------


Interactive jobs
----------------

While using a X11 GUI forwarding supported SSH client, an interactive session can be started on ShARC with 
the ``srun --pty bash -i`` command which supports graphical applications. You can load an ANSYS module above and then 
use the LS-DYNA executables as below. To use more than a single core, you should write a batch job script like 
one of the examples below.

The following code can be used in an interactive session to launch a single core ANSYS LS-DYNA process:


.. code-block:: bash

    module load ANSYS/21.1/binary

    #Set license type and LM server 
    export LSTC_LICENSE_FILE=network
    export LSTC_LICENSE_SERVER=ansyslm.shef.ac.uk
    export LSTC_LICENSE=ANSYS

    # Add the LS-DYNA executables to the PATH
    export PATH=$EBROOTANSYS/ansys/bin/linx64/:$PATH

    # Add the MPI executables and libs to the PATH / LD_LIBRARY_PATH
    # Depending on ANSYS version the MPI paths may require changing.
    export PATH=$EBROOTANSYS/commonfiles/MPI/Intel/2018.3.222/linx64/bin/:$PATH
    export LD_LIBRARY_PATH=$EBROOTANSYS/commonfiles/MPI/Intel/2018.3.222/linx64/lib/:$LD_LIBRARY_PATH

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

On Bessemer, cross node jobs are not permitted and there is no ``mpi`` parallel environment.
This necessitates the use of the default :ref:`SMP <parallel_SMP>` OpenMP parallel environment 
(up to 40 cores on a single node only). 

The adjusted options compared to :ref:`ANSYS LS-DYNA on ShARC<ansys-sharc-ls-dyna>` is as a result 
of execution on a single node not requiring these options.

Batch Submission Script
^^^^^^^^^^^^^^^^^^^^^^^

Sample SMP LS-DYNA Batch Job Script
"""""""""""""""""""""""""""""""""""""""""

.. code-block:: bash


    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=4000
    #SBATCH --job-name=ANSYS-LSDYNA-Example
    #SBATCH --output=ANSYS-LSDYNA-Example
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    #Only load ANSYS
    module load ANSYS/21.2/binary

    #Set license type and LM server 
    export LSTC_LICENSE_FILE=network
    export LSTC_LICENSE_SERVER=ansyslm.shef.ac.uk
    export LSTC_LICENSE=ANSYS

    # Add the LS-DYNA executables to the PATH
    export PATH=$EBROOTANSYS/ansys/bin/linx64/:$PATH

    # Add the MPI executables and libs to the PATH / LD_LIBRARY_PATH
    # Depending on ANSYS version the MPI paths may require changing.
    export PATH=$EBROOTANSYS/commonfiles/MPI/Intel/2018.3.222/linx64/bin/:$PATH
    export LD_LIBRARY_PATH=$EBROOTANSYS/commonfiles/MPI/Intel/2018.3.222/linx64/lib/:$LD_LIBRARY_PATH

    # Setup my variables
    #
    # lsdyna_sp.e is for LS-DYNA single precision.
    # lsdyna_dp.e is for LS-DYNA double precision.

    SOLVER=lsdyna_dp.e
    INPUT=i.k
    MEMORY=50m

    #Run your LS-DYNA work below:
    $SOLVER i=$INPUT memory=$MEMORY ncpu=$SLURM_NTASKS

Further details about how to construct batch jobs can be found on the 
:ref:`batch submission guide <submit-batch>` page

The job is submitted to the queue by typing:

.. code-block:: bash

    sbatch my_job_script.sh

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