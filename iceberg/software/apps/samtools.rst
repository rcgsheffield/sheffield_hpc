Samtools
========

.. sidebar:: Samtools

   :Versions:  1.2
   :URL: http://samtools.sourceforge.net/

SAM (Sequence Alignment/Map) format is a generic format for storing large nucleotide sequence alignments

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

The latest version of Samtools (currently 1.2) is made available with the command

.. code-block:: none

        module load apps/gcc/5.2/samtools

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/samtools/1.2

This command makes the samtools binary directory available to your session.

Documentation
-------------
Once you have made samtools available to the system using the `module` command above, you can read the man pages by typing ::

    man samtools

Installation notes
------------------
Samtools was installed using gcc 5.2 ::

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

Testing
-------
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

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/samtools/1.2`
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/5.2/samtools/1.2>`_.
