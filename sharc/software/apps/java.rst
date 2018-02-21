.. _Java-sharc:

Java
====

.. sidebar:: Java

   :Latest Version: 1.8.0_102
   :URL: https://www.java.com/en/download/

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`), start an interactive session with the `qrsh` or `qrshx` command.

The default version of Java (which is also the most recent version; currently 1.8.0_102) is made available with the command ::

        module load apps/java

Alternatively, you can explicitly load this version using::

       module load apps/java/jdk1.8.0_102/binary

Explicitly loading a version will become more useful once multiple versions of Java are installed on this system.

Check that you have the version you expect. First, the runtime ::

    $ java -version

    java version "1.8.0_102"
    Java(TM) SE Runtime Environment (build 1.8.0_102-b14)
    Java HotSpot(TM) 64-Bit Server VM (build 25.102-b14, mixed mode)

Now, the compiler ::

    $ javac -version

    javac 1.8.0_102


Installation notes
------------------
These are primarily for administrators of the system.

**Java 1.8.0_102**

#. Download *Java SE Development Kit 8u102* `from Oracle <http://www.oracle.com/technetwork/java/javase/downloads>`_.  Select the tarball (``jdk-8u102-linux-x64.tar.gz``) for Linux and the *x64* CPU architecture family.
#. Save this file to ``/usr/local/media/java/1.8.0_102/``.
#. Install Java using :download:`this script </sharc/software/install_scripts/apps/java/jdk1.8.0_102/binary/install.sh>`.
#. Install :download:`this modulefile </sharc/software/modulefiles/apps/java/jdk1.8.0_102/binary>` as ``/usr/local/modulefiles/apps/java/jdk1.8.0_102/binary``
