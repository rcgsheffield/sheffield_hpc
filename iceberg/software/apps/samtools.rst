Samtools
========

.. sidebar:: Samtools

   :Versions:  1.3.1 1.2
   :URL: http://samtools.sourceforge.net/

SAM (Sequence Alignment/Map) format is a generic format for storing large nucleotide sequence alignments.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

Next, load a specific version of Samtools with one of the following::

    module load apps/gcc/6.2/samtools/1.3.1
    module load apps/gcc/5.2/samtools/1.2

This command makes the Samtools binary directory available to your session.

Documentation
-------------
Once you have made Samtools available to the system using the ``module`` command above, you can read the man pages by typing ::

    man samtools

Installation notes
------------------

This section is primarily for system administrators.

**Version 1.3.1**

`This install script <https://github.com/rcgsheffield/sheffield_hpc/blob/master/iceberg/software/install_scripts/apps/samtools/install_samtools_1.3.1.sh>`_:

#. Built Samtools plus the bundled **HTSlib**, **HTSlib utilities** such as ``bgzip`` plus various useful plugins.  Compiled using `GCC <gcc_iceberg>`_ 6.2.
#. Ran all tests using ``make tests``; a summary of the results is shown below; for full results see ``/usr/local/packages6/apps/gcc/6.2/samtools/1.3.1/tests.log`` ::

        Number of tests:
            total            .. 423
            passed           .. 403
            failed           .. 0
            expected failure .. 20
            unexpected pass  .. 0

        test/merge/test_bam_translate test/merge/test_bam_translate.tmp
        test/merge/test_rtrans_build
        test/merge/test_trans_tbl_init
        cd test/mpileup && ./regression.sh mpileup.reg

        === Testing mpileup.reg regressions ===


        Expected   passes:   124
        Unexpected passes:   0
        Expected   failures: 0
        Unexpected failures: 0
        => PASS
        cd test/mpileup && ./regression.sh depth.reg

        === Testing depth.reg regressions ===

        Expected   passes:   14
        Unexpected passes:   0
        Expected   failures: 0
        Unexpected failures: 0
        => PASS

#. Installed Samtools to ``/usr/local/packages6/apps/gcc/6.2/samtools/1.3.1``
#. Installed `this modulefile <https://github.com/rcgsheffield/sheffield_hpc/blob/master/iceberg/software/modulefiles/apps/gcc/6.2/samtools/1.3.1>`__ as ``/usr/local/modulefiles/apps/gcc/6.2/samtools/1.3.1``

**Version 1.2**

Installed using `gcc 5.2 <gcc_iceberg>`_ ::

    module load compilers/gcc/5.2

    tar -xvjf ./samtools-1.2.tar.bz2
    cd samtools-1.2
    mkdir -p /usr/local/packages6/apps/gcc/5.2/samtools/1.2
    make prefix=/usr/local/packages6/apps/gcc/5.2/samtools/1.2
    make prefix=/usr/local/packages6/apps/gcc/5.2/samtools/1.2 install
    #tabix and bgzip are not installed by the above procedure.
    #We can get them by doing the following
    cd htslib-1.2.1/
    make
    mv ./tabix /usr/local/packages6/apps/gcc/5.2/samtools/1.2/bin/
    mv ./bgzip /usr/local/packages6/apps/gcc/5.2/samtools/1.2/bin/

The test suite was run with ::

    make test 2>&1 | tee make_tests.log

The summary of the test output was ::

    Test output:
    Number of tests:
        total            .. 368
        passed           .. 336
        failed           .. 0
        expected failure .. 32
        unexpected pass  .. 0

    test/merge/test_bam_translate test/merge/test_bam_translate.tmp
    test/merge/test_pretty_header
    test/merge/test_rtrans_build
    test/merge/test_trans_tbl_init
    cd test/mpileup && ./regression.sh
    Samtools mpileup tests:

    EXPECTED FAIL: Task failed, but expected to fail;
    when running $samtools mpileup -x -d 8500 -B -f mpileup.ref.fa deep.sam|awk '{print $4}'

    Expected   passes:   123
    Unexpected passes:   0
    Expected   failures: 1
    Unexpected failures: 0

The full log is on the system at `/usr/local/packages6/apps/gcc/5.2/samtools/1.2/make_tests.log`

`This modulefile <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/5.2/samtools/1.2>`__ was installed as ``/usr/local/modulefiles/apps/gcc/5.2/samtools/1.2``
