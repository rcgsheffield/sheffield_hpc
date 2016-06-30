.. _jags:

JAGS
====

.. sidebar:: JAGS

   :Latest version: 4.2
   :URL: http://mcmc-jags.sourceforge.net/

JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.  JAGS was written with three aims in mind:

* To have a cross-platform engine for the BUGS language
* To be extensible, allowing users to write their own functions, distributions and samplers.
* To be a platform for experimentation with ideas in Bayesian modeling

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` or :ref:`qrsh` command. To make JAGS available in this session, run one of the following module commands ::

      module load apps/gcc/4.8.2/JAGS/4.2
      module load apps/gcc/4.8.2/JAGS/3.4
      module load apps/gcc/4.8.2/JAGS/3.1

You can now run the ``jags`` command ::

    jags
    Welcome to JAGS 4.2.0 on Thu Jun 30 09:21:17 2016
    JAGS is free software and comes with ABSOLUTELY NO WARRANTY
    Loading module: basemod: ok
    Loading module: bugs: ok
    .

The rjags and runjags interfaces in R
-------------------------------------
`rjags <https://cran.r-project.org/web/packages/rjags/index.html>`_ and `runjags <https://cran.r-project.org/web/packages/runjags/index.html>`_ are CRAN packages that provide an R interface to jags. They are not installed in R by default.

After connecting to iceberg (see :ref:`ssh`), start an interactive session with the :ref:`qrshx` command. Run the following module commands ::

        module load compilers/gcc/4.8.2
        module load apps/gcc/4.8.2/JAGS/4.2
        module load apps/R/3.3.0

Launch R by typing ``R`` and pressing return. Within R, execute the following commands ::

        install.packages('rjags')
        install.packages('runjags')

and follow the on-screen inctructions. Answer ``y`` to any questions about the creation of a personal library should they be asked.

The packages will be stored in a directory called `R` within your home directory.

You should only need to run the ``install.packages`` commands once. When you log into the system in future, you will only need to run the ``module`` commands above to make JAGS available to the system.

You load the rjags packages the same as you would any other R package ::

        library('rjags')
        library('runjags')

If you received an error message such as ::

    Error : .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/home/fe1mpc/R/x86_64-unknown-linux-gnu-library/3.2/rjags/libs/rjags.so':
      libjags.so.3: cannot open shared object file: No such file or directory
    Error: package or namespace load failed for 'rjags'

the most likely cause is that you forget to load the necessary modules before starting R.

Installation notes
-------------------
Version 4.2

JAGS 4.2 was built with gcc 4.8.2

* Install script on github - https://github.com/mikecroucher/HPC_Installers/blob/master/apps/jags/4.2.0/sheffield/iceberg/install_jags4.2.0.sh
* Module file on github - https://github.com/mikecroucher/HPC_Installers/blob/master/apps/jags/4.2.0/sheffield/iceberg/4.2


Version 3.4

JAGS 3.4 was built with gcc 4.8.2 ::

    module load compilers/gcc/4.8.2
    tar -xvzf ./JAGS-3.4.0.tar.gz
    cd JAGS-3.4.0
    mkdir -p /usr/local/packages6/apps/gcc/4.8.2/JAGS/3.4
    ./configure --prefix=/usr/local/packages6/apps/gcc/4.8.2/JAGS/3.4
    make
    make install

Version 3.1

JAGS 3.1 was built with gcc 4.8.2 ::

    module load compilers/gcc/4.8.2
    tar -xvzf ./JAGS-3.1.0.tar.gz
    cd JAGS-3.1.0
    mkdir -p /usr/local/packages6/apps/gcc/4.8.2/JAGS/3.1
    ./configure --prefix=/usr/local/packages6/apps/gcc/4.8.2/JAGS/3.1
    make
    make install
