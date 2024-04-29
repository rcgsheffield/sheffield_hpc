.. _gcc_stanage:

GNU Compiler Collection (gcc)
=============================

The GNU Compiler Collection (gcc) is a widely used, free collection of compilers
for C (gcc), C++ (g++) and Fortran (gfortran).

It is possible to switch versions of the gcc compiler suite using modules.
After connecting to Stanage, start an interactive session: :: 

   srun --pty bash -i

then choose the version of the compiler you wish to use
by running *one* of the following lines:

.. tabs::

   .. group-tab:: icelake

        .. code-block:: console

           module load GCC/8.2.0-2.31.1  # part of the foss-2019a toolchain
           module load GCC/8.3.0         # part of the foss-2019b toolchain
           module load GCC/9.2.0         
           module load GCC/9.3.0         # part of the foss-2020a toolchain
           module load GCC/9.5.0         
           module load GCC/10.1.0        
           module load GCC/10.2.0        # part of the foss-2020b toolchain
           module load GCC/10.3.0        # part of the foss-2021a toolchain
           module load GCC/11.1.0        
           module load GCC/11.2.0        # part of the foss-2021b toolchain
           module load GCC/11.3.0        # part of the foss-2022a toolchain
           module load GCC/12.2.0        # part of the foss-2022b toolchain

   .. group-tab:: znver3

        .. code-block:: console

           module load GCCcore/11.3.0 
           module load GCC/12.2.0

Confirm that you've loaded the version of gcc you wanted using ``gcc -v``.

Language support
----------------

* Which version(s) of GCC support which features of the `C99 <https://gcc.gnu.org/c99status.html>`__ and `C11 <https://gcc.gnu.org/wiki/C11Status>`__ standards?
* `Which version(s) of GCC support which features of the C++98, C++11, C++14 and C++17 standards? <https://gcc.gnu.org/projects/cxx-status.html>`__

Documentation
-------------

man pages are available on the system.
Once you have loaded the required version of ``gcc``, type ::

    man gcc

* `What's new in the gcc version 12 series? <https://gcc.gnu.org/gcc-12/changes.html>`__
