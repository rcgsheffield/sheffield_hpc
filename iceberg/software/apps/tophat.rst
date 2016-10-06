Tophat
======

.. sidebar:: Tophat

   :Versions: 2.1.0
   :URL: https://ccb.jhu.edu/software/tophat/index.shtml

TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with either the `qsh` or `qrsh` command.

The latest version of tophat (currently 2.1.0) is made available with the command::

        module apps/gcc/4.8.2/tophat

Alternatively, you can load a specific version with ::

        module load apps/gcc/4.8.2/tophat/2.1.0

This command makes the tophat binary available to your session.

Installation notes
------------------
Tophat 2.1.0 was installed using gcc 4.8.2. Installs were attempted using gcc 5.2 and gcc 4.4.7 but both failed (see `this issue on github <https://github.com/rcgsheffield/iceberg_software/issues/153>`_ )

This install has dependencies on the following

* :ref:`gcc` 4.8.2
* :ref:`boost` 1.58
* :ref:`bowtie2` (not needed at install time but is needed at runtime)

Install details ::

  module load compilers/gcc/4.8.2
  module load libs/gcc/4.8.2/boost/1.58

  mkdir -p /usr/local/packages6/apps/gcc/4.8.2/tophat/2.1.0

  tar -xvzf ./tophat-2.1.0.tar.gz
  cd tophat-2.1.0
  ./configure --with-boost=/usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0/ --prefix=/usr/local/packages6/apps/gcc/4.8.2/tophat/2.1.0

Configuration results ::

  -- tophat 2.1.0 Configuration Results --
  C++ compiler:        g++ -Wall -Wno-strict-aliasing -g -gdwarf-2 -Wuninitialized  -O3  -DNDEBUG -I./samtools-0.1.18 -pthread -I/usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0//include -I./SeqAn-1.3
  Linker flags:        -L./samtools-0.1.18 -L/usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0//lib
  BOOST libraries:     -lboost_thread -lboost_system
  GCC version:         gcc (GCC) 4.8.2 20140120 (Red Hat 4.8.2-15)
  Host System type:    x86_64-unknown-linux-gnu
  Install prefix:      /usr/local/packages6/apps/gcc/4.8.2/tophat/2.1.0
  Install eprefix:     ${prefix}

Built with ::

  make
  make install

Testing
-------
A test script was executed based on the documentation `on the tophat website <https://ccb.jhu.edu/software/tophat/tutorial.shtml>`_ (retrieved 29th October 2015). It only proves that the code can run without error, not that the result is correct.

* `tophat_test.sh  <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/install_scripts/apps/tophat/tests/tophat_test.sh>`_

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.8.2/tophat/2.1.0`
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/modulefiles/apps/gcc/4.8.2/tophat/2.1.0>`_.
