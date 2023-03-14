.. _icc_ifort_stanage:

Intel Compilers
===============

Intel has compilers for C (icc), C++ (icpc) and Fortran (ifort).

To activate *both* the C/C++ and Fortran compilers use one of: ::

   module load iccifort/2019.1.144-GCC-8.2.0-2.31.1 # subset of intel-2019a toolchain
   module load iccifort/2019.5.281 # subset of intel-2019b EasyBuild toolchain
   module load iccifort/2020.1.217 # subset of intel-2020a EasyBuild toolchain
   module load iccifort/2020.4.304 # subset of intel-2020b EasyBuild toolchain

Which implicitly also load versions of the :ref:`GCC <gcc_stanage>` compiler.

For older versions of the ``intel`` EasyBuild toolchain you can also load icc/icpc and ifort independently using one of: ::

   module load icc/2019.1.144-GCC-8.2.0-2.31.1     # subset of intel-2019a toolchain
   module load ifort/2019.1.144-GCC-8.2.0-2.31.1   # subset of intel-2019a toolchain

Again, versions of the :ref:`GCC <gcc_stanage>` compiler are implicitly loaded.

Confirm that you've loaded the version of icc/icpc you require: ::

   icc -v

Documentation
-------------

man pages are available on the system.
Once you have loaded the required version of icc/icpc/ifort, run: ::

   man icc
   man ifort
