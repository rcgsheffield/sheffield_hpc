.. _bessemer_SAMtools:

Schrodinger Maestro
===================

.. sidebar:: Schrodinger Maestro
   
   :Version: 2023.2
   :URL: https://www.schrodinger.com/
   :Documentation: https://www.schrodinger.com/sites/default/files/s3/release/current/Documentation/html/Home.htm


Maestro is a powerful, unified, multi-platform graphical user interface that can be used to build structures and to quickly and easily set up and 
submit calculations to Schrödinger's computational programs. Maestro contains monitoring and analysis features and a scripting ability that can be 
used to automate large or repetitive tasks. In addition, Maestro contains a wide range of useful display options, a comprehensive, user-extensible 
molecular builder that includes the ability to sketch structures or build them from fragments.



Usage
-----

Schrodinger Maestro can be run in two modes

- Gui mode
- Headless mode

It is highly recommended that you do your calculations in headless mode as batch job; this will allow you to ask for more resources and use the GUI mode to prototype and view the molecular structures.

Interactive usage
-----------------

To start the interactive maestro GUI you would need to also load QT:

.. code-block:: console

    $ module use /usr/local/modulefiles/staging/eb/all/
    $ module load Schrodinger/2023-2
    $ module load Qt5/5.14.1-GCCcore-9.3.0
    $ maestro

You can also run the schrodinger executables in headless mode as well. You just need to call them using the path ``{SCHRODINGER}/utilities/`` as shown below:

.. code-block:: console

    $ {SCHRODINGER}/utilities/prepwizard -h
    
Batch usage
-----------------

The following ``batch_submision.sh`` example shows a batch job that runs a protein preparation. You need to use the ``-WAIT`` parameter on the schrodinger methods to make sure that 
the parent jobs dont end before the child jobs have finished running. 


.. code-block:: console

    $ #!/bin/bash
    $ # Request 16 gigabytes of real memory (RAM) 4 cores *4G = 16
    $ #SBATCH --mem=16G
    $ # Request 32 cores
    $ #SBATCH --cpus-per-task=32
    $ # Email notifications to me@somedomain.com
    $ #SBATCH --mail-user=me@somedomain.com
    $ # Email notifications if the job fails
    $ #SBATCH --mail-type=ALL
    $ # Change the name of the output log file.
    $ #SBATCH --output=output.%j.test.out
    $ # Rename the job's name
    $ #SBATCH --job-name=my_first_job
    $ 
    $ 
    $ module use /usr/local/modulefiles/staging/eb/all/
    $ module load Schrodinger/2023-2
    $ module load Qt5/5.14.1-GCCcore-9.3.0
    $ 
    $ ${SCHRODINGER}/utilities/prepwizard 2xyl.pdb 2xylprep -WAIT



      

Installation notes
------------------

You will edit the easyconfig with the license server or the license file.

To test that the license was loaded successful you can run:

.. code-block:: console

    # tests the license
    $ $SCHRODINGER/utilities/lictest -d -l MAESTRO_MAIN
    $ 
    #check the status of a job(S)
    $ $SCHRODINGER/jobcontrol -list all
