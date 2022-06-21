.. _matlab_bessemer:

MATLAB
======

.. sidebar:: MATLAB

   :Versions:  2022a, 2021b, 2021a, 2020b, 2020a, 2019a, 2018b
   :Support Level: FULL
   :Dependancies: None
   :URL: https://uk.mathworks.com/products/matlab
   :Documentation: https://uk.mathworks.com/help/matlab

Scientific computing and visualisation.


Interactive usage
-----------------
After connecting to Bessemer,  start an interactive session with the ``srun --pty bash –i`` command.

The latest version of MATLAB (currently 2022a) is made available by running:

.. code-block:: bash

   module load MATLAB/2022a

Alternatively, you can load earlier MATLAB versions by running:

.. code-block:: bash

   module load MATLAB/2018b
   module load MATLAB/2019a
   module load MATLAB/2020a
   module load MATLAB/2020b
   module load MATLAB/2021a
   module load MATLAB/2021b
   module load MATLAB/2022a

You can then run MATLAB by entering ``matlab &``.


Serial (one CPU) batch usage
----------------------------
Here, we assume that you wish to run the program ``helloworld.m`` on the system:
	
.. code-block:: matlab

   function helloworld
       disp('Hello World!')
   end	

First, you need to write a batch submission file.
We assume you'll call this ``my_job.slurm``:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --mem=16000                # Request  16 GB of real memory

   module load MATLAB/2022a

   matlab -nodesktop -nosplash -r helloworld

Ensure that ``helloworld.m`` and ``my_job.slurm`` are both in your current working directory, 
then submit your job to the batch system:

.. code-block:: bash

   sbatch my_job.slurm

Note that we are running the script ``helloworld.m`` 
but we drop the ``.m`` in the call to MATLAB. 
That is, we do ``-r helloworld`` 
rather than ``-r helloworld.m``. 
The output will be written to the job text file when the job finishes.


Parallel MATLAB
---------------

Parallel MATLAB using multiple nodes is restricted to a maximum of 40 cores. 

Here is an example using 4 cores on a single node.
Create a Slurm submission script called ``parallel_example.slurm`` containing:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --nodes=1
   #SBATCH --mem=16000
   #SBATCH --ntasks-per-node=4
   #SBATCH --time=00:05:00
   #SBATCH --job-name=matlab_par_test
   
   module load MATLAB/2022a
   
   matlab -nodisplay -nosplash -r "parallel_example($SLURM_NTASKS)"

And create a MATLAB script called ``parallel_example.m`` containing:

.. code-block:: matlab

   function exit_code = parallel_example(n_cores)
       tic
       pool = parpool(n_cores)
       
       n = 200;
       A = 500;
       max_eigenvals = zeros(n);
       parfor i = 1:n
           max_eigenvals(i) = max(abs(eig(rand(A))));
       end
       
       time=toc;
       fprintf('Wall clock duration: %d\n', time);
       
       hdf5write('out.h5', '/maxeigen', max_eigenvals);
   
       exit_code = 0;
   end


Then submit this as a batch job using: 

.. code-block:: bash

   sbatch parallel_example.slurm


The MATLAB script, ``parallel_example.m``, 
creates 200 square (500 x 500) matrices comprised of random values,
calculates the eigenvalues of each 
and records the maximum eigenvalue for each matrix in the array ``max_eigenvals``.

Installation note for Administrators:
-------------------------------------

MATLAB 2018b was installed using Easybuild in the following directory::

    /usr/local/packages/live/eb/MATLAB/2018b

The 2018b modulefile is :download:`/usr/local/modulefiles/live/eb/all/MATLAB/2018b </bessemer/software/modulefiles/MATLAB/2018b/2018b>`.

MATLAB 2019a was installed using Easybuild in the following directory::

    /usr/local/packages/live/eb/MATLAB/2019a

The 2019a modulefile is :download:`/usr/local/modulefiles/live/eb/all/MATLAB/2019a </bessemer/software/modulefiles/MATLAB/2019a/2019a>`.

MATLAB 2020a was installed using the MATLAB installer GUI in the following directory::
	
    /usr/local/packages/live/noeb/MATLAB/2020a/binary/

The 2020a modulefile is :download:`/usr/local/modulefiles/live/noeb/MATLAB/2020a/binary </bessemer/software/modulefiles/MATLAB/2020a/binary>`.

MATLAB 2020b was installed using the MATLAB installer GUI in the following directory::
	
    /usr/local/packages/live/noeb/MATLAB/2020b/binary/

The 2020b modulefile is :download:`/usr/local/modulefiles/live/noeb/MATLAB/2020b/binary </bessemer/software/modulefiles/MATLAB/2020b/binary>`.

MATLAB 2021a was installed using the MATLAB installer GUI in the following directory::
	
    /usr/local/packages/live/noeb/MATLAB/2021a/binary/

The 2021a modulefile is :download:`/usr/local/modulefiles/live/noeb/MATLAB/2021a/binary </bessemer/software/modulefiles/MATLAB/2021a/binary>`.

MATLAB 2021b was installed using the MATLAB installer GUI in the following directory::
	
    /usr/local/packages/live/noeb/MATLAB/2021b/binary/

The 2021b modulefile is :download:`/usr/local/modulefiles/live/noeb/MATLAB/2021b/binary </bessemer/software/modulefiles/MATLAB/2021b/binary>`.

MATLAB 2022a was installed using the MATLAB installer GUI in the following directory::
	
    /usr/local/packages/live/noeb/MATLAB/2022a/binary/

The 2022a modulefile is :download:`/usr/local/modulefiles/live/noeb/MATLAB/2022a/binary </bessemer/software/modulefiles/MATLAB/2022a/binary>`.

