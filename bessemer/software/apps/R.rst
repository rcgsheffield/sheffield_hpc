.. _bessemer_r:

R
=

.. sidebar:: R
   
   :Versions: 3.6.2,4.0.0
   :URL: https://www.r-project.org/
   :Documentation: https://www.r-project.org/

R is a language and environment for statistical computing and graphics. 
It is a GNU project which is similar to the S language and environment which was developed at Bell Laboratories (formerly AT&T, now Lucent Technologies) by John Chambers and colleagues. 
R can be considered as a different implementation of S. There are some important differences, but much code written for S runs unaltered under R.

Interactive Usage
-----------------

After connecting to Bessemer (see :ref:`ssh`),
start an :ref:`interactive session <submit_interactive_bessemer>`.
You can then load a specific version of R using: ::
        
   module load R/3.6.2-foss-2019b
   module load R/4.0.0-foss-2020a

R can then be run with: ::

   $ R

Serial (one CPU) Batch usage
----------------------------
Here, we assume that you wish to run the program ``my_code.r`` on the system. 
With batch usage it is recommended to load a specific version of R, 
for example ``module load R/3.6.2-foss-2019b``, 
to ensure the expected output is achieved.

First, you need to write a batch submission file. 
We assume you'll call this ``my_job.slurm``:

.. code-block:: bash

   #!/bin/bash
   #SBATCH --mem=4G              # Request 4GB of memory
   #SBATCH --mail-user=username@sheffield.ac.uk  # Replace with your email address

   module load R/3.6.2-foss-2019b  # Recommended to load a specific version of R

   R CMD BATCH my_code.r my_code.r.o$JOB_ID

Note that R must be called with both the ``CMD`` and ``BATCH`` options 
which tell it to run an R program, 
in this case ``my_code.r``. 
If you do not do this, R will attempt to open an interactive prompt.

The final argument, ``my_code.r.o$JOBID``, tells R to send output to a file with this name. 
Since ``$JOBID`` will always be unique, this ensures that all of your output files are unique. 
Without this argument R sends all output to a file called ``my_code.Rout``.

Ensuring that ``my_code.r`` and ``my_job.slurm`` are both in your current working directory, 
submit your job to the batch system ::

   sbatch my_job.slurm

Replace ``my_job.slurm`` with the name of your submission script.

.. warning::
   By default, R will save variables in the workspace in the current directory 
   (in a file called ``.RData``) 
   when a script exits and reload them when it starts from the same directory. 
   To disable this, add the ``--no-save`` and ``--no-restore`` options to your command 
   e.g. ``R CMD BATCH --no-save --no-restore my_code.r my_code.r.o$JOB_ID``.

Graphical output
----------------
By default, graphical output from batch jobs is sent to a file called ``Rplots.pdf``.

Installing additional packages
------------------------------

As you will not have permissions to install packages to the default folder, 
additional R packages can be installed to your home folder ``~/``. 
To create the appropriate folder, 
install your first package in R in interactive mode. 
Load an interactive R session as described above, and install a package with: ::

   install.packages()

You will be prompted to create a personal package library. 
Choose 'yes'. 
The package will download and install from a CRAN mirror 
(you may be asked to select a nearby mirror, 
which you can do simply by entering the number of your preferred mirror).

Once the chosen package has been installed, 
additional packages can be installed either in the same way, 
or by creating a ``.R`` script. 
An example script might look like: ::

   install.packages("dplyr")
   install.packages("devtools")

Call this using ``source()``. 
For example if your script is called ``packages.R`` and is stored in your home folder, 
source this from an interactive R session with: ::

   source("~/packages.R")

These additional packages will be installed without prompting to your personal package library.

To check your packages are up to date, and update them if necessary, 
run the following line from an R interactive session ::

   update.packages(lib.loc = "~/R/x86_64-unknown-linux-gnu-library/3.6/")

The folder name after ``~/R/`` will likely change, 
but this can be completed with tab autocompletion from the R session. 
Ensure ``lib.loc`` folder is specified, or R will attempt to update the wrong library.

.. warning::
    Notice that the personal package library path includes the version of R:
    if after installing some packages you switch to using a different `major or minor version <http://semver.org/>`_ of R
    then you will need then to install those package *for this new version*.

R Packages that require external libraries
------------------------------------------
Some R packages require external libraries to be installed before you can install and use them
(e.g. ``rgdal``, ``rgeos``, ``hdf5r``).

Since there are so many, we only install those libraries that have been explicitly requested by users of the system.
The associated R packages are not included in the central installation of R.

To load external libraries you should  :ref:`search for a module <search_env_modules>` which matches the 
build chain of the R version you are using to avoid load conflicts e.g. for R 4.0.0, foss-2020a.

To request the installation of dependencies for R packages that depend on non-R libraries
please contact ``research-it@sheffield.ac.uk``.

Using the Rmath library in C Programs
-------------------------------------
The Rmath library allows you to access some of R's functionality from a C program. 
For example, consider this C program:

.. code-block:: c

   #include <stdio.h>
   #define MATHLIB_STANDALONE
   #include "Rmath.h"

   main(){
      double shape1,shape2,prob;

      shape1 = 1.0;
      shape2 = 2.0;
      prob = 0.5;

      printf("Critical value is %lf\n",qbeta(prob,shape1,shape2,1,0));
   }

This makes use of R's ``qbeta`` function. 
You can compile and run this on a worker node as follows.

Start a session on a worker node with ``qrshx`` and load a version of R: ::
start an :ref:`interactive session <submit_interactive_bessemer>` on a worker node
and load a version of R: ::

   module load R/3.6.2-foss-2019b

Assuming the program is called ``test_rmath.c``, compile with: ::

   gcc test_rmath.c -lRmath -lm -o test_rmath

For full details about the functions made available by the Rmath library, 
see section 6.7 of the document `Writing R extensions <https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Numerical-analysis-subroutines>`_

Installation Notes
------------------
These notes are primarily for administrators of the system.

R/4.0.0-foss-2020a
^^^^^^^^^^^^^^^^^^

Installed using an eponymous easyconfig,
which is the easyconfig that shipped with EasyBuild 4.3.1
minus any of the configuration to install 765 packages from CRAN
(i.e. just base R was installed).

R/3.6.2-foss-2019b
^^^^^^^^^^^^^^^^^^

Installed using an eponymous easyconfig,
which is the easyconfig that shipped with EasyBuild 4.2.2
minus any of the configuration to install 765 packages from CRAN
(i.e. just base R was installed).

NOTE: all R versions patched to address the CVE vulnerability using R-4.x_fix-CVE-2024-27322.patch
