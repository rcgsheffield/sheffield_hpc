GnuMP
=====

.. sidebar:: GMP

   .. tabs::
     .. group-tab:: Stanage
        :Dependencies: GCC compiler
        :Documentation: https://gmplib.org/manual/ 

     .. group-tab:: Bessemer
        :Dependencies: GCC compiler
        :Documentation: https://gmplib.org/manual/ 

     .. group-tab:: Sharc
        :Dependencies: GCC compiler
        :Documentation: https://gmplib.org/manual/



GnuMP is a portable library written in C for arbitrary precision arithmetic on integers, rational numbers, and floating-point numbers. It aims to provide the fastest possible arithmetic for all applications that need higher precision than is directly supported by the basic C types. 


Usage
-----

GnuMP can be activated as follows:




.. tabs:: 

   .. group-tab:: Stanage

    .. code-block:: console
         
        module load GMP/6.2.1-GCCcore-11.3.0
        module load GMP/6.2.1-GCCcore-11.2.0                      
        module load GMP/6.2.1-GCCcore-10.3.0                       
        module load GMP/6.2.0-GCCcore-10.2.0                       
        module load GMP/6.2.0-GCCcore-9.3.0                       
        module load GMP/6.1.2-GCCcore-8.3.0
        module load GMP/6.1.2-GCCcore-7.3.0          


   .. group-tab:: Bessemer

    .. code-block:: console  
                              
        module load GMP/6.2.0-GCCcore-10.2.0                      
        module load GMP/6.2.0-GCCcore-9.3.0                    
        module load GMP/6.1.2-GCCcore-8.3.0 
        module load GMP/6.1.2-GCCcore-8.2.0
        module load GMP/6.1.2-GCCcore-7.3.0

   .. group-tab:: Sharc

    .. code-block:: console

        module load apps/gmp/6.2.0/gcc-8.2.0


Installation notes
------------------

.. tabs::

   .. group-tab:: Stanage
      
        GnuMP was installed using Easybuild 4.7.0, build details can be found in $EBROOTGMP/easybuild with the module loaded.

   .. group-tab:: Bessemer
    
        GnuMP was installed using Easybuild 4.4.0

   .. group-tab:: Sharc

        GnuMP 6.2.0 was installed using the
        :download:`install_gnuMP.sh </sharc/software/install_scripts/apps/gmp/6.2.0/gcc-8.2.0/install_gnuMP.sh>` script; the module
        file is
        :download:`gcc-8.2.0 </sharc/software/modulefiles/apps/gmp/6.2.0/gcc-8.2.0>`.


