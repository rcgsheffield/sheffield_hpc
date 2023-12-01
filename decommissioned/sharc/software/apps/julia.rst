.. _julia_sharc:

Julia
=====

.. sidebar:: Julia

   :Latest version: 1.8.5
   :URL: https://docs.julialang.org/en/v1/
   :dependencies:

The Julia programming language is a flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages. For more information visit: https://docs.julialang.org/en/v1/  

Interactive Usage
-----------------
After connecting to sharc (see :ref:`ssh`),  start an interactive session with the 
:ref:`qrshx` or :ref:`qrsh` command. 

The latest version of Julia (currently 1.8.2) is made available with the command ::

        module load apps/julia/1.8.5/binary
        module load apps/julia/1.8.2/binary

You can then start Julia with ``julia``.


Installation notes
------------------
These are primarily for administrators of the system.

**julia version 1.8.5**
was installed using the
:download:`install_julia.sge </sharc/software/install_scripts/apps/julia/1.8.5/install_julia.sge>` script.

**julia version 1.8.2**
was installed using the
:download:`install_julia.sh </sharc/software/install_scripts/apps/julia/1.8.2/install_julia.sh>` script.

The module file is :download:`/usr/local/modulefiles/apps/julia/1.8.2/binary </sharc/software/modulefiles/apps/julia/1.8.2/binary>`.