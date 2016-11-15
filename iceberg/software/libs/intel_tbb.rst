.. _iceberg_intel_tbb:

Intel Threading Building Blocks
===============================

Threading Building Blocks (TBB) lets you write "parallel C++ programs that take
full advantage of multicore performance, that are portable and composable, and
that have future-proof scalability."  

Interactive usage
-----------------

TBB can be used with and without :ref:`other Parallel Studio packages
<iceberg_intel_parallel_studio>`.

To make use of it you first need to start an :ref:`interactive session that has access to multiple cores <sge-queue>`.
Here we request six cores from the clusters' scheduler: ::

        $ qrsh -pe openmp 6

Next, we need to *active* a specific version of TBB: ::

        $ module load libs/binlibs/intel-tbb/2017.0

You can find sample TBB programs in the directory ``$TBB_SAMPLES``: ::

        $ ls $TBB_SAMPLES

        common  concurrent_hash_map  concurrent_priority_queue  GettingStarted  graph  index.html  license.txt  parallel_do  parallel_for  parallel_reduce  pipeline  task  task_arena  task_group  test_all

We can compile and run a sample program by copying the samples to our (writable) home directory, 
moving in to the directory containing the sample program (which should have a ``Makefile``) 
then running ``make``: ::

        $ cp -r $TBB_SAMPLES ~/tbb_samples
        $ cd ~/tbb_samples/GettingStarted/sub_string_finder/
        $ ls

        license.txt  Makefile  readme.html  sub_string_finder.cpp  sub_string_finder_extended.cpp  sub_string_finder_pretty.cpp

        $ make

        g++ -O2 -DNDEBUG  -o sub_string_finder sub_string_finder.cpp -ltbb -lrt 
        g++ -O2 -DNDEBUG  -o sub_string_finder_pretty sub_string_finder_pretty.cpp -ltbb -lrt 
        g++ -O2 -DNDEBUG  -o sub_string_finder_extended sub_string_finder_extended.cpp -ltbb -lrt 
        ./sub_string_finder_extended 
         Done building string.
         Done with serial version.
         Done with parallel version.
         Done validating results.
        Serial version ran in 8.51745 seconds
        Parallel version ran in 1.51716 seconds

Many of the sample directories contain HTML documentation.  
To read this you need to start an :ref:`interactive graphical session <sge-queue>` (using ``qsh`` or ``qrshx``) then run: ::

        $ firefox ~/tbb_samples/index.html
 
Tutorials
---------

See Chrys Woods' excellent tutorials for `C++ programmers
<http://chryswoods.com/parallel_c++>`_ and `Python programmers
<http://chryswoods.com/parallel_python/index.html>`_.

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing
<iceberg_intel_parallel_studio>`.

Installation Notes
------------------

The following notes are primarily for system administrators.

**Intel TBB 2017.0**

Installed as part of :ref:`Parallel Studio Composer Edition 2017
<iceberg_intel_parallel_studio>`.

:download:`This modulefile
</iceberg/software/modulefiles/libs/binlibs/intel-tbb/2017.0>` was installed as
``/usr/local/modulefiles/libs/binlibs/intel-tbb/2017.0``.
