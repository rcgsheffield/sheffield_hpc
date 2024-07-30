.. _julia_stanage:

.. |softwarename| replace:: Julia
.. |currentver| replace:: 1.9.0

|softwarename|
==============

.. sidebar:: |softwarename|

   :Versions:   |currentver|
   :URL: https://julialang.org/
   :Documentation:  https://docs.julialang.org/en/v1/

The Julia programming language is a flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages. For more information visit: https://docs.julialang.org/en/v1/  

Interactive Usage
-----------------
After connecting to Stanage,  start an interactive session with the ``srun --pty bash –i`` command.

Load a particular version of Julia with:

.. code-block:: bash

   module load Julia/1.9.0-linux-x86_64

You can then start Julia with ``julia``.

Batch Usage
-----------
Here, we assume that you wish to run the program ``example.jl`` on the system:

.. code-block:: bash

    result = 0
  
    # Prompt to enter 
    println("Enter 5 numbers line by line") 
    
    # Taking Input from user 
    for number in 1:5 
    
    num = readline() 
    num = parse(Int64, num)  
    global result+= num   
    
    end 
    
    println("The sum is :", result) 

First, you need to write a batch submission file. We assume you’ll call this ``my_job.slurm``:   

.. code-block:: bash

    #!/bin/bash
    #SBATCH --ntasks=1
    #SBATCH --time=10:00
    #SBATCH --mem=100
    
    #load the julia module
    module load Julia/1.9.0-linux-x86_64

    julia example.jl

Ensure that ``example.jl`` and ``my_job.slurm`` are both in your current working directory, then submit your job to the SLURM scheduler:

.. code-block:: bash

    sbatch my_job.slurm

Installation notes
------------------

|softwarename| version 1.9.0 was installed using Easybuild 4.8.1, build details can be found 
in ``$EBROOTJULIA/easybuild`` with the module loaded.


--------

Testing
^^^^^^^

Testing has been conducted by running an interactive session and also submitting the above slurm job.