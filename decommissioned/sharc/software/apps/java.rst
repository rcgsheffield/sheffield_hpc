.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _Java-sharc:

Java
====

.. sidebar:: Java

   :Latest Version: 17.0.4
   :URL: https://www.java.com/en/download/

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`), start an interactive session with the `qrsh` or `qrshx` command.

Java can be activated using one of the following module files ::

        module load apps/java/17.0.4/binary
        module load apps/java/13.0.2/binary
        module load apps/java/11.0.2/binary
        module load apps/java/jdk1.8.0_102/binary 

Check that you have the version you expect. First, the runtime ::

    $ java -version

    openjdk version "17.0.4" 2022-07-19
    OpenJDK Runtime Environment Temurin-17.0.4+8 (build 17.0.4+8)
    OpenJDK 64-Bit Server VM Temurin-17.0.4+8 (build 17.0.4+8, mixed mode, sharing)


Now, the compiler ::

    $ javac -version

    javac 17.0.4


Installation notes
------------------
These are primarily for administrators of the system.

**Java 1.8.0_102**

#. Download *Java SE Development Kit 8u102* `from Oracle <http://www.oracle.com/technetwork/java/javase/downloads>`_.  Select the tarball (``jdk-8u102-linux-x64.tar.gz``) for Linux and the *x64* CPU architecture family.
#. Save this file to ``/usr/local/media/java/1.8.0_102/``.
#. Install Java using :download:`this script </decommissioned/sharc/software/install_scripts/apps/java/jdk1.8.0_102/binary/install.sh>`.
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/apps/java/jdk1.8.0_102/binary>` as ``/usr/local/modulefiles/apps/java/jdk1.8.0_102/binary``

