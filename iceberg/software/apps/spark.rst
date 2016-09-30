spark
=====

.. sidebar:: Spark

   :Version: 2.0
   :URL: http://spark.apache.org/

Apache Spark is a fast and general engine for large-scale data processing.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrsh` or :ref:`qrshx` command.

To make Spark available, execute the following module command ::

    module load apps/gcc/4.4.7/spark/2.0

Installation notes
------------------
Spark was built using the system gcc 4.4.7 ::

  tar -xvzf ./spark-2.0.0.tgz
  cd spark-2.0.0
  build/mvn -DskipTests clean package

  mkdir /usr/local/packages6/apps/gcc/4.4.7/spark
  mv spark-2.0.0 /usr/local/packages6/apps/gcc/4.4.7/spark/

Modulefile
----------
**Version 2.0**

* The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/spark/2.0`

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## Spark module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  # Use only one core. User can override this if they want
  setenv MASTER local\[1\]
  prepend-path PATH /usr/local/packages6/apps/gcc/4.4.7/spark/spark-2.0.0/bin
