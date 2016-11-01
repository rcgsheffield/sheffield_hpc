.. _sharc-intel-tbb:

Intel Threading Building Blocks
===============================

Threading Building Blocks (TBB) lets you write "parallel C++ programs that take full advantage of multicore performance, that are portable and composable, and that have future-proof scalability."  

Parallel Studio Composer Edition version
----------------------------------------

TBB can be used with and without :ref:`other Parallel Studio packages <sharc-intel-parallel-studio>`.
To access it: ::

    module load libs/intel-tbb/2017.0/binary

Tutorials
---------

See Chrys Woods' excellent tutorials for `C++ programmers <http://chryswoods.com/parallel_c++>`_ and `Python programmers <http://chryswoods.com/parallel_python/index.html>`_.


Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing <sharc-intel-parallel-studio>`.

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel TBB 2017.0**

Installed as part of :ref:`Parallel Studio Composer Edition 2017 <sharc-intel-parallel-studio>`.

`This modulefile <https://github.com/rcgsheffield/sheffield_hpc/tree/master/sharc/software/modulefiles/libs/intel-tbb/2017.0>`__ was installed as ``/usr/local/modulefiles/libs/intel-tbb/2017.0/binary``.
