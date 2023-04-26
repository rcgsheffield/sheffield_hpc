.. |softwarename| replace:: NetLogo
.. |currentver| replace:: 6.2.0

.. _NetLogo_stanage:

|softwarename|
==========================================================================================================


.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: Java
   :URL: http://ccl.northwestern.edu/netlogo

|softwarename|  is a multi-agent programmable modeling environment. It is used by many hundreds of thousands 
of students, teachers, and researchers worldwide. It also powers HubNet participatory simulations. It is 
authored by Uri Wilensky and developed at the CCL. You can also try it online through 
`NetLogo Web <https://www.netlogoweb.org/>`_. 

--------

Usage
--------------------

.. warning::

    At the current moment GUI usage is not possible on Stanage, meaning you will not be able to run ``netlogo-gui.sh``.

The latest version of |softwarename| (currently version |currentver|) is made available with the commands below:

.. code-block:: console

    $ # First load the Java Module
    $ module load Java/11.0.2
    $ # Now load the Netlogo
    $ module load NetLogo/6.2.0-64


After this any of the |softwarename| commands can be run from the terminal prompt. The available 
commands are below:

.. code-block:: console
    
    $ # Run the headless (no GUI command) for batch jobs with appropriate arguments substituting for $ARGS.
    $ netlogo-headless.sh $ARGS

.. note::

    NetLogo will use only a single core by default but can be parallelised using the 
    included BehaviorSpace tool for performing parameter sweeps (loading one 
    model run per core and queueing jobs for each core.)

    See: https://ccl.northwestern.edu/netlogo/docs/behaviorspace.html

**Command line options for the headless executable include:**

* \--model <path>: pathname of model to open (required)
* \--setup-file <path>: read experiment setups from this file instead of the model file
* \--experiment <name>: name of experiment to run
* \--table <path>: pathname to send table output to (or - for standard output)
* \--spreadsheet <path>: pathname to send table output to (or - for standard output)
* \--threads <number>: use this many threads to do model runs in parallel, or 1 to disable parallel runs. defaults to one thread per processor.
* \--min-pxcor <number>: override world size setting in model file
* \--max-pxcor <number>: override world size setting in model file
* \--min-pycor <number>: override world size setting in model file
* \--max-pycor <number>: override world size setting in model file

.. warning::

    NetLogo makes use of a hardcoded path for the models directory which will be incorrect by default. To 
    correct this you can make a symlink to the models directory in your current working directory with the 
    commands: ``[ ! -d "./models" ] && ln -s $EBROOTNETLOGO/app/models models``

    Without this, the models library menu item will not load correctly.

-------

Interactive usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

To use |softwarename| interactively you must use the netlogo-headless.sh start script. To do so, run the following 
commands :

.. code-block:: console

    $ module load Java/11.0.2
    $ module load NetLogo/6.2.0-64
    $ # Optional symlink if use of the models library is required.
    $ # [ ! -d "./models" ] && ln -s $EBROOTNETLOGO/app/models models
    $ netlogo-headless.sh $ARGS

--------


Batch usage
-----------------

The following ``batch_smp_4_core.sh`` example is derived from the BehaviorSpace command line instructions 
provided in the NetLogo documentation: 
http://ccl.northwestern.edu/netlogo/docs/behaviorspace.html#running-from-the-command-line

This uses the BehaviorSpace tool from NetLogo to perform a parameter 
sweep using 4 cores and 8GB of memory with the Wolf Sheep Simple 5 example model.
Use of the BehaviorSpace tool is highly recommended to ensure good parallelism in 
multicore NetLogo jobs.


**batch_smp_4_core.sh:**

.. code-block:: shell

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=8000
    #SBATCH --job-name=NetLogo_BehaviorSpace_smp_4
    #SBATCH --output=NetLogo_BehaviorSpace_smp_4
    #SBATCH --time=00:10:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load Java/11.0.2
    module load NetLogo/6.2.0-64
    [ ! -d "./models" ] && ln -s $EBROOTNETLOGO/app/models models
    netlogo-headless.sh \
    --model "./models/IABM Textbook/chapter 4/Wolf Sheep Simple 5.nlogo" \
    --experiment "Wolf Sheep Simple model analysis" \
    --table table_output.csv \
    --spreadsheet spreadsheet_output.csv \
    --threads $SLURM_NTASKS

The job is submitted to the queue by typing:

.. code-block:: console

    $ sbatch batch_smp_4_core.sh

And will generate the normal log output file in addition to ``table_output.csv`` and 
``spreadsheet_output.csv`` in the current working directory.

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 6.2.0 was installed using Easybuild 4.7.1, build details can be found in folder ``$EBROOTNETLOGO/easybuild`` with the module loaded.

