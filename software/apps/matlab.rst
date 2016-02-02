.. index::
    single: MATLAB

MATLAB
======

.. sidebar:: MATLAB

   :Versions:  2013a , 2013b , 2014a, 2015a
   :Support Level: FULL
   :Dependancies: None
   :URL: http://uk.mathworks.com/products/matlab
   :Local URL:  http://www.shef.ac.uk/wrgrid/software/matlab
   :Documentation: http://uk.mathworks.com/help/matlab

Scientific Computing and Visualisation

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

The latest version of MATLAB (currently 2015a) is made available with the command

.. code-block:: none

        module load apps/matlab

Alternatively, you can load a specific version with one of of the following commands

.. code-block:: none

       module load apps/matlab/2013a
       module load apps/matlab/2013b
       module load apps/matlab/2014a
       module load apps/matlab/2015a

You can then run MATLAB by entering :code:`matlab`

Serial (one CPU) Batch usage
----------------------------
Here, we assume that you wish to run the program :code:`hello.m` on the system.

First, you need to write a batch submission file. We assume you'll call this :code:`my_job.sge` ::

    #!/bin/bash
    #$ -l rmem=4G                      # Request  4 Gigabytes of real memory
    #$ -l mem=16G                      # Request 16 Gigabytes of virtual memory
    $ -cwd                             # Run job from current directory
    module load apps/matlab            # Make latest version of MATLAB available

    matlab -nodesktop -r 'hello'

Ensuring that :code:`hello.m` and :code:`myjob.sge` are both in your current working directory, submit your job to the batch system ::

    qsub my_job.sge

Some notes about this example:

* We are running the script :code:`hello.m` but we drop the `.m` in the call to MATLAB. That is, we do :code:`-r 'hello'` rather than :code:`-r hello.m`.
* All of the :code:`module` commands introduced in the Interactive usage section will also work in batch mode. This allows you to select a specific version of MATLAB if you wish.

Parallel MATLAB on iceberg
--------------------------

Currently we recommend the 2015a version of MATLAB for parallel work.

The default cluster configuration named 'local' provides parallel working environment by using the CPUs of the worker-node that is running the current MATLAB session.
Each iceberg worker-node can run multiple users' jobs simultaneously. Therefore depending on
who else is using that node at the time, parallel MATLAB jobs can create contentions between
jobs and slow them considerably. It is therefore advisable to start parallel MATLAB jobs that will
use the 'local' profile from a parallel SGE job.
For example, to use the local profile with 5 workers, do the following;

Start a parallel OPENMP job with 6 workers ::

    Qsh -pe openmp 6

Run MATLAB in that session and select 5 workers ::

    MATLAB
    parpool ('local' , 5 )

The above example will use 5 MATLAB workers on a single iceberg-node to run a parallel task.

To take advantage of the multiple iceberg-nodes, you will need to make use of a parallel
cluster profile named 'sge'.
This can be done by issuing a locally provided MATLAB command named :code:`iceberg` that imports the
parallel cluster profile named :code:`sge` that can take advantage of the SGE scheduler to run
larger parallel jobs.

When using the 'sge' profile, MATLAB will be able to submit multiple MATLAB jobs the the SGE
scheduler from within MATLAB itself.  However, each job will have the default resource requirements
unless the following trick is deployed.
For example, during your MATLAB session type:

.. code-block:: none

    global sge_params
    sge_params='-l mem=16G -l h_rt=36:00:00'

to make sure that all the MATLAB batch jobs will use up to 16GBytes of memory and will not be killed
unless they exceed 36 hours of run time.

Training
--------
* Here is a link to CICS' Introduction to MATLAB course - `http://rcg.group.shef.ac.uk/courses/matlab/ <http://rcg.group.shef.ac.uk/courses/matlab/>`_
* In November 2015, CiCS hosted a Parallel Computing in MATLAB Masterclass. The materials are available at `http://rcg.group.shef.ac.uk/courses/mathworks-parallelmatlab/ <http://rcg.group.shef.ac.uk/courses/mathworks-parallelmatlab/>`_

Installation notes
------------------
These notes are primarily for system administrators.

Requires the floating license server licserv4.shef.ac.uk to serve the licenses
for the version of MATLAB to be installed ( or higher versions ) .
An install script and associated files are downloadable from Mathworks site along with all the required toolbox specific installation files.
