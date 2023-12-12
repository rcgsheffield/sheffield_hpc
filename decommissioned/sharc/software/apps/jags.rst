.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _jags_sharc:

JAGS
====

.. sidebar:: JAGS

   :Latest version: 4.2
   :URL: http://mcmc-jags.sourceforge.net/
   :dependencies: GCC-4.9.4, Blas & Lapack libraries

JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical 
models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.  JAGS 
was written with three aims in mind:

* To have a cross-platform engine for the BUGS language
* To be extensible, allowing users to write their own functions, distributions and samplers.
* To be a platform for experimentation with ideas in Bayesian modeling

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the 
:ref:`qrshx` or :ref:`qrsh` command. 

The latest version of JAGS (currently version 4.2) is made available with the command:

.. code-block:: console

    $ module load apps/jags/4.2/gcc-4.9.4

You can now run the ``jags`` command 

.. code-block:: console

    $ jags
    Welcome to JAGS 4.2.0 on Fri Nov 15 09:21:17 2019
    JAGS is free software and comes with ABSOLUTELY NO WARRANTY
    Loading module: basemod: ok
    Loading module: bugs: ok
    .

The rjags and runjags interfaces in R
-------------------------------------
`rjags <https://cran.r-project.org/web/packages/rjags/index.html>`_ and 
`runjags <https://cran.r-project.org/web/packages/runjags/index.html>`_ 
are CRAN packages that provide an R interface to JAGS. They are not 
installed in R by default.

After connecting to ShARC (see :ref:``ssh``), start an interactive 
session with the :ref:``qrshx`` command. 

Run the following module commands 

.. code-block:: console

    $ module load apps/jags/4.2/gcc-4.9.4
    $ module load apps/R/3.5.1/gcc-4.8.5

Launch R by typing ``R`` and pressing return. Within R, execute the following commands ::

    install.packages('rjags')
    install.packages('runjags')

and follow the on-screen inctructions. Answer ``y`` to any questions about the creation 
of a personal library should they be asked.

The packages will be stored in a directory called `R` within your home directory.

You should only need to run the ``install.packages`` commands **once**. When you log into 
the system in future, you will only need to run the ``module`` commands above to make JAGS available to the system.

You load the rjags packages the same as you would any other R package ::

    library('rjags')
    library('runjags')

.. warning::

    If you received an error message such as :

    .. code-block:: console

        Error : .onLoad failed in loadNamespace() for 'rjags', details:
        call: dyn.load(file, DLLpath = DLLpath, ...)
        error: unable to load shared object '/home/te1st/R/x86_64-unknown-linux-gnu-library/3.2/rjags/libs/rjags.so':
        libjags.so.3: cannot open shared object file: No such file or directory
        Error: package or namespace load failed for 'rjags'

    The most likely cause is that you forget to load the necessary modules before starting R.


Installation notes
-------------------

Version 4.2
^^^^^^^^^^^

JAGS 4.2 was built with gcc 4.9.4

* Installed using :download:`install.sh </decommissioned/sharc/software/install_scripts/apps/jags/4.2/gcc-4.9.4/install_jags.sh>`
* :download:`This module file </decommissioned/sharc/software/modulefiles/apps/jags/4.2/gcc-4.9.4>` was installed as ``/usr/local/modulefiles/apps/jags/4.2/gcc-4.9.4``

