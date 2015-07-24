R
=

.. sidebar:: R

   :Support Level: bronze
   :Dependencies: BLAS
   :URL: http://www.r-project.org/
   :Documentation: http://www.r-project.org/

R is a statistical computing language.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qsh` command.

The latest version of R can be loaded with ::

        module load apps/R

Alternatively, you can load a specific version of R using one of the following ::

        module load apps/R/3.2.1
        module load apps/R/3.2.0
        module load apps/R/3.1.2

R can then be run with ::

        $ R

Serial (one CPU) Batch usage
----------------------------
Here, we assume that you wish to run the program :code:`my_code.R` on the system.

First, you need to write a batch submission file. We assume you'll call this :code:`my_job.sge` ::

	#!/bin/bash
	#$ -S /bin/bash
	#$ -cwd               # Run job from current directory

  module load apps/R/3.2.1     # Load version 3.2.1 of R

	R CMD BATCH my_code.R my_code.R.o$JOB_ID

Note that R must be called with both the :code:`CMD` and :code:`BATCH` options which tell it to run an R program, in this case :code:`my_code.R`. If you do not do this, R will attempt to open an interactive prompt.

The final argument, :code:`my_test.R.o$JOBID`, tells R to send output to a file with this name. Since :code:`$JOBID` will always be unique, this ensures that all of your output files are unique. Without this argument R sends all output to a file called :code:`my_code.Rout`.

Ensuring that :code:`my_code.R` and :code:`my_job.sge` are both in your current working directory, submit your job to the batch system ::

	qsub my_job.sge

Replace :code:`my_job.sge` with the name of your submission script.

Graphical output
----------------
By default, graphical output from batch jobs is sent to a file called :code:`Rplots.pdf`

Installing additional packages
------------------------------

As you will not have permissions to install packages to the default folder, additional R packages can be installed to your home folder :code:`~/`. To create the appropriate folder, install your first package in R in interactive mode. Load an interactive R session as described above, and install a package with ::

        install.packages()
        
You will be prompted to create a personal package library. Choose yes. The package will download and install from a CRAN mirror (you may be asked to select a nearby mirror, which you can do simply by entering the number of your preferred mirror).

Once the chosen package has been installed, additional packages can be installed either in the same way, or by creating a .R script. An example script might look like ::

        install.packages("dplyr")
        install.packages("devtools")
        
Call this using :code:`source()`. For example if your script is called :code:`packages.R` and is stored in your home folder, source this from an interactive R session with ::

        source("~/packages.R")
        
These additional packages will be installed without prompting to your personal package library.

To check your packages are up to date, and update them if necessary, run the following line from an R interactive session ::

        update.packages(lib.loc = "~/R/x86_64-unknown-linux-gnu-library/3.2/")

The folder name after :code:`~/R/` will likely change, but this can be completed with tab autocompletion from the R session. Ensure :code:`lib.loc` folder is specified, or R will attempt to update the wrong library.

R Packages that require external libraries
------------------------------------------
Some R packages require external libraries to be installed before you can install and use them. Since there are so many, we only install those libraries that have been explicitly requested by users of the system.

The associated R packages are not included in the system install of R, so you will need to install them yourself to your home directory following the instructions linked to below.

* :ref:`geos` This is the library required for the ``rgeos`` package.
* :ref:`jags` This is the library required for the ``rjags`` package

Using libRmath
--------------
libRmath alows you to access some of R's functionality from a C program. For example, consider the C-program below ::

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

This makes use of R's ``qbeta`` function. You can compile and run this on a worker node. Start a session on a worker node with ``qrsh`` or ``qsh`` and load the R module ::

    module load apps/R/3.2.1

Assuming the program is called ``test_rmath.c``, compile with ::

    gcc test_rmath.c -lRmath -lm -o test_rmath

Installation Notes
------------------
These notes are primarily for administrators of the system.

**Version 3.2.1**

R was compiled from source using gcc 4.4.7 and the following commands::

        $ qrsh -l rmem=8G mem=16G
        $ tar -xvzf ./R-3.2.1.tar.gz
        $ cd R-3.2.1

The standard amount of memory allocated for a qrsh session was insufficient to build R, which is why 8gig was requested instead. ::

        $ module load libs/gcc/lapack
        $ module load libs/gcc/blas
        $ ./configure --prefix /usr/local/packages6/R/3.2.1 --with-blas --with-lapack --enable-R-shlib

output from the ``configure`` step was ::

    R is now configured for x86_64-unknown-linux-gnu

      Source directory:          .
      Installation directory:    /usr/local/packages6/R/3.2.1

      C compiler:                gcc -std=gnu99  -g -O2
      Fortran 77 compiler:       gfortran  -g -O2

      C++ compiler:              g++  -g -O2
      C++ 11 compiler:           g++  -std=c++0x -g -O2
      Fortran 90/95 compiler:    gfortran -g -O2
      Obj-C compiler:

      Interfaces supported:      X11, tcltk
      External libraries:        readline
      Additional capabilities:   PNG, JPEG, TIFF, NLS, cairo
      Options enabled:           shared R library, shared BLAS, R profiling

      Capabilities skipped:      ICU
      Options not enabled:       memory profiling

      Recommended packages:      yes

Built with ::

    $ make

To build libRmath.so ::

    $ cd R-3.2.1/src/nmath/standalone
    $ make
    $ mv /usr/local/packages6/R/3.2.1/lib64/libRmath.* /usr/local/packages6/R/3.2.1/lib64/R/lib

Install to the system ::

    $ make install

Testing was performed with ::

    $ make check

All tests passed.

Module file
-----------
location ``/usr/local/modulefiles/apps/R/3.2.1`` ::

  #%Module10.2#####################################################################

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##


  proc ModulesHelp { } {
      global helpmsg
      puts stderr "\t$helpmsg\n"
  }


  #
  # 1. change 'version' string to appropriate version number: 6.0, 5.2, ...
  #
  set version 3.2.1

  set R_DIR /usr/local/packages6/R

  prepend-path PATH $R_DIR/$version/bin
  prepend-path LD_LIBRARY_PATH $R_DIR/$version/lib64/R/lib/
