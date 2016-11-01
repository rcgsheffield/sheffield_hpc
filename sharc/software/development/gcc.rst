.. _gcc_sharc:

GNU Compiler Collection (gcc)
=============================
The GNU Compiler Collection (gcc) is a widely used, free collection of compilers including C (gcc), C++ (g++) and Fortran (gfortran). The defaut version of gcc on the system is 4.8.5 ::

    $ gcc -v

    Using built-in specs.
    COLLECT_GCC=gcc
    COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/lto-wrapper
    Target: x86_64-redhat-linux
    Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-linker-hash-style=gnu --enable-languages=c,c++,objc,obj-c++,java,fortran,ada,go,lto --enable-plugin --enable-initfini-array --disable-libgcj --with-isl=/builddir/build/BUILD/gcc-4.8.5-20150702/obj-x86_64-redhat-linux/isl-install --with-cloog=/builddir/build/BUILD/gcc-4.8.5-20150702/obj-x86_64-redhat-linux/cloog-install --enable-gnu-indirect-function --with-tune=generic --with-arch_32=x86-64 --build=x86_64-redhat-linux
    Thread model: posix
    gcc version 4.8.5 20150623 (Red Hat 4.8.5-4) (GCC) 

It is possible to switch to other versions of the gcc compiler suite using modules. After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qrsh` or `qsh` command. Choose the version of the compiler you wish to use using one of the following commands ::

    module load dev/gcc/6.2
    module load dev/gcc/5.4

Confirm that you've loaded the version of gcc you wanted using ``gcc -v``.

Documentation
-------------
man pages are available on the system. Once you have loaded the required version of `gcc`, type ::

    man gcc

* `What's new in the gcc version 6 series? <https://gcc.gnu.org/gcc-6/changes.html>`_
* `What's new in the gcc version 5 series? <https://gcc.gnu.org/gcc-5/changes.html>`_

Installation Notes
------------------
These notes are primarily for system administrators

* gcc version 6.2 was installed using :

* `install_gcc_6.2.sh <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/6.2/sheffield/sharc/install_gcc_6.2.sh>`_
* `gcc 6.2 modulefile <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/6.2/sheffield/sharc/6.2>`_ located on the system at ``/usr/local/modulefiles/dev/gcc/6.2``

* gcc version 5.4 was installed using :

* `install_gcc_5.4.sh <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/5.4/sheffield/sharc/install_gcc_5.4.sh>`_
* `gcc 5.4 modulefile <https://github.com/mikecroucher/HPC_Installers/compilers/gcc/5.4/sheffield/sharc/5.4>`_ located on the system at ``/usr/local/modulefiles/dev/gcc/5.4``
