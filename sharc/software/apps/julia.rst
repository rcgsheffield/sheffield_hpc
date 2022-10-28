.. _julia_sharc:

Julia
=====

.. sidebar:: JAGS

   :Latest version: 4.2
   :URL: http://mcmc-jags.sourceforge.net/
   :dependencies:

The Julia programming language is a flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages. For more information visit: https://docs.julialang.org/en/v1/  

Interactive Usage
-----------------
After connecting to sharc (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` command.

The latest version of Julia (currently 1.8.2) is made available with the command ::

        module load apps/julia/1.8.2/binary

You can then run the command line version by entering ``julia``.


Installation notes
------------------
These are primarily for administrators of the system.

**julia version 1.8.2**

* wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.2-linux-x86_64.tar.gz
* tar -xf julia-1.8.2-linux-x86_64.tar.gz

The module file is :download:`/usr/local/modulefiles/apps/julia/1.8.2/binary </sharc/software/modulefiles/apps/julia/1.8.2/binary>`.