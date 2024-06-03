.. _nag_stanage:

NAG Fortran and C Library
=========================

.. sidebar:: nag

   :Version: Mark 30.0.0
   :URL: https://nag.com/nag-library/

The NAG Library is a comprehensive collection of routines for the solution of numerical and statistical problems.
The Library consists of a number of generic interfaces:

* the FL interface, a standard set of interfaces that utilise only simple types 
  which makes them suitable for calling from a wide range of languages, 
  including Fortran (NAG's traditional Fortran Library interfaces), C, C++, VBA and others;
* the CL Interface, NAG's traditional set of C Library interfaces;
* the NAG AD Library interfaces to support Algorithmic Differentiation.

In addition to these generic interfaces, 
NAG supports interfaces tailored to specific environments and programming languages, 
including Python, Java, .NET and MATLAB. 

--------

Usage
-----

To make this library available, run the following: ::

    module load NAG/nll6i30dbl  

This also activates the intel compiler iccifort/2019.5.281

--------

You can now compile a Fortran program so it is linked against the NAG library: ::

   ifort your_code.f90 -lnag_mkl -o your_code.exe

which links to a version of the NAG library that's linked against the high performance Intel MKL.
This in turn provides high-performance versions of the BLAS and LAPACK libraries.

Alternatively, you can compile using ::

   ifort your_code.f90 -lnag_nag -o your_code.exe

which is linked against a reference version of BLAS and LAPACK. 

If you are in any doubt as to which to choose, we suggest that you use ``-lnag_mkl``

--------

Running NAG's example programs
------------------------------

Most of NAG's routines come with example programs that show how to use them. 
When you use the ``module`` command to load a version of the NAG library, 
the script ``nag_example`` for that version becomes available. 
Providing this script with the name of the NAG routine you are interested in 
will copy, compile and run the example program for that routine 
in your current working directory.

For example, here is an example output for the NAG routine ``a00aaf`` 
which identifies the version of the NAG library you are using. 
If you try this yourself, the output you get will vary according to which version of the NAG library you are using: ::

   /opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/scripts/nag_example a00aaf

If you have loaded the ``module`` for nll6i30dbl this will give the following output: ::

   Use nagvars script to set NAG compile and link environment
   variables within nag_example script
   . /opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/scripts/nagvars.sh -quiet  int32 static nag
   
   Copying a00aafe.f90 to current directory
   cp /opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/f_examples/source/a00aafe.f90 .
   
   Compiling and linking a00aafe.f90 to produce executable a00aafe.exe
   ifort  -I/opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/lp64/nag_interface_blocks a00aafe.f90 /opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/lp64/lib/libnag_nag.a -lm -ldl -lstdc++ -o a00aafe.exe
   
   Running a00aafe.exe
   ./a00aafe.exe > a00aafe.r
    A00AAF Example Program Results
    
    *** Start of NAG Library implementation details ***
    
    Implementation title: Linux, 64-bit, Intel Classic C/C++ or Intel Classic Fortran
               Precision: double precision
            Product Code: NLL6I30DBL
                    Mark: 30.0.0 (self-contained)
    
     This is a 64-bit library using 32-bit integers.
    
    *** End of NAG Library implementation details ***

--------

Installation notes
------------------

This section is primarily for administrators of the system:

.. code-block:: bash

    PRODUCT='nll6i30dbl'
    pushd "${TMPDIR-/tmp}"
    wget "https://www.nag.co.uk/downloads/impl/${PRODUCT}.tgz"
    tar -xvzf "${PRODUCT}.tgz"
    cd "$PRODUCT"
    ./install.sh -silent -accept-installdir=/opt/apps/testapps/el7/software/staging/NAG

The module file is :download:`/opt/apps/testapps/el7/modules/staging/all/NAG/nll6i30dbl.lua </stanage/software/modulefiles/nag/nll6i30dbl.lua>`.

--------

Testing
-------

Run an example program (as detailed above). The run_example copies the relevant Fortran code file & associated data, compiles & executes the test. Note: the example code contains a function call to the relevant pre-built NAG library function.
