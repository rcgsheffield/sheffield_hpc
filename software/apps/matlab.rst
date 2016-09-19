.. matlab:

MATLAB
======

.. sidebar:: MATLAB

   :Versions:  2013a , 2013b , 2014a, 2015a, 2016a
   :Support Level: FULL
   :Dependancies: None
   :URL: http://uk.mathworks.com/products/matlab
   :Local URL:  http://www.shef.ac.uk/wrgrid/software/matlab
   :Documentation: http://uk.mathworks.com/help/matlab

Scientific Computing and Visualisation

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

The latest version of MATLAB (currently 2016a) is made available with the command

.. code-block:: none

        module load apps/matlab

Alternatively, you can load a specific version with one of of the following commands

.. code-block:: none

       module load apps/matlab/2013a
       module load apps/matlab/2013b
       module load apps/matlab/2014a
       module load apps/matlab/2015a
       module load apps/matlab/2016a

You can then run MATLAB by entering :code:`matlab`

Serial (one CPU) Batch usage
----------------------------
Here, we assume that you wish to run the program ``hello.m`` on the system.

First, you need to write a batch submission file. We assume you'll call this ``my_job.sge``.

.. code-block:: none

    #!/bin/bash
    #$ -l rmem=4G                      # Request  4 Gigabytes of real memory
    #$ -l mem=16G                      # Request 16 Gigabytes of virtual memory
    $ -cwd                             # Run job from current directory
    module load apps/matlab            # Make latest version of MATLAB available

    matlab -nodesktop -r 'hello'

Ensuring that :code:`hello.m` and :code:`myjob.sge` are both in your current working directory, submit your job to the batch system.

.. code-block:: none

    qsub my_job.sge

Some notes about this example:

* We are running the script :code:`hello.m` but we drop the :code:`.m` in the call to MATLAB. That is, we do :code:`-r 'hello'` rather than :code:`-r hello.m`.
* All of the :code:`module` commands introduced in the Interactive usage section will also work in batch mode. This allows you to select a specific version of MATLAB if you wish.


Easy Way of Running MATLAB Jobs on the Batch Queue
--------------------------------------------------

Firstly prepare a MATLAB script that contains all the commands for running a MATLAB task.  
Let us assume that this script is called :code:`mymatlabwork.m`.
Next select the version of MATLAB you wish to use by using the :code:`module load` command, for example;

.. code-block:: none

    module load apps/matlab/2016a 

Now submit a job that runs this MATLAB script as a batch job.  

.. code-block:: none

    runmatlab mymatlabwork.m
    
That is all to it! 

The ``runmatlab`` command can take a number of parameters to refine the control of your MATLAB batch job, such as the maximum time and memory needs. 
To get a full listing of these parameters simply type :code:`runmatlab` on iceberg command line. 
 

MATLAB Compiler and running free-standing compiled MATLAB programs
------------------------------------------------------------------

The MATLAB compiler **mcc** is installed on iceberg that can be used to generate free standing executables.
Such executables can then be run on other computers that does not have MATLAB installed. 
We strongly recommend you use R2016a or later versions to take advantage of this feature. 

To compile a MATLAB function or script for example called myscript.m  the following steps are required.

.. code-block:: none

    module load apps/matlab/2016a  #  Load the matlab 2016a module
    mcc -m myscript.m              #  Compile your program to generate the executable myscript and 
                                   #  also generate a shell script named run_myscript.sh 
    ./run_myscript.sh $MCRROOT     #  Finally run your program

If myscript.m is a MATLAB function that require inputs these can be suplied on the command line. 
For example if the first line of :code:`myscript.m` reads:

.. code-block:: none

    function out = myscript ( a , b , c )

then to run it with 1.0, 2.0, 3.0 as its parameters you will need to type:  

.. code-block:: none

    ./run_myscript.sh $MCRROOT 1.0 2.0  3.0 

After a successful compilation and running you can transfer your executable and the runscript to another computer.
That computer does not have to have MATLAB installed or licensed on it but it will have to have the MATLAB runtime system installed. 
This can be done by either downloading the MATLAB runtime environment from Mathworks web site or 
by copying the installer file from iceberg itself which resides in:

