NAG Fortran Compiler
====================

The NAG Fortran Compiler is robust, highly tested, and valued by developers all over the globe for its checking capabilities and detailed error reporting. The Compiler is available on Unix platforms as well as for Microsoft Windows and Apple Mac platforms. Release 6.0 has extensive support for both legacy and modern Fortran features, and also supports parallel programming with OpenMP.

Making the NAG Compiler available
---------------------------------

After connecting to ShARC (see :ref:`ssh`),  start an interactive sesssion with the :code:`qsh` or :code:`qrsh` command. To make the NAG Fortran Compiler available, run the following module command ::

        module load dev/NAG/6.1
        module load dev/NAG/6.0

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

The following notes are primarily for system sysadmins

**Licensing**

Add the license key(s) to ``/usr/local/packages/dev/NAG/license.lic``.

The license key needs to be updated annually before 31st July.

The NAG compiler environment modules (see below) set the environment variable ``$NAG_KUSARI_FILE`` to the path to this file.

**Version 6.1**

#. Perform an unattended install using `install_NAG_compiler_6.1.sh
   <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/install_scripts/dev/NAG/install_NAG_compiler_6.1.sh>`__.
   The software will be installed into ``/usr/local/packages/dev/NAG/6.1``.
#. Install `this modulefile
   <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/dev/NAG/6.1>`__
   as ``/usr/local/modulefiles/dev/NAG/6.1``
#. Test the installation by compiling and building a sample Fortran 90 program ::

        module load dev/NAG/6.1
        nagfor -o /tmp/f90_util /usr/local/packages/dev/NAG/6.1/lib/NAG_Fortran/f90_util.f90
        /tmp/f90_util

**Version 6.0**

First, run the following ::

        nag_vers=6.0
        media_dir="/usr/local/media/NAG/$nag_vers"
        mkdir -p $media_dir
        tarball=npl6a60na_amd64.tgz 
        tarball_url=https://www.nag.co.uk/downloads/impl/$tarball

        wget -c $tarball_url -P $media_dir

        mkdir -m 2775 -p $prefix
        chown -R $USER:app-admins $prefix

        mkdir -p $tmp_dir
        pushd $tmp_dir
        tar -zxf $media_dir/$tarball
        pushd NAG_Fortran-amd64/

Next, run the interactive install script ::

        ./INSTALL.sh

Accept the license and answer the questions as follows:

* **Install compiler binaries to where? [/usr/local/bin]?** ``/usr/local/packages/dev/NAG/6.0/bin/``
* **Install compiler library files to where?** ``/usr/local/packages/dev/NAG/6.0/lib/NAG_Fortran``
* **Install compiler man page to which directory?** ``/usr/local/packages/dev/NAG/6.0/man/man1``
* **Suffix for compiler man page [1]** *leave as default*
* **Install module man pages to which directory?** ``/usr/local/packages/dev/NAG/6.0/man/man3``
* **Suffix for module man pages [3]?** *leave as default*

Install `this modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/dev/NAG/6.0>`__ as ``/usr/local/modulefiles/dev/NAG/6.0``

Test the installation by compiling and building a sample Fortran 90 program ::

        module load dev/NAG/6.0
        nagfor -o /tmp/f90_util /usr/local/packages/dev/NAG/6.0/lib/NAG_Fortran/f90_util.f90
        /tmp/f90_util
