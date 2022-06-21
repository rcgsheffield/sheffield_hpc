.. _matlab_sharc:

MATLAB
======

.. sidebar:: MATLAB

   :Versions:  2013a, 2016a, 2016b, 2017a, 2017b, 2018a, 2018b, 2019a, 2019b, 2020a, 2020b, 2021a, 2021b, 2022a 
   :Support Level: FULL
   :Dependancies: None
   :URL: http://uk.mathworks.com/products/matlab
   :Documentation: http://uk.mathworks.com/help/matlab

Scientific computing and visualisation.

Interactive usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the ``qrshx`` command.

The latest version of MATLAB (currently 2022a) is made available by running:

.. code-block:: bash

   module load apps/matlab

Alternatively, you can load a specific version with one of the following commands:

.. code-block:: bash

   module load apps/matlab/2020a/binary
   module load apps/matlab/2020b/binary
   module load apps/matlab/2021a/binary
   module load apps/matlab/2021b/binary
   module load apps/matlab/2022a/binary

You can then run MATLAB by entering ``matlab``.

Serial (one CPU) batch usage
----------------------------
Here, we assume that you wish to run the program ``helloworld.m`` on the system:
	
.. code-block:: matlab

   function helloworld
       disp('Hello World!')
   end	

First, you need to write a batch submission file.
We assume you'll call this ``my_job.sge``:

.. code-block:: bash

   #!/bin/bash
   #$ -l rmem=4G                  		# Request  4 GB of real memory
   #$ -cwd                        		# Run job from current directory
   module load apps/matlab/2022a/binary  	# Make specific version of MATLAB available

   matlab -nodesktop -nosplash -r helloworld

Ensure that ``helloworld.m`` and ``my_job.sge`` are both in your current working directory, 
then submit your job to the batch system:

.. code-block:: bash

   qsub my_job.sge

Note that we are running the script ``helloworld.m`` 
but we drop the ``.m`` in the call to MATLAB. 
That is, we do ``-r helloworld`` 
rather than ``-r helloworld.m``. 
The output will be written to the job ``.o`` file when the job finishes.

MATLAB Compiler and running free-standing compiled MATLAB programs
------------------------------------------------------------------

The MATLAB compiler **mcc** can be used to generate standalone executables.
These executables can then be run on other computers that do not have MATLAB installed. 
We strongly recommend you use R2016b or later versions to take advantage of this feature. 

To compile a MATLAB function or script for example called ``myscript.m`` the following steps are required:

.. code-block:: bash

   # Load the matlab 2022a module
   module load apps/matlab/2022a/binary  

   # Compile your program to generate the executable myscript and 
   # also generate a shell script named run_myscript.sh 
   mcc -m myscript.m

   # Finally run your program
   ./run_myscript.sh $MCRROOT

If ``myscript.m`` is a MATLAB function that require inputs then 
these can be suplied on the command line. 
For example if the first line of ``myscript.m`` reads:

.. code-block:: matlab

   function out = myscript ( a , b , c )

then to run it with 1.0, 2.0, 3.0 as its parameters you will need to type:

.. code-block:: bash

   ./run_myscript.sh $MCRROOT 1.0 2.0  3.0 

After a successful compilation and running you can transfer your executable and the runscript to another computer.
That computer does not have to have MATLAB installed or licensed on it but it will have to have the MATLAB runtime system installed. 
This can be done by either downloading the MATLAB runtime environment from Mathworks web site or 
by copying the installer file from the cluster itself which resides in the ``.zip`` file: ::

   $MCRROOT/toolbox/compiler/deploy/glnxa64/MCRInstaller.zip

This file can be unzipped in a temporary area and run the setup script that unzipping yields to install the MATLAB runtime environment.
Finally the environment variable ``$MCRROOT`` can be set to the directory containing the runtime environment.  
 
Parallel MATLAB: single node
----------------------------

Parallel MATLAB can be run exclusively on a single node. 

An example batch script ``my_parallel_job.sh`` is:

.. code-block:: bash

   #!/bin/bash
   #$ -l rmem=2G
   #$ -pe smp 12
   #$ -M someuser@sheffield.ac.uk
   #$ -m bea
   #$ -j y

   module load apps/matlab/2022a/binary

   # Run parallel_example.m
   matlab -nodisplay -r parallel_example

where ``parallel_example.m`` is:

.. code-block:: matlab

   % Create parallel pool of workers on the local node.
   % Ensure that this is the same number as what you requested from the scheduler
   pool = parpool('local',12)
   disp('serial time')
   tic
   n = 200;
   A = 500;
   a = zeros(n);
   for i = 1:n
   	a(i) = max(abs(eig(rand(A))));
   end
   toc

   disp('Parallel time')
   tic
   n = 200;
   A = 500;
   a = zeros(n);
   parfor i = 1:n
   	a(i) = max(abs(eig(rand(A))));
   end
   toc

   delete(pool)

Parallel MATLAB: multiple nodes
-------------------------------

Parallel MATLAB using multiple nodes is restricted to 32 cores. 

The user must first configure MATLAB for cluster usage by starting MATLAB interactively.
This is done by logging into ShARC, 
launching a ``qrshx`` session, 
loading a version of MATLAB (e.g. using ``module load apps/matlab/2022a``) and 
launching MATLAB with ``matlab``. 
You then need to type the following at the prompt within the MATLAB GUI:

.. code-block:: matlab

   configCluster;

The MATLAB GUI can then be closed.

An example batch script ``submit_Matlab_mpi.sh`` is:

.. code-block:: bash

   #!/bin/bash
   #$ -V
   #$ -M someuser@sheffield.ac.uk
   #$ -m bea
   #$ -j y

   module load apps/matlab/2022a/binary

   # Run parallel_example.m
   matlab -nodisplay -nosplash -r submit_matlab_fnc

