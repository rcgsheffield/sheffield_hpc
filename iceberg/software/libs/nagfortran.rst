.. _`NAG Fortran Library (serial)`:

NAG Fortran Library (Serial)
============================

Produced by experts for use in a variety of applications, the NAG Fortran Library has a global reputation for its excellence and, with hundreds of fully documented and tested routines, is the largest collection of mathematical and statistical algorithms available.

This is the serial (1 CPU core) version of the NAG Fortran Library. For many routines, you may find it beneficial to use the parallel version of the library.

Usage
-----
There are several versions of the NAG Fortran Library available. The one you choose depends on which compiler you are using. As with many libraries installed on the system, NAG libraries are made available via ``module`` commands which are only available once you have started a ``qrsh`` or ``qsh`` session.

In addition to loading a module for the library, you will usually need to load a module for the compiler you are using.

**NAG for Intel Fortran**

Use the following command to make Mark 25 of the serial (1 CPU core) version of the NAG Fortran Library for Intel compilers available ::

    module load libs/intel/15/NAG/fll6i25dcl

Once you have ensured that you have loaded the module for the :ref:`Intel compilers <iceberg_intel_compilers>` you can compile your NAG program using ::

    ifort your_code.f90 -lnag_mkl -o your_code.exe

which links to a version of the NAG library that's linked against the high performance Intel MKL (which provides high-performance versions of the BLAS and LAPACK libraries). Alternatively, you can compile using ::

    ifort your_code.f90 -lnag_nag -o your_code.exe

Which is linked against a reference version of BLAS and LAPACK. If you are in any doubt as to which to choose, we suggest that you use ``-lnag_mkl``



**NAG for PGI Fortran**

Use the following command to make Mark 24 of the serial (1 CPU core) version of the NAG Fortran Library for PGI compilers available ::

    module load libs/pgi/15/NAG/fll6a24dpl

Once you have ensured that you have loaded the module for the :ref:`PGI Compilers` you can compile your NAG program using ::

    pgf90 your_code.f90 -lnag_mkl -I$NAGINC -o your_code.exe

which links to a version of the NAG library that's linked against the high performance Intel MKL (which provides high-performance versions of the BLAS and LAPACK libraries). Alternatively, you can compile using ::

    pgf90 your_code.f90 -lnag_nag -I$NAGINC -o your_code.exe

Which is linked against a reference version of BLAS and LAPACK. If you are in any doubt as to which to choose, we suggest that you use ``-lnag_mkl``

Running NAG's example programs
------------------------------
Most of NAG's routines come with example programs that show how to use them. When you use the ``module`` command to load a version of the NAG library, the script ``nag_example`` for that version becomes available. Providing this script with the name of the NAG routine you are interested in will copy, compile and run the example program for that routine into your current working directory.

For example, here is an example output for the NAG routine ``a00aaf`` which identifies the version of the NAG library you are using. If you try this yourself, the output you get will vary according to which version of the NAG library you are using ::

  nag_example a00aaf

If you have loaded the ``module`` for fll6i25dcl this will give the following output ::

  Copying a00aafe.f90 to current directory
  cp /usr/local/packages6/libs/intel/15/NAG/fll6i25dcl/examples/source/a00aafe.f90 .

  Compiling and linking a00aafe.f90 to produce executable a00aafe.exe
  ifort -I/usr/local/packages6/libs/intel/15/NAG/fll6i25dcl/nag_interface_blocks a00aafe.f90 /usr/local/packages6/libs/intel/15/NAG/fll6i25dcl/lib/libnag_nag.a -o a00aafe.exe

  Running a00aafe.exe
  ./a00aafe.exe > a00aafe.r
   A00AAF Example Program Results

   *** Start of NAG Library implementation details ***

   Implementation title: Linux 64 (Intel 64 / AMD64), Intel Fortran, Double Precision (32-bit integers)
              Precision: FORTRAN double precision
           Product Code: FLL6I25DCL
                   Mark: 25.1.20150610 (self-contained)

   *** End of NAG Library implementation details ***

Functionality
-------------
The key numerical and statistical capabilities of the Fortran Library are shown below.

* `Click here for a complete list of the contents of the Library <http://www.nag.co.uk/numeric/fl/nagdoc_fl25/html/FRONTMATTER/manconts.html>`_.
* `Cick here to see what's new in Mark 25 of the library <http://www.nag.co.uk/numeric/fl/new-functionality>`_.

**Numerical Facilities**

* Optimization, both Local and Global
* Linear, quadratic, integer and nonlinear programming and least squares problems
* Ordinary and partial differential equations, and mesh generation
* Solution of dense, banded and sparse linear equations and eigenvalue problems
* Solution of linear and nonlinear least squares problems
* Curve and surface fitting and interpolation
* Special functions
* Numerical integration and integral equations
* Roots of nonlinear equations (including polynomials)
* Option Pricing Formulae
* Wavelet Transforms

**Statistical Facilities**

* Random number generation
* Simple calculations on statistical data
* Correlation and regression analysis
* Multivariate methods
* Analysis of variance and contingency table analysis
* Time series analysis
* Nonparametric statistics

Documentation
-------------

* `The NAG Fortran MK25 Library Manual <http://www.nag.co.uk/numeric/fl/fldocumentation.asp>`_ (Link to NAG's webbsite)
* `The NAG Fortran MK24 Library Manual <http://www.nag.co.uk/numeric/fl/nagdoc_fl24/html/frontmatter/manconts.html>`_ ( Link to NAG's website)

Installation notes
------------------
**fll6i25dcl**

These are primarily for system administrators ::

    tar -xvzf ./fll6i25dcl.tgz
    ./install.sh

The installer is interactive. Answer the installer questions as follows ::

   Do you wish to install NAG Mark 25 Library? (yes/no):
   yes

License file gets shown ::

   [accept/decline]? :
   accept

   Where do you want to install the NAG Fortran Library Mark 25?
   Press return for default location (/opt/NAG)
   or enter an alternative path.
   The directory will be created if it does not already exist.
   >
   /usr/local/packages6/libs/intel/15/NAG/

Module Files
------------
**fll6i25dcl**

* The module file is on the system at ``/usr/local/modulefiles/libs/intel/15/NAG/fll6i25dcl``
* The module file is `on github <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/libs/intel/15/NAG/fll6i25dcl>`_.

**fll6a24dpl**

* The module file is on the system at ``/usr/local/modulefiles/libs/pgi/15/NAG/fll6a24dpl``



