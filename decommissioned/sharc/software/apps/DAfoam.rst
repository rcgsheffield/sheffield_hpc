.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

DAFoam
========

.. sidebar:: DAFoam

   :Version: v2.2.5
   :Dependencies: None
   :URL: https://dafoam.github.io/
   :Documentation: https://dafoam.github.io/mydoc_docs_user_guides.html


DAFoam is an Open-Source Adjoint Framework for Multidisciplinary Design Optimization which leverages the open source OpenFOAM package for multiphysics analysis.


Interactive Usage
-----------------

DAFoam v2.2.5 is provided only as an Apptainer (previously known as Singularity) image and can be used interactively by issuing starting an interactive session with ``qrshx`` and then issuing the command:   

.. code-block:: bash

    apptainer shell /usr/local/packages/singularity/images/DAFoam/DAFoam-v2.2.5-docker.simg

Then you must run the following command to setup the internal shell environment correctly: 

.. code-block:: bash

    . /home/dafoamuser/dafoam/loadDAFoam.sh

You can then use DAFoam as expected with the appropriate commands now available.

Batch Usage
------------

Sample SMP DAFoam Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""

An example SMP batch submission script is given below with the example NACA0012_Airfoil tutorial which is available from the DAFoam Github: https://github.com/DAFoam/tutorials/archive/master.tar.gz 

.. code-block:: bash

    #!/bin/bash
    #$ -l rmem=4G
    #$ -pe smp 4
    #$ -l h_rt=01:00:00
    #$ -cwd
    #$ -V

    apptainer exec --bind $PE_HOSTFILE:$PE_HOSTFILE:ro /usr/local/packages/singularity/images/DAFoam/DAFoam-v2.2.5-docker.simg /home/$USER/dafoam/tutorials-master/NACA0012_Airfoil/incompressible/DAfoam_internal_script.sh #All one line.

Where the DAfoam_internal_script.sh is as follows: 

.. code-block:: bash

    #!/bin/bash
    . /home/dafoamuser/dafoam/loadDAFoam.sh #Gap between dot and /home is important.
    cd /home/$USER/dafoam/tutorials-master/NACA0012_Airfoil/incompressible
    ./preProcessing.sh
    mpirun -np 4 python runScript.py


Sample MPI DAFoam Scheduler Job Script
"""""""""""""""""""""""""""""""""""""""""

An example MPI batch submission script is given below with the example NACA0012_Airfoil tutorial which is available from the DAFoam Github: https://github.com/DAFoam/tutorials/archive/master.tar.gz 

.. important:: 

    This example uses the hybrid MPI approach specified in the Apptainer documentation here: https://apptainer.org/docs/user/1.1/mpi.html#hybrid-model
    This requires the matching of the container and cluster MPI versions as shown here by loading the matching MPI module for the Apptainer image.

.. code-block:: bash

    #!/bin/bash
    #$ -l rmem=4G
    #$ -pe mpi 4
    #$ -l h_rt=01:00:00
    #$ -cwd
    #$ -V
    
    module load mpi/openmpi/1.10.4/gcc-6.2

    apptainer exec --bind $PE_HOSTFILE:$PE_HOSTFILE:ro /usr/local/packages/singularity/images/DAFoam/DAFoam-v2.2.5-docker.simg bash -c ". /home/dafoamuser/dafoam/loadDAFoam.sh && cd /home/$USER/dafoam/tutorials-master/NACA0012_Airfoil/incompressible/ && ./preProcessing.sh"

    mpirun -n 4 apptainer exec /usr/local/packages/singularity/images/DAFoam/DAFoam-v2.2.5-docker.simg bash -c ". /home/dafoamuser/dafoam/loadDAFoam.sh && cd /home/$USER/dafoam/tutorials-master/NACA0012_Airfoil/incompressible/ && python runScript.py"


Installation notes
------------------

Installation was tested as above with the batch scripts and NACA0012_Airfoil tutorial.

This Apptainer image has been bootstrapped from the project's provided docker container and the following configuration: ::

    Bootstrap: docker
    From: dafoam/opt-packages:v2.2.5

    %setup
          #Runs on host. The path to the image is $SINGULARITY_ROOTFS

    %files

    %post  -c /bin/bash
          #Post setup, runs inside the image

      #Default mount paths
          mkdir /scratch /data /shared /fastdata

      #Install the packages you need
         echo $SHELL
         apt-get update
         apt-get install -y git curl wget cmake nano
         chmod 755 -R /home/dafoamuser/dafoam
         sed -i 's!$HOME!/home/dafoamuser!g'  /home/dafoamuser/dafoam/loadDAFoam.sh
         sed -i 's!source!.!g'  /home/dafoamuser/dafoam/loadDAFoam.sh

