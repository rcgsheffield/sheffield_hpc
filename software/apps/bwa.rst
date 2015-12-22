.. index::
    single: bwa

bwa
===

.. sidebar:: bwa

   :Versions:  0.7.12
   :URL: http://bio-bwa.sourceforge.net/

BWA (Burrows-Wheeler Aligner) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM and BWA-SW share similar features such as long-read support and split alignment, but BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` command.

The latest version of bwa (currently 0.7.12) is made available with the command

.. code-block:: none

        module load apps/gcc/5.2/bwa

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/bwa/0.7.12

This command makes the bwa binary available to your session.

Documentation
-------------
Once you have made bwa available to the system using the `module` command above, you can read the man pages by typing ::

    man bwa

Installation notes
------------------
bwa was installed using gcc 5.2 ::

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


Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/bwa/0.7.12`
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/5.2/bwa/0.7.12>`_.
