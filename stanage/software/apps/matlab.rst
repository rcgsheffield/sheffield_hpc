.. |softwarename| replace:: MATLAB
.. |currentver| replace:: 2023b

.. _matlab_stanage:

|softwarename|
==========================================================================================================

.. sidebar:: MATLAB

   :Versions:  |currentver|
   :Dependencies: None
   :URL: https://uk.mathworks.com/products/matlab
   :Documentation: https://uk.mathworks.com/help/matlab

Scientific computing and visualisation.


Interactive usage
-----------------
After connecting to Stanage,  start an interactive session with the ``srun --pty bash –i`` command.

The latest version of MATLAB (currently 2022a) is made available by running:

.. code-block:: bash

   module load MATLAB/2023b
   module load MATLAB/2022a

You can then run MATLAB by entering ``matlab``. This provides a matlab terminal (Please note that graphical sessions are not yet available on Stanage, so the matlab GUI will not load).


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
   #SBATCH --mem=8G                # Request  8 GB of real memory
   
   # Load the MATLAB module 
   module load MATLAB/2022a

   matlab -nodesktop -nosplash -r "helloworld"

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

Parallel MATLAB using multiple nodes is restricted to a maximum of 64 cores. 

Here is an example using 4 cores on a single node.
Create a Slurm submission script called ``parallel_example.slurm`` containing:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --nodes=1
   #SBATCH --mem=16G
   #SBATCH --ntasks-per-node=4
   #SBATCH --time=00:05:00
   #SBATCH --job-name=matlab_par_test
   
   module load MATLAB/2022a
   
   matlab -nodisplay -nosplash -r "parallel_example($SLURM_NTASKS)"

   sleep 10

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

Installation method
^^^^^^^^^^^^^^^^^^^

MATLAB was installed using Easybuild 4.7.0, build details can be found in folder $EBROOTMATLAB/easybuild with the module loaded.


