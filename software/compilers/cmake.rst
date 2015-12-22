.. index::
    single: CMake

CMake
=====

CMake is a build tool commonly used when compiling other libraries.

CMake is installed in `/usr/local/packages6/cmake`.

Usage
-----

CMake can be loaded with::

    module load compilers/cmake

Installation
------------

Run the following commands::

    module load apps/python/2.7

    ./bootstrap --prefix=/usr/local/packages6/cmake/3.3.0/
    --mandir=/usr/local/packages6/cmake/3.3.0/man --sphinx-man

    gmake -j8

    gmake install
