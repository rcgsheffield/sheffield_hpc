.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _spark_sharc:

spark
=====

.. sidebar:: Spark

   :Version: 2.3.0, 2.1
   :URL: http://spark.apache.org/

Apache Spark is a fast and general engine for large-scale data processing.

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the :ref:`qrsh` or :ref:`qrshx` command.

Before using Spark, you will need to load a :ref:`version of Java <Java-sharc>`. For example: ::

    module load apps/java/jdk1.8.0_102/binary

To make a version of Spark available, use one the following commands: ::

    module load apps/spark/2.3.0/jdk-1.8.0_102
    module load apps/spark/2.1.0/gcc-4.8.5

You can now start a Spark shell session with ::

    spark-shell

SparkR
------
To use SparkR, you will additionally need to load a version of R e.g.: ::

    module load apps/java/jdk1.8.0_102/binary
    module load apps/spark/2.3.0/jdk-1.8.0_102
    module load apps/R/3.3.2/gcc-4.8.5

Now you can start a SparkR session by running: ::

    sparkR

Setting the number of cores
---------------------------
The installation of Spark on ShARC is limited to jobs that make use of one node.
As such, the maximum number of CPU cores you can request for a Spark job is (typically) 16.

First, you must request cores from the scheduler.
That is, you add the following line to your submission script to request 4 cores ::

  #$ -pe smp 4

You must also tell Spark to only use 4 cores by setting the ``MASTER`` environment variable ::

  export MASTER=local[4]

A full example using Python is given `here <https://github.com/mikecroucher/HPC_Examples/tree/master/languages/Python/pyspark_pi>`__.

.. _pyspark_sharc_jupyterhub:

Using pyspark in JupyterHub sessions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Alternative setup instructions are required when using `Pyspark <https://spark.apache.org/docs/latest/api/python/index.html>`__ with conda and :ref:`Jupyter on ShARC <jupyterhub_sge>`:

- A version of Java needs to be loaded
- Pyspark needs to be told to write temporary files to a sensible location
- Pyspark needs to be told to create an appropriate number of worker processes
  given the :ref:`number of CPU cores allocated to the job by the scheduler <jh_conn_res_req_start>`.

First, ensure you have access to a conda environment containing the ``ipykernel`` and ``pyspark`` conda packages (see :ref:`jh_conda`).

Next, add the following to a cell at the top of the Notebook you want to use pyspark with: :: 

   import os

   # Java required by Spark - ensure a version is available:
   if 'JAVA_HOME' not in os.environ:
   os.environ['JAVA_HOME'] = "/usr/local/packages/apps/java/jdk1.8.0_102/binary"

   # Tell Spark to save temporary files to a sensible place:
   if 'TMPDIR' in os.environ:
   os.environ['SPARK_LOCAL_DIRS'] = os.environ['TMPDIR']

   from pyspark import SparkConf
   from pyspark import SparkContext
   conf = SparkConf()
   conf.setAppName('conda-pyspark')

   # Create as many Spark processes as allocated CPU cores
   # (assuming all cores allocated on one node):
   if 'NSLOTS' in os.environ:
   conf.setMaster("local[{}]".format(os.environ['NSLOTS']))

   # Finally, create our Spark context
   sc = SparkContext(conf=conf)

   # Verify how many processes Spark will create/use
   print(sc.defaultParallelism)

It may be possible to install/use Java using conda but this has not been tested.

Installation notes
------------------
These notes are primarily for administrators of the system.

Spark 2.3.0
^^^^^^^^^^^

* Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/apps/spark/2.3.0/jdk-1.8.0_102/install.sh>`
* Module file :download:`apps/spark/2.3.0/jdk-1.8.0_102 </decommissioned/sharc/software/modulefiles/apps/spark/2.3.0/jdk-1.8.0_102>`,
  which 

  * sets ``SPARK_HOME``
  * prepends the Spark ``bin`` directory to the ``PATH``
  * sets ``MASTER`` to ``local\[1\]`` (i.e. Spark will default to using 1 core)

Spark 2.1
^^^^^^^^^

.. code-block:: sh

   qrsh -l rmem=10G

   module load apps/java/jdk1.8.0_102/binary
   tar -xvzf ./spark-2.1.0.tgz
   cd spark-2.1.0
   ./build/mvn -DskipTests clean package

   mkdir -p /usr/local/packages/apps/spark/2.1
   cd ..
   mv spark-2.1.0 /usr/local/packages/apps/spark/2.1

The default install of Spark is incredibly verbose. Even a 'Hello World' program results in many lines of ``[INFO]``.
To make it a little quieter, the default log4j level has been reduced from ``INFO`` to ``WARN``: ::

    cd /usr/local/packages/apps/spark/2.1/spark-2.1.0/conf/
    cp log4j.properties.template log4j.properties
    
The file ``log4j.properties`` was then edited so that the line beginning ``log4j.rootCategory`` reads: ::
 
     log4j.rootCategory=WARN, console
     
Module file :download:`apps/spark/2.1/gcc-4.8.5 </decommissioned/sharc/software/modulefiles/apps/spark/2.1/gcc-4.8.5>`,
which 

* sets ``SPARK_HOME``
* prepends the Spark ``bin`` directory to the ``PATH``
* sets ``MASTER`` to ``local\[1\]`` (i.e. Spark will default to using 1 core)


