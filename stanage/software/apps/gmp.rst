.. _gmp_stanage:

GnuMP
=====

.. sidebar:: GMP

    :Dependencies: GCC compiler
    :Documentation: https://gmplib.org/manual/ 


GnuMP is a portable library written in C for arbitrary precision arithmetic on integers, rational numbers, and floating-point numbers. It aims to provide the fastest possible arithmetic for all applications that need higher precision than is directly supported by the basic C types. 


Usage
-----

GnuMP can be activated as follows:

.. code-block::
         
    module load GMP/6.2.1-GCCcore-11.3.0
    module load GMP/6.2.1-GCCcore-11.2.0                      
    module load GMP/6.2.1-GCCcore-10.3.0                       
    module load GMP/6.2.0-GCCcore-10.2.0                       
    module load GMP/6.2.0-GCCcore-9.3.0                       
    module load GMP/6.1.2-GCCcore-8.3.0
    module load GMP/6.1.2-GCCcore-7.3.0   


Installation notes
------------------

GnuMP was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTGMP/easybuild`` with the module loaded.

