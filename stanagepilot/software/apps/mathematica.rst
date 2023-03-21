Mathematica
============

.. sidebar:: Wolfram Mathematica

   :Dependancies: None
   :URL: http://www.wolfram.com/mathematica/
   :Latest version: 13.2.1

Mathematica is a technical computing environment and programming language with strong symbolic and numerical abilities.

Batch Submission
----------------
Unfortunately, it is not possible to run Mathematica notebook .nb files directly in batch.  Instead, you need to create a simple text file that contains all of the Mathematica commands you want to execute.  Typically, such files are given the extension .m.  Let’s run the following simple Mathematica script as a batch job. ::

  (*Find out what version of Mathematica this machine is running*)
  Print["Mathematica version is " <> $Version]

  (*Find out the name of the machine we are running on*)
  Print["The machine name is " <> $MachineName]

  (*Do a calculation*)
  Print["The result of the integral is "]
  Print [ Integrate[Sin[x]^2, x]]

Copy and paste the above into a text file called ``very_simple_mathematica.m``

An example batch submission script for this file is ::

  #!/bin/bash
  # Request 4 gigabytes of real memory
  #SBATCH --mem=4G
  #SBATCH --mail-user=a.person@sheffield.ac.uk
  #SBATCH --mail-type=ALL
  
  module load Mathematica/13.2.1

  math -script very_simple_mathematica.m

Copy and paste the above into a file called ``run_job.sh`` and submit with ::

  sbatch run_job.sh

Once the job has successfully completed, the output will be in a file named like ``slurm-4835.out``. The number at the end refers to the job-ID given to this job by the system and will be different for you. The contents of this file is ::

  more slurm-4835.out
  
  Mathematica version is 13.2.1 for Linux x86 (64-bit) (January 27, 2023)
  The machine name is node301
  The result of the integral is
  x/2 - Sin[2*x]/4
  

Installation notes
------------------
These are primarily for administrators of the system. 

Set the the University network Mathematica license in ``/opt/apps/testapps/common/easybuild/hooks/default.py``.

Download the Mathematica package, Mathematica_13.2.1_LINUX.sh, from Wolfram.

::

    mkdir -p /opt/apps/testapps/media/eb-srcs/m/Mathematica/
    mv Mathematica_13.2.1_LINUX.sh /opt/apps/testapps/media/eb-srcs/m/Mathematica/
    
Mathematica was installed using Easybuild 4.7.0, build details can be found in ``$EBDEVELMATHEMATICA``

Testing was performed using the above examples.