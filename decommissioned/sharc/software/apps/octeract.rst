.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Octeract Engine
===============


.. sidebar:: Octeract Engine

   :Version: 3.1.0
   :Dependencies: 
   :URL: https://octeract.co.uk/octeract-engine/
   :Documentation: https://docs.octeract.com/

Octeract Engine is a massively parallel MINLP solver. It is written in ORL (Octeract Reformulation Language).

The engine contains 14 Octeract solvers for different types of mathematical structure, 
each with their own algorithms, to a grand total of 1031 high-performance algorithms.

Octeract Engine supports the :ref:`Python <sharc-python-conda>`, C++ and Julia programming languages 
alongside several modelling languages such as AMPL, PYOMO, JuMP, GAMS and Mosel.

-----------

Usage
-----

Octeract Engine 3.1.0 can be loaded by module loading with the following command:

.. code-block:: bash

    module load apps/octeract-engine/3.1.0/binary

-----------

Interactive jobs
----------------

After connecting to ShARC (see :ref:`ssh`), Octeract Engine can be used interactively by starting an :ref:`interactive session <submit_interactive_sharc>` with ``qrshx`` 
and then issuing the commands:

.. code-block:: bash

    module load apps/octeract-engine/3.1.0/binary
    octeract-engine /usr/local/packages/apps/octeract-engine/3.1.0/binary/examples/nl/ex2_1_1.nl -d ${PWD}

----------

Batch jobs
----------

Octeract Engine can be used in both :ref:`SMP<parallel_SMP>` (single node only) and 
:ref:`MPI<parallel_MPI>` parallel environments.

Example SMP job:
^^^^^^^^^^^^^^^^

.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=02:00:00
    #$ -l rmem=2G
    #$ -pe smp 8
    #$ -N octeract-test-8core-smp
    #$ -j yes
    ​
    module load apps/octeract-engine/3.1.0/binary 
    octeract-engine /usr/local/packages/apps/octeract-engine/3.1.0/binary/examples/nl/ex2_1_1.nl -n8 -d $SGE_O_WORKDIR

Example MPI job:
^^^^^^^^^^^^^^^^

.. code-block:: bash

    #!/bin/bash
    #$ -cwd
    #$ -M a.person@sheffield.ac.uk
    #$ -m abe
    #$ -l h_rt=02:00:00
    #$ -l rmem=2G
    #$ -pe mpi 8
    #$ -N octeract-test-8core-mpi
    #$ -j yes
    ​
    module load apps/octeract-engine/3.1.0/binary 
    octeract-engine /usr/local/packages/apps/octeract-engine/3.1.0/binary/examples/nl/ex2_1_1.nl -n8 -d $SGE_O_WORKDIR

-----------

Using Octeract Engine with Pyomo:
---------------------------------

Integrating the Octeract Engine with Pyomo is straightforward using our :ref:`Python <sharc-python-conda>` module.

By :ref:`creating a specific Python environment <sharc_conda_create_env>` for Octeract Engine and Pyomo you can help keep libraries and executables 
managed and available without polluting your base environment. This process, followed by running an example, is shown below:

.. hint::

    You only need to create the conda environment and install Pyomo once. To use it for subsequent jobs you need only 
    run the command: ``source activate octeract-engine-pyomo``

.. code-block:: bash

    module load apps/octeract-engine/3.1.0/binary
    module load apps/python/anaconda3-4.2.0
    conda create -n octeract-engine-pyomo python=3.7
    source activate octeract-engine-pyomo  #Make sure to use source activate, NOT conda activate.
    pip install pyomo
    pyomo --version #Check this version is supported.
    python3 /usr/local/packages/apps/octeract-engine/3.1.0/binary/examples/pyomo/pyomo_example.py

The above instructions have been adjusted from the following documentation provided by Octeract 
at: https://docs.octeract.com/htg1005-how_to_use_pyomo_with_octeract_engine

-----------

Installation notes
------------------

Octeract Engine 3.1.0 was a binary installation provided from the 
following link (https://download.octeract.com/octeract-engine-3.1.0-Linux-Centos7.tar.gz) and 
was installed using the script
:download:`install_octeract-engine.sh </decommissioned/sharc/software/install_scripts/apps/octeract-engine/install_octeract-engine.sh>`

The software was tested by running the example batch job supplied above.
