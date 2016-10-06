bitseq
======

.. sidebar:: bitseq

   :Versions:  0.7.5
   :URL: http://bitseq.github.io/

Transcript isoform level expression and differential expression estimation for RNA-seq

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qrsh` command ::

        module load apps/gcc/5.2/bitseq

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/bitseq/0.7.5

This command adds the BitSeq binaries to your PATH.

Documentation
-------------
Documentation is available online http://bitseq.github.io/howto/index

Installation notes
------------------
BitSeq was installed using gcc 5.2 ::

  module load compilers/gcc/5.2
  tar -xvzf ./BitSeq-0.7.5.tar.gz
  cd BitSeq-0.7.5

  make
  cd ..
  mkdir -p /usr/local/packages6/apps/gcc/5.2/bitseq
  mv ./BitSeq-0.7.5 /usr/local/packages6/apps/gcc/5.2/bitseq/

Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bitseq/0.7.5`. It's contents ::

    #%Module1.0#####################################################################
    ##
    ## bitseq 0.7.5 modulefile
    ##

    ## Module file logging
    source /usr/local/etc/module_logging.tcl
    ##

    module load compilers/gcc/5.2


    proc ModulesHelp { } {
            puts stderr "Makes bitseq 0.7.5 available"
    }

    set version 0.7.5
    set BITSEQ_DIR /usr/local/packages6/apps/gcc/5.2/bitseq/BitSeq-$version

    module-whatis   "Makes bitseq 0.7.5 available"

    prepend-path PATH $BITSEQ_DIR
