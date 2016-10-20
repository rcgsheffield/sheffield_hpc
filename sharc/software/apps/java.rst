.. _Java-sharc:

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
Those who have used Java on iceberg will be aware that Java's default settings regarding memory usage were changed to prevent it from requesting lots of *virtual memory* at startup (which often exceeded the user's virtual memory limit set by the scheduler, causing his/her job to fail).  

On ShARC, Java's memory usage settings do not need to be changed from their defaults as ShARC's scheduler only monitors and manages *real memory* and not virtual memory, and Java's initial real memory requirements are more modest.  See :ref:`real-vs-virt-mem` for explanations of real and virtual memory.

Installation notes
------------------
These are primarily for administrators of the system.

**Java 1.8.0_102**

1. Download *Java SE Development Kit 8u102* `from Oracle <http://www.oracle.com/technetwork/java/javase/downloads>`_.  Select the tarball (:code:`jdk-8u102-linux-x64.tar.gz`) for Linux and the *x64* CPU architecture family.
2. Save this file to :code:`/usr/local/media/java/1.8.0_102/`.
3. Install Java using the `install_java_1.8.0_102.sh <https://github.com/mikecroucher/HPC_Installers/apps/java/jdk1.8.0_102/sheffield/sharc/install_java_1.8.0_102.sh>`_ script. 
4. Install `this modulefile <https://github.com/mikecroucher/HPC_Installers/apps/java/jdk1.8.0_102/sheffield/sharc/binary>`_ as :code:`/usr/local/modulefiles/apps/java/jdk1.8.0_102/binary`
