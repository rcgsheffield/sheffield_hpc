.. _gcc:

GNU Compiler Collection (gcc)
=============================
The GNU Compiler Collection (gcc) is a widely used, free collection of compilers including C (gcc), C++ (g++) and Fortran (gfortran). The defaut version of gcc on the system is 4.4.7 ::

    gcc -v

    Using built-in specs.
    Target: x86_64-redhat-linux
    Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk --disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre --enable-libgcj-multifile --enable-java-maintainer-mode --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux
    Thread model: posix
    gcc version 4.4.7 20120313 (Red Hat 4.4.7-11) (GCC)

It is possible to switch to other versions of the gcc compiler suite using modules. After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qrsh` or `qsh` command. Choose the version of the compiler you wish to use using one of the following commands ::

    module load compilers/gcc/6.2
    module load compilers/gcc/5.4
    module load compilers/gcc/5.3
    module load compilers/gcc/5.2
    module load compilers/gcc/4.9.2
    module load compilers/gcc/4.8.2
    module load compilers/gcc/4.5.3

Alternatively load the most recent available version using ::

    module load compilers/gcc

Confirm that you've loaded the version of gcc you wanted using ``gcc -v``.

Documentation
-------------
man pages are available on the system. Once you have loaded the required version of gcc, type ::

    man gcc

* `What's new in the gcc version 6 series? <https://gcc.gnu.org/gcc-6/changes.html>`_
* `What's new in the gcc version 5 series? <https://gcc.gnu.org/gcc-5/changes.html>`_

Installation Notes
------------------
These notes are primarily for system administrators

* gcc version 6.2 was installed using :

  * `install_gcc_6.2.sh <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/6.2/sheffield/iceberg/install_gcc_6.2.sh>`_
  * `gcc 6.2 modulefile <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/6.2/sheffield/iceberg/6.2>`_ located on the system at ``/usr/local/modulefiles/compilers/gcc/6.2``

* gcc version 5.4 was installed using :

  * `install_gcc_5.4.sh <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/5.4/sheffield/iceberg/install_gcc_5.4.sh>`_
  * `gcc 5.4 modulefile <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/5.4/sheffield/iceberg/5.4>`_ located on the system at ``/usr/local/modulefiles/compilers/gcc/5.4``

* Installation notes for version 5.3 are not available.

* gcc version 5.2 was installed using :

  * `install_gcc_5.2.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/compilers/gcc/install_gcc_5.2.sh>`_
  * `gcc 5.2 modulefile <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/compilers/gcc/5.2>`_ located on the system at ``/usr/local/modulefiles/compilers/gcc/5.2``

* gcc version 4.9.2 was installed using :

  * `install_gcc_4.9.2.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/compilers/gcc/install_gcc_5.9.2.sh>`_
  * `gcc 4.9.2 modulefile <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/compilers/gcc/4.9.2>`_ located on the system at ``/usr/local/modulefiles/compilers/gcc/4.9.2``

* Installation notes for versions 4.8.2 and below are not available.
