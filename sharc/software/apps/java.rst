.. _Java:

Java
====

.. sidebar:: Java

   :Latest Version: 1.8.0_102
   :URL: https://www.java.com/en/download/

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`), start an interactive session with the `qrsh` or `qsh` command.

The default version of Java (which is also the most recent version; currently 1.8.0_102) is made available with the command ::

        module load apps/java

Alternatively, you can explicitly load this version using::

       module load apps/java/1.8.0_102/binary

Explicitly loading a version will become more useful once multiple versions of Java are installed on this system.

Check that you have the version you expect. First, the runtime ::

    $ java -version

    java version "1.8.0_102"
    Java(TM) SE Runtime Environment (build 1.8.0_102-b14)
    Java HotSpot(TM) 64-Bit Server VM (build 25.102-b14, mixed mode)

Now, the compiler ::

    $ javac -version

    javac 1.8.0_102

Virtual Memory
--------------
Those who have used Java on iceberg will be aware that 
By default, Java requests a lot of virtual memory on startup. This is usually a given fraction of the physical memory on a node, which can be quite a lot on Iceberg. This then exceeds a user's virtual memory limit set by the scheduler and causes a job to fail.

To fix this, we have created a wrapper script to Java that uses the `-Xmx1G` switch to force Java to only request one Gigabyte of memory for its heap size. If this is insufficient, you are free to allocate as much memory as you require but be sure to request enough from the scheduler as well. You'll typically need to request more virtual memory from the scheduler than you specify in the Java `-Xmx` switch.

For example, consider the following submission script. Note that it was necessary to request 9 Gigabytes of memory from the scheduler even though we only allocated 5 Gigabytes heap size in Java. The requirement for 9 gigabytes was determined empirically  ::

  #!/bin/bash
  #Request 9 gigabytes of real memory from the scheduler (mem)
  #and 9 gigabytes of virtual memory from the scheduler (mem)
  #$ -l mem=9G -l rmem=9G

  # load the Java module
  module load apps/java/1.8u71

  #Run java program allocating 5 Gigabytes
  java -Xmx5G HelloWorld

Installation notes
------------------
These are primarily for administrators of the system.

**Java 1.8.0_102**

1. Download *Java SE Development Kit 8u102* `from Oracle <http://www.oracle.com/technetwork/java/javase/downloads>`_.  Select the tarball (:code:`jdk-8u102-linux-x64.tar.gz`) for Linux and the *x64* CPU architecture family.
2. Save this file to :code:`/usr/local/media/java/1.8.0_102/`.
3. Install Java using the `install_java_1.8.0_102.sh <https://github.com/mikecroucher/HPC_Installers/apps/java/jdk1.8.0_102/sheffield/sharc/install_java_1.8.0_102.sh>`_ script. 
4. Install `this modulefile <https://github.com/mikecroucher/HPC_Installers/apps/java/jdk1.8.0_102/sheffield/sharc/binary>`_ as :code:`/usr/local/modulefiles/apps/java/jdk1.8.0_102/binary 
* Java   
