OpenFOAM
==========

.. sidebar:: OpenFOAM

   :Versions: 8.0, v2012, v2206
   :URL: https://openfoam.org/ or https://www.openfoam.com/
   :Documentation: https://cfd.direct/openfoam/user-guide or https://www.openfoam.com/documentation/overview
   :Dependencies: NCurses, METIS, SCOTCH, CGAL and Paraview. Easybuild foss toolchain see :ref:`stanage_eb_toolchains`.  

OpenFOAM is leading software for computational fluid dynamics (CFD). It is licensed free and open source only under the GNU General Public Licence (GPL) by the OpenFOAM Foundation. Different versions of OpenFOAM supplied from different projects exist so choose your module carefully.

Usage
-----

There are two OpenFOAM modules, choose one and load it with either:

.. code-block:: bash

    module load OpenFOAM/v2206-foss-2022a
    module load OpenFOAM/8-foss-2020b
    module load OpenFOAM/v2012-foss-2020a


OpenFOAM can be used in an interactive or batch job. OpenFOAM modules can be activated using the module file and sourcing the OpenFOAM environment script e.g.

.. code-block:: bash

    module load OpenFOAM/v2206-foss-2022a
    source $FOAM_BASH


.. hint::

    Users should investigate OpenFOAM documentation to determine which OpenFOAM executables are parallel compatible and 
    which are serial only. Only the ``simpleFoam`` executable shown below is parallel compatible and is executed with ``srun``
    in multiple core jobs.

------------

Interactive Usage
--------------------

The following is an example single core interactive session running the pitzDaily example model.

After connecting to Stanage (see section Connecting with SSH), you can start an interactive graphical session.

.. code-block:: bash

    module load OpenFOAM/v2206-foss-2022a
    source $FOAM_BASH
    rm -r /users/$USER/tests/openfoam/run/
    mkdir -p /users/$USER/tests/openfoam/run
    cd /users/$USER/tests/openfoam/run
    cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
    chmod 700 -R pitzDaily && cd pitzDaily
    blockMesh
    simpleFoam
    paraFoam #To view the output.

------------

Batch Usage
--------------------

The following is an example batch job running the pitzDaily example model on 4 nodes with 1 task per node:

.. important::

    You will need to supply a `decomposeParDict <https://cfd.direct/openfoam/user-guide/v8-running-applications-parallel/>`_ in the system subdirectory of the case - check the installation script for an example using the EOF method to add it :

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=4
    #SBATCH --ntasks-per-node=1
    #SBATCH --mem=16000
    #SBATCH --job-name=name_OpenFOAM_V2206_mpi_4
    #SBATCH --output=output_OpenFOAM_V2206_mpi_4
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=some.user@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    mkdir -p /users/$USER/tests/openfoam/run
    cd /users/$USER/tests/openfoam/run

    module load OpenFOAM/v2206-foss-2022a
    source $FOAM_BASH

    cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
    chmod 700 -R pitzDaily && cd pitzDaily
    cp /users/$USER/openfoam/my_custom_decomposeParDict_4 system/decomposeParDict  # You must supply you own copy or see the example below.

    blockMesh
    decomposePar

    srun --export=ALL simpleFoam -parallel

------------

Example decomposeParDict:
-------------------------

In the batch script example above my_custom_decomposeParDict_4 (for 4 cores) is located in /users/$USER/openfoam/ and contains the following:

.. code-block:: bash

    FoamFile
    {
        version         2.0;
        format          ascii;

        root            "";
        case            "";
        instance        "";
        local           "";
    
        class           dictionary;
        object          decomposeParDict;
    }

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //


    numberOfSubdomains 4;

    method          simple;

    simpleCoeffs
    {
        n               (1 4 1);
        delta           0.001;
    }

    hierarchicalCoeffs
    {
        n               (1 1 1);
        delta           0.001;
        order           xyz;
    }

    metisCoeffs
    {
        processorWeights
        (
            1
            1
            1
        );
    }

    manualCoeffs
    {
        dataFile        "";
    }
    
    distributed     no;

    roots
    (
    );


    // ************************************************************************* //

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. OpenFOAM has been installed using the default Easybuild config files.
Build logs and test reports can be found in ``$EBDEVELOPENFOAM`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^

Testing has been conducted with the above examples.