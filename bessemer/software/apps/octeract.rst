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

Octeract Engine supports the :ref:`Python <python_conda_bessemer>`, C++ and Julia programming languages 
alongside several modelling languages such as AMPL, PYOMO, JuMP, GAMS and Mosel.

-----------

Usage
-----

Octeract Engine 3.1.0 can be loaded by module loading with the following command:

.. code-block:: bash

    module load octeract-engine/3.1.0/binary

-----------

Interactive jobs
----------------

After connecting to Bessemer (see :ref:`ssh`), Octeract Engine can be used interactively by starting an :ref:`interactive session <submit_interactive_bessemer>` with ``srun --pty bash -i`` 
and then issuing the commands:

.. code-block:: bash

    module load octeract-engine/3.1.0/binary
    octeract-engine /usr/local/packages/live/noeb/octeract-engine/3.1.0/binary/examples/nl/ex2_1_1.nl -d ${PWD}

-----------

Batch jobs
----------

Octeract Engine can be used in both :ref:`SMP<parallel_SMP>` (single node only) and 
:ref:`MPI<parallel_MPI>` parallel environments - on Bessemer no parallel environment needs specifiying.

.. important::

    It is important that you use the ``-d $SLURM_SUBMIT_DIR`` argument to instruct Octeract Engine 
    where to save the output file.

    Octeract Engine will spawn a SLURM sub-task and SLURM will empty the ``$TMPDIR`` directory 
    between tasks preventing any subsequent file move operation.

Example job:
^^^^^^^^^^^^

.. code-block:: bash

    !/bin/bash
    #SBATCH -J octeract-8core-test
    #SBATCH -o "%j".out
    #SBATCH --mail-user a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    #SBATCH -t 0:05:0 # Request 5 mins run time
    #SBATCH --ntasks-per-node=8
    #SBATCH --mem=8000
    ​
    module load octeract-engine/3.1.0/binary
    octeract-engine /usr/local/packages/live/noeb/octeract-engine/3.1.0/binary/examples/nl/ex2_1_1.nl -n$SLURM_NTASKS -d $SLURM_SUBMIT_DIR

-----------

Using Octeract Engine with Pyomo:
---------------------------------

Integrating the Octeract Engine with Pyomo is straightforward using our :ref:`Python <python_conda_bessemer>` module.

By :ref:`creating a specific Python environment <python_conda_bessemer_create_env>` for Octeract Engine and Pyomo you can help keep libraries and executables 
managed and available without polluting your base environment. This process, followed by running an example, is shown below:

.. hint::

    You only need to create the conda environment and install Pyomo once. To use it for subsequent jobs you need only 
    run the command: ``source activate octeract-engine-pyomo``

.. code-block:: bash

    module load octeract-engine/3.1.0/binary
    module load Anaconda3/2019.07
    conda create -n octeract-engine-pyomo python=3.7
    source activate octeract-engine-pyomo #Make sure to use source activate, NOT conda activate.
    pip install pyomo
    pyomo --version #Check this version is supported.
    python3 /usr/local/packages/live/noeb/octeract-engine/3.1.0/binary/examples/pyomo/pyomo_example.py


The above instructions have been adjusted from the following documentation provided by Octeract 
at: https://docs.octeract.com/htg1005-how_to_use_pyomo_with_octeract_engine

-----------

Installation notes
------------------

Octeract Engine 3.1.0 was a binary installation provided from the 
following link (https://download.octeract.com/octeract-engine-3.1.0-Linux-Centos7.tar.gz) and 
was installed using the script
:download:`install_octeract-engine.sh </bessemer/software/install_scripts/octeract-engine/install_octeract-engine.sh>`

The software was tested by running the example batch job supplied above.