.. _sparc_sharc:

spark
=====

.. sidebar:: Spark

   :Version: 2.1
   :URL: http://spark.apache.org/

Apache Spark is a fast and general engine for large-scale data processing.

Interactive Usage
-----------------
After connecting to Sharc (see :ref:`ssh`),  start an interactive session with the :ref:`qrsh` or :ref:`qrshx` command.

Before using Spark, you will need to load a version of Java. For example ::

    module load apps/java/jdk1.8.0_102/binary

To make Spark available, use the following module command ::

    module load apps/spark/2.1.0/gcc-4.8.5

You can now start a Spark shell session with ::

    spark-shell

SparkR
------
To use SparkR, you will additionally need to load a version of R ::

    module load apps/java/jdk1.8.0_102/binary
    module load apps/spark/2.1.0/gcc-4.8.5
    module load apps/R/3.3.2/gcc-4.8.5

Now you can start a SparkR session ::

  sparkR

  R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
  Copyright (C) 2016 The R Foundation for Statistical Computing
  Platform: x86_64-pc-linux-gnu (64-bit)

  R is free software and comes with ABSOLUTELY NO WARRANTY.
  You are welcome to redistribute it under certain conditions.
  Type 'license()' or 'licence()' for distribution details.

    Natural language support but running in an English locale

  R is a collaborative project with many contributors.
  Type 'contributors()' for more information and
  'citation()' on how to cite R or R packages in publications.

  Type 'demo()' for some demos, 'help()' for on-line help, or
  'help.start()' for an HTML browser interface to help.
  Type 'q()' to quit R.

Setting the number of cores
---------------------------
The installation of Spark on Sharc is limited to jobs that make use of one node.
As such, the maximum number of CPU cores you can request for a Spark job is limited to 16 cores.

First, you must request cores from the scheduler.
That is, you add the following line to your submission script to request 4 cores ::

  #$ -pe smp 4

You must also tell Spark to only use 4 cores by setting the `MASTER` environment variable ::

  export MASTER=local[4]

A full example is given at https://github.com/mikecroucher/HPC_Examples/tree/master/languages/Python/pyspark_pi

Installation notes
------------------
These notes are primarily for administrators of the system.

Spark 2.0 was built using the system gcc 4.8.5 ::

    qrsh -l rmem=10G

    module load apps/java/jdk1.8.0_102/binary
    tar -xvzf ./spark-2.1.0.tgz
    cd spark-2.1.0

    mkdir -p /usr/local/packages/apps/spark/2.1
    cd ..
    mv spark-2.1.0 /usr/local/packages/apps/spark/2.1

The default install of Spark is incredibly verbose. Even a 'Hello World' program results in many lines of ``[INFO]``.
To make it a little quieter, the default log4j level has been reduced from ``INFO`` to ``WARN``: ::

    cd /usr/local/packages/apps/spark/2.1/spark-2.1.0/conf/
    cp log4j.properties.template log4j.properties
    
The file ``log4j.properties`` was then edited so that the line beginning ``log4j.rootCategory`` reads: ::
 
     log4j.rootCategory=WARN, console

Modulefile
----------

**Version 2.1**

The following module file is on the system at ``/usr/local/modulefiles/apps/spark/2.1.0/gcc-4.8.5`` ::

    #%Module1.0#####################################################################
    ##
    ## Spark module file
    ##

    ## Module file logging
    source /usr/local/etc/module_logging.tcl

    set sparkhome /usr/local/packages/apps/spark/2.1/spark-2.1.0

    # Use only one core. User can override this if they want
    setenv MASTER local\[1\]
    setenv SPARK_HOME $sparkhome
    prepend-path PATH $sparkhome/bin
