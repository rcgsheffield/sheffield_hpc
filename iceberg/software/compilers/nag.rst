NAG Fortran Compiler
====================

The NAG Fortran Compiler is robust, highly tested, and valued by developers all over the globe for its checking capabilities and detailed error reporting. The Compiler is available on Unix platforms as well as for Microsoft Windows and Apple Mac platforms. Release 6.0 has extensive support for both legacy and modern Fortran features, and also supports parallel programming with OpenMP.

Making the NAG Compiler available
---------------------------------

After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qsh` or :code:`qrsh` command. To make the NAG Fortran Compiler available, run the following module command ::

    module load compilers/NAG/6.0

Compilation examples
--------------------
To compile the Fortran hello world example into an executable called ``hello`` using the NAG compiler ::

      nagfor hello.f90 -o hello

Detailed Documentation
----------------------
Once you've run the NAG Compiler module command, ``man`` documentation is available ::

    man nagfor

Online documentation:

* `PDF version of the NAG Fortran Compiler Manual <http://www.nag.co.uk/nagware/np/r60_doc/np60_manual.pdf>`_
* `NAG Fortran Compiler Documentation Index (NAG's Website) <http://www.nag.co.uk/nagware/np.asp>`_

Installation Notes
------------------
The following notes are primarily for system sysadmins ::

  mkdir -p /usr/local/packages6/compilers/NAG/6.0
  tar -xvzf ./npl6a60na_amd64.tgz
  cd NAG_Fortran-amd64/

Run the interactive install script ::

  ./INSTALL.sh

Accept the license and answer the questions as follows ::

  Install compiler binaries to where [/usr/local/bin]?
  /usr/local/packages6/compilers/NAG/6.0

  Install compiler library files to where [/usr/local/lib/NAG_Fortran]?
  /usr/local/packages6/compilers/NAG/6.0/lib/NAG_Fortran

  Install compiler man page to which directory [/usr/local/man/man1]?
  /usr/local/packages6/compilers/NAG/6.0/man/man1

  Suffix for compiler man page [1] (i.e. nagfor.1)?
  Press enter

  Install module man pages to which directory [/usr/local/man/man3]?
  /usr/local/packages6/compilers/NAG/6.0/man/man3

  Suffix for module man pages [3] (i.e. f90_gc.3)?
  Press Enter

Licensing
---------
Add the license key to ``/usr/local/packages5/nag/license.lic``

The license key needs to be updated annually before 31st July.

Point to this license file using the environment variable ``$NAG_KUSARI_FILE`` (this is done in the environment module).

Module File
-----------

Install `this modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/iceberg/software/modulefiles/compilers/NAG/6.0>`__ as ``/usr/local/modulefiles/compilers/NAG/6.0``

Testing
-------

Test the installation by compiling and building a sample Fortran 90 program ::

        module load compilers/NAG/6.0
        nagfor -o /tmp/f90_util /usr/local/packages6/compilers/NAG/6.0/lib/NAG_Fortran/f90_util.f90
        /tmp/f90_util
