bwa
===

.. sidebar:: bwa

   :Versions:  0.7.12
   :URL: http://bio-bwa.sourceforge.net/

BWA (Burrows-Wheeler Aligner) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM and BWA-SW share similar features such as long-read support and split alignment, but BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` command.

The latest version of bwa (currently 0.7.12) is made available with the command

.. code-block:: none

        module load apps/gcc/5.2/bwa

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/bwa/0.7.12
        module load apps/gcc/5.2/bwa/0.7.5a

This command makes the bwa binary available to your session.

Documentation
-------------
Once you have made bwa available to the system using the `module` command above, you can read the man pages by typing ::

    man bwa

Installation notes
------------------
**bwa 0.7.12**

bwa 0.7.12 was installed using gcc 5.2 ::

    module load compilers/gcc/5.2

    #build
    module load compilers/gcc/5.2
    tar -xvjf ./bwa-0.7.12.tar.bz2
    cd bwa-0.7.12
    make

    #Sort out manfile
    mkdir -p share/man/man1
    mv bwa.1 ./share/man/man1/

    #Install
    mkdir -p /usr/local/packages6/apps/gcc/5.2/bwa/
    cd ..
    mv bwa-0.7.12 /usr/local/packages6/apps/gcc/5.2/bwa/0.7.12/

**bwa 0.7.5a**

bwa 0.7.5a was installed using gcc 5.2 ::

  module load compilers/gcc/5.2

  #build
  module load compilers/gcc/5.2
  tar -xvjf bwa-0.7.5a.tar.bz2
  cd bwa-0.7.5a
  make

  #Sort out manfile
  mkdir -p share/man/man1
  mv bwa.1 ./share/man/man1/

  #Install
  mkdir -p /usr/local/packages6/apps/gcc/5.2/bwa/
  cd ..
  mv bwa-0.7.5a /usr/local/packages6/apps/gcc/5.2/bwa/

Testing
-------
No test suite was found.

Module files
------------
The default version is controlled by the `.version` file at `/usr/local/modulefiles/apps/gcc/5.2/bwa/.version` ::

  #%Module1.0#####################################################################
  ##
  ## version file for bwa
  ##
  set ModulesVersion  "0.7.12"

*Version 0.7.12*

* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bwa/0.7.12`
* On github: `0.7.12 <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/5.2/bwa/0.7.12>`_.

*Version 0.7.5a*

* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bwa/0.7.5a`
* On github: `0.7.5a <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/5.2/bwa/0.7.5a>`_.
