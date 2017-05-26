
spark
=====

.. sidebar:: Spark

   :Version: 2.0
   :URL: http://spark.apache.org/

Apache Spark is a fast and general engine for large-scale data processing.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :ref:`qrsh` or :ref:`qrshx` command.

To make Spark available, execute the following module command: ::

    module load apps/gcc/4.4.7/spark/2.0

Installation notes
------------------
Spark was built using the system gcc 4.4.7: ::

  tar -xvzf ./spark-2.0.0.tgz
  cd spark-2.0.0
  build/mvn -DskipTests clean package

  mkdir -p /usr/local/packages6/apps/gcc/4.4.7/spark
  mv spark-2.0.0 /usr/local/packages6/apps/gcc/4.4.7/spark/
  
<<<<<<< HEAD
The default install of Spark is incredibly verbose. Even a 'Hello World' program results in many lines of ``[INFO]``.
To make it a little quieter, reduce the default log4j level from ``INFO`` to ``WARN``: ::
=======
The default install of Spark is incredibly verbose. Even a 'Hello World' prohram results in many lines of 'INFO'. To make it a little quieter ::
>>>>>>> parent of a9ef5fb... Update spark.rst

    cd /usr/local/packages6/apps/gcc/4.4.7/spark/spark-2.0.0/conf/
    cp log4j.properties.template log4j.properties
    
Edit the file ``log4j.properties`` so that the line beginning ``log4j.rootCategory`` reads: ::
 
     log4j.rootCategory=WARN, console

Modulefile
----------
**Version 2.0**

The module file is on the system at ``/usr/local/modulefiles/apps/gcc/4.4.7/spark/2.0``

Its contents are ::

  #%Module1.0#####################################################################
  ##
  ## Spark module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl

  set sparkhome /usr/local/packages6/apps/gcc/4.4.7/spark/spark-2.0.0

  # Use only one core. User can override this if they want
  setenv MASTER local\[1\]
  setenv SPARK_HOME $sparkhome
  prepend-path PATH $sparkhome/bin
