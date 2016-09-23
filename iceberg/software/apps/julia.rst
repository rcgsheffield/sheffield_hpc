Julia
=====

.. sidebar:: Julia

   :Versions:  0.5.0-rc3
   :URL: http://julialang.org/

Julia is a high-level, high-performance dynamic programming language for technical computing, with syntax that is familiar to users of other technical computing environments.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with either the or :ref:`qrsh` or :ref:`qrshx` commands.

The latest version of Julia (currently 0.5.0-rc3) is made available with the commands ::

        module load compilers/gcc/5.2
        module load apps/gcc/5.2/julia/0.5.0-rc3

This adds Julia to your PATH and also loads the gcc 5.2 compiler environment with which Julia was built.

Start Julia by executing the command ::

       julia

You can exit a Julia session with the **quit()** function.

Installation notes
------------------
These are primarily for administrators of the system.

Julia was installed using gcc 5.2 ::

  module load apps/gcc/5.2/git/2.5
  module load compilers/gcc/5.2
  module load apps/python/anaconda2-2.5.0

  git clone git://github.com/JuliaLang/julia.git
  cd julia
  git checkout release-0.5
  #The next line targets the NEHALEM CPU architecture. This is the lowest architecture available on
  #Iceberg and so the resulting binary will be supported on all nodes. Performance will not be as good as it
  #could be on modern nodes.
  sed -i s/OPENBLAS_TARGET_ARCH:=/OPENBLAS_TARGET_ARCH:=NEHALEM/ ./Make.inc
  make

Module File
-----------

The module file is as below ::

  #%Module10.2####################################################################
  #

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          global ver

          puts stderr "   Adds Julia $ver to your environment variables."
  }

  # Mathematica version (not in the user's environment)
  set     ver     0.5.0-rc3

  module-whatis   "sets the necessary Julia $ver paths"

  prepend-path PATH /usr/local/packages6/apps/gcc/5.2/julia/0.5.0-rc3
