.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc-intel-tbb:

Intel Threading Building Blocks
===============================

Threading Building Blocks (TBB) lets you write "parallel C++ programs that take
full advantage of multicore performance, that are portable and composable, and
that have future-proof scalability."  

Interactive usage
-----------------

TBB can be used with and without :ref:`other Parallel Studio packages
<sharc-intel-parallel-studio>`.

To make use of it you first need to start an :ref:`interactive session that has access to multiple cores <submit_batch_sharc>`.
Here we request six cores from the clusters' scheduler: ::

        $ qrsh -pe smp 6

Next, we need to *active* a specific version of TBB.  Run **one** of the following: ::

        $ module load libs/intel-tbb/2019.3/binary
        $ module load libs/intel-tbb/2017.0/binary
        $ module load libs/intel-tbb/2016.1/binary
        $ module load libs/intel-tbb/2015.7/binary

You can find sample TBB programs **for TBB 2017.0** in the directory ``$TBB_SAMPLES``: ::

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
        Serial version ran in 3.79692 seconds
        Parallel version ran in 0.794959 seconds
        Resulting in a speedup of 4.77625

Many of the sample directories contain HTML documentation.  
To read this you need to start an :ref:`interactive graphical session <submit_batch_sharc>` (using ``qrshx`` or ``qrshx``) then run: ::

        $ firefox ~/tbb_samples/index.html
 
Tutorials
---------

See Chrys Woods' excellent tutorials for `C++ programmers
<http://chryswoods.com/parallel_c++>`_ and `Python programmers
<http://chryswoods.com/parallel_python/index.html>`_.

Licensing and availability
--------------------------

See the information on :ref:`Parallel Studio licensing
<sharc-intel-parallel-studio>`.

Installation Notes
------------------

The following notes are primarily for system administrators.

Intel TBB 2019.3
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2019
<sharc-intel-parallel-studio>`.

:download:`This modulefile 
</decommissioned/sharc/software/modulefiles/libs/intel-tbb/2019.3/binary>` was installed as
``/usr/local/modulefiles/libs/intel-tbb/2019.3/binary``.

Intel TBB 2017.0
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2017
<sharc-intel-parallel-studio>`.

:download:`This modulefile 
</decommissioned/sharc/software/modulefiles/libs/intel-tbb/2017.0/binary>` was installed as
``/usr/local/modulefiles/libs/intel-tbb/2017.0/binary``.

Intel TBB 2016.1
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2016
<sharc-intel-parallel-studio>`.

:download:`This modulefile 
</decommissioned/sharc/software/modulefiles/libs/intel-tbb/2016.1/binary>` was installed as
``/usr/local/modulefiles/libs/intel-tbb/2016.1/binary``.

Intel TBB 2015.7
^^^^^^^^^^^^^^^^

Installed as part of :ref:`Parallel Studio Composer Edition 2015.7
<sharc-intel-parallel-studio>`.

:download:`This modulefile 
</decommissioned/sharc/software/modulefiles/libs/intel-tbb/2015.7/binary>` was installed as
``/usr/local/modulefiles/libs/intel-tbb/2015.7/binary``.

