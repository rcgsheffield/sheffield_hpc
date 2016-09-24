.. _parallel_jobarray:

SGE Job Arrays
==============

The simplest way of exploiting parallelism on the clusters is to use **Job Arrays**. A Job Array is a set of batch jobs run from a single job script. For example ::

  #!/bin/bash
  #
  #$ -t 1-100
  #
  echo "Task id is $SGE_TASK_ID"

  ./myprog.exe $SGE_TASK_ID > output.$SGE_TASK_ID

The above script will submit 100 tasks to the system at once.
The difference between each of these 100 jobs is the value of the environment variable `$SGE_TASK_ID` which will range from 1 to 100, determined by the line `#$ -t 1-100`.
In this example, the program `myprog.exe` will be run 100 times with differing input values of `$SGE_TASK_ID`. 100 output files will be created with filenames `output.1`, `output.2` and so on.

Job arrays are particularly useful for `Embarrassingly Parallel <https://en.wikipedia.org/wiki/Embarrassingly_parallel>`_ problems such as Monte Carlo Simulations (Where `$SGE_TASK_ID` might correspond to random number seed), or batch file processing (where `$SGE_TASK_ID` might refer to a file in a list of files to be processed).

Examples
--------
* `MATLAB SGE Job Array example <https://github.com/mikecroucher/HPC_Examples/tree/master/languages/MATLAB/SGE_array>`_
