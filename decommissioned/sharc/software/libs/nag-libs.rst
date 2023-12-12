.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _naglibs_sharc:

NAG Fortran and C Library
=========================

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

Usage
-----
Use the following command to make Mark 28.5 of the serial (1 CPU core) version of the NAG C and Fortran Library for Intel compilers available: ::

   module load libs/NAG/nll6i285bl

In addition to loading a module for the library, 
you will usually need to load a module for the compiler you are using.

``nll6i285bl`` is compatible with the Intel compilers >= 19.0.5 
so you should load an appropriate module from the :ref:`list of available Intel compiler modules <sharc-intel-compilers>` e.g.: ::

   module load dev/intel-compilers/19.1.3

You can now compile a Fortran program so it is linked against the NAG library: ::

   ifort your_code.f90 -lnag_mkl -o your_code.exe

which links to a version of the NAG library that's linked against the high performance Intel MKL.
This in turn provides high-performance versions of the BLAS and LAPACK libraries.

Alternatively, you can compile using ::

   ifort your_code.f90 -lnag_nag -o your_code.exe

which is linked against a reference version of BLAS and LAPACK. 

If you are in any doubt as to which to choose, we suggest that you use ``-lnag_mkl``


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
If you try this yourself, 
the output you get will vary according to which version of the NAG library you are using: ::

   nag_example a00aaf

If you have loaded the ``module`` for nll6i285bl this will give the following output ::

   Use nagvars script to set NAG compile and link environment
   variables within nag_example script
   . /usr/local/packages/libs/NAG/nll6i285bl/scripts/nagvars.sh -quiet int32 static nag

   Copying a00aafe.f90 to current directory
   cp /usr/local/packages/libs/NAG/nll6i285bl/f_examples/source/a00aafe.f90 .

   Compiling and linking a00aafe.f90 to produce executable a00aafe.exe
   ifort -I/usr/local/packages/libs/NAG/nll6i285bl/lp64/nag_interface_blocks a00aafe.f90 /usr/local/packages/libs/NAG/nll6i285bl/lp64/lib/libnag_nag.a -lm -ldl -lstdc++ -o a00aafe.exe

   Running a00aafe.exe
   ./a00aafe.exe > a00aafe.r
    A00AAF Example Program Results
 
    *** Start of NAG Library implementation details ***
 
    Implementation title: Linux, 64-bit, Intel Classic C/C++ or Intel Classic Fortran
               Precision: double precision
            Product Code: NLL6I285BL
                    Mark: 28.5.0 (self-contained)
 
     This is a 64-bit library using 32-bit integers.
 
    *** End of NAG Library implementation details ***

Documentation
-------------

The Numerical and statistical capabilities of the Fortran and C library are described in the 
`The NAG Library Mark 28.5 Manual <https://www.nag.com/numeric/nl/nagdoc_28.5/>`_ (Link to NAG's webbsite).

Older versions
--------------

You may find older versions installed; these have been deprecated as they are no longer licensed or supported by NAG.

Installation notes
------------------
**nll6i285bl (Mark 28.5)**

These are primarily for system administrators ::

    PRODUCT='nll6i285bl'
    pushd "${TMPDIR-/tmp}"
    wget "https://www.nag.co.uk/downloads/impl/${PRODUCT}.tgz"
    tar -xvzf "${PRODUCT}.tgz"
    cd "$PRODUCT"
    ./install.sh \
        -silent \
        -accept \
        -installdir=/usr/local/packages/libs/NAG

Module Files
------------
**nll6i285bl (Mark 28.5)**

* The module file is on the system at ``/usr/local/modulefiles/libs/NAG/nll6i285bl``
* The module file is :download:`on github </decommissioned/sharc/software/modulefiles/libs/NAG/nll6i285bl>`.