.. code-block:: none

    /usr/local/packages6/matlab/R2016a/toolbox/compiler/deploy/glnxa64/MCRInstaller.zip

This file can be unzipped in a temporary area and run the setup script that unzipping yields to install the MATLAB runtime environment.
Finally the environment variable :code:`$MCRROOT` can be set to the directory containing the runtime environment.  
 

Parallel MATLAB on iceberg
--------------------------

Currently we recommend the 2015a version of MATLAB for parallel work.

The default cluster configuration named **local** provides parallel working environment by 
using the CPUs of the worker-node that is running the current MATLAB session.
Each iceberg worker-node can run multiple users' jobs simultaneously. 
Therefore depending on who else is using that node at the time, 
parallel MATLAB jobs can create contentions between jobs and slow them considerably. 
It is therefore advisable to start parallel MATLAB jobs that will use the **local** profile from a parallel SGE job.
For example, to use the local profile with 5 workers, do the following;

Start a parallel OpenMP job with 6 workers:

.. code-block:: bash

    qsh -pe openmp 6

Run MATLAB in that session and select 5 workers:

.. code-block:: none

    matlab
    parpool ('local' , 5 )

The above example will use 5 MATLAB workers on a single iceberg-node to run a parallel task.

To take advantage of the multiple iceberg nodes, you will need to make use of a parallel cluster profile named :code:`sge`.
This can be done by issuing a locally provided MATLAB command named :code:`iceberg` that imports the
parallel cluster profile named :code:`sge` that can take advantage of the SGE scheduler to run
larger parallel jobs.

When using the :code:`sge` profile, 
MATLAB will be able to submit multiple MATLAB jobs the the SGE scheduler from within MATLAB itself.  
However, each job will have the default resource requirements unless the following trick is deployed.
For example, during your MATLAB session type:

.. code-block:: none

    global sge_params
    sge_params='-l mem=16G -l h_rt=36:00:00'

to make sure that all the MATLAB batch jobs will use up to 16GBytes of memory and will not be killed
unless they exceed 36 hours of run time.


Training
--------

* CiCS run an `Introduction to Matlab course <http://rcg.group.shef.ac.uk/courses/matlab/>`_
* In November 2015, CiCS hosted a Parallel Computing in MATLAB Masterclass. The materials are available at `http://rcg.group.shef.ac.uk/courses/mathworks-parallelmatlab/ <http://rcg.group.shef.ac.uk/courses/mathworks-parallelmatlab/>`_


Installation notes
------------------

These notes are primarily for system administrators.

Requires the floating license server ``licserv4.shef.ac.uk`` to serve the licenses.
An install script named ``installer_input.txt`` and associated files are 
downloadable from Mathworks site along with all the required toolbox specific installation files. 

The following steps are performed to install MATLAB on iceberg.

#. If necessary, update the floating license keys on ``licserv4.shef.ac.uk`` to ensure that the licenses are served for the versions to install.
#. Log onto Mathworks site to download the MATLAB installer package for 64-bit Linux ( for R2016a this was called ``matlab_R2016a_glnxa64.zip`` )
#. Unzip the installer package in a temporary directory: :code:`unzip matlab_R2016a_glnxa64.zip` ( This will create a few items including files named ``install`` and ``installer_input.txt``)
#. Run the installer: :code:`./install` 
#. Select install choice of *Log in to Mathworks Account*
#. Select *Download only*.
#. Select the offered default *download path* ( this will be in your home area :code:`$HOME/Downloads/MathWorks/...` ) Note: This is the default download location that is later used by the silent installer.  Another option is to move all downloaded files to the same directory where install script resides. 

#. Finally run the installer using our customized ``installer_input.txt`` script as input.( :code:`./install -inputFile installer_input.txt`  )

Installation should finish with exit status :code:`0` if all has worked.

Note: A template installer_input file for 2016a is available at ``/usr/local/packages6/matlab`` directory named 
``2016a_installer_input.txt``. This will need minor edits to install the next versions in the same way. 