where ``submit_matlab_fnc.m`` is:

.. code-block:: matlab

   function submit_matlab_fnc

   cd path_working_directory;
   c = parcluster;
   c.AdditionalProperties.EmailAddress = 'someuser@sheffield.ac.uk';
   % Configure runtime e.g. 40 minutes
   c.AdditionalProperties.WallTime = '00:40:00';
   % Configure rmem per process e.g. 4 Gb
   c.AdditionalProperties.AdditionalSubmitArgs = ' -l rmem=4G';
   % Parallel_example.m contains the parfor loop, no_of_cores < 31
   j = c.batch(@parallel_example, 1, {}, 'Pool', no_of_cores);

and ``parallel_example.m`` is:

.. code-block:: matlab

   function time = parallel_example
   cd path_working_directory;
   outfile = ['output.txt'];
   fileID = fopen(outfile, 'w');
   %disp('Parallel time')
   tic
   n = 200;
   A = 500;
   a = zeros(n);
   parfor i = 1:n
       a(i) = max(abs(eig(rand(A))));
   end
   time = toc;
   fprintf(fileID, '%d', time);
   fclose(fileID);

Note that for multi-node parallel MATLAB 
the maximum number of workers allowed is 31 
since the master process requires a parallel licence. 
Task arrays are supported by all versions, 
however it is recommended that 2017a (or later) is used. 

MATLAB Engine for Python
------------------------

This is a MathWorks-developed way of running MATLAB from Python.
On ShARC the recommended way of installing this is into a :ref:`conda environment <sharc-python-conda>`.
Here's how you can install the R2017b version into a new conda environment called ``my-environment-name``:

.. code-block:: bash

   module load apps/python/conda
   conda create -n my-environment-name python=2.7
   source activate my-environment-name 

   pushd /usr/local/packages/apps/matlab/2017b/binary/extern/engines/python
   python setup.py build -b $TMPDIR install
   popd

`More information <https://uk.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html>`__ on the MATLAB Engine for Python,
including basic usage.

Training
--------

* IT Services run an `Introduction to Matlab course <http://rcg.group.shef.ac.uk/courses/matlab/>`_
* In November 2015, IT Services hosted a masterclass in *Parallel Computing in MATLAB*. The materials `are available online <http://rcg.group.shef.ac.uk/courses/mathworks-parallelmatlab/>`_


Installation notes
------------------

These notes are primarily for system administrators.

Installation and configuration is a five-stage process:

* Set up the floating license server (the license server for earlier MATLAB versions can be used), ensuring that it can serve licenses for any new versions of MATLAB that you want to install
* Run a graphical installer to download MATLAB *archive* files used by the main (automated) installation process
* Run the same installer in 'silent' command-line mode to perform the installation using those archive files and a text config file.
* Install a relevant modulefile
* Configure MATLAB parallel (multi-node)

In more detail:

#. If necessary, update the floating license keys on ``matlablm.shef.ac.uk`` to ensure that the licenses are served for the versions to install.
#. Log on to Mathworks site to download the MATLAB installer package for 64-bit Linux ( for R2022a this was called ``matlab_R2022a_glnxa64.zip`` )
#. ``unzip`` the installer package in a directory with ~15GB of space (needed as many MATLAB *archive* files will subsequently be downloaded here).  Using a directory on an NFS mount (e.g. ``/data/${USER}/MathWorks/R2022a``) allows the same downloaded archives to be used to install MATLAB on multiple clusters.
#. ``./install`` to start the graphical installer (needed to download the MATLAB archive files).
#. Select install choice of *Log in to Mathworks Account* and log in with a *License Administrator* account (not a *Licensed End User* (personal) account).
#. Select *Download only*.
#. Select the offered default *Download path* and select the directory you ran ``./install`` from.  Wait a while for all requested archive files to be downloaded.
#. Next, ensure ``installer_input.txt`` looks like the following ::
    
    fileInstallationKey=XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
    agreeToLicense=yes
    outputFile=matlab_2022a_install.log
    mode=silent
    licensePath=/usr/local/packages/matlab/network.lic
    lmgrFiles=false
    lmgrService=false

#. Create the installation directory e.g.: ::

    mkdir -m 2755 -p /usr/local/packages/apps/matlab/R2022a/binary
    chown ${USER}:app-admins /usr/local/packages/apps/matlab/R2022a/binary

#. Run the installer using our customized ``installer_input.txt`` like so: ``./install -mode silent -inputFile ${PWD}/installer_input.txt`` ; installation should finish with exit status ``0`` if all has worked.
#. Ensure the contents of the install directory and the modulefile are writable by those in ``app-admins`` group e.g.: ::

    chmod -R g+w ${USER}:app-admins /usr/local/packages/apps/matlab/R2022a /usr/local/modulefiles/apps/matlab/2022a

#. The modulefile is :download:`/usr/local/modulefiles/apps/matlab/2022a/binary </sharc/software/modulefiles/apps/matlab/2022a/binary>`.

#. Copy integration scripts to MATLAB local directory (required for MATLAB parallel (multi-node)): ::

    cd /usr/local/packages/apps/matlab/2022a/binary/toolbox/local
    cp -r /usr/local/packages/apps/matlab/parallel_mpi_integration_scripts_2022a/* .
    NOTE: for all other Matlab versions
    cp -r /usr/local/packages/apps/matlab/parallel_mpi_integration_scripts/* .

#. R2018a Update 4 to mitigate Matlab crashes on Centos 7.5. Download R2018a Update 4 installer. Copy to ShARC, and run using ./R2018a_Update_4_glnxa64.sh, and specify install directory /usr/local/packages/matlab/2018a/binary
