.. _java-bessemer:

Java (OpenJDK)
==============

.. sidebar:: Java

   :Latest Version: 11.0.2
   :URL: https://openjdk.java.net/

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

OpenJDK is an open-source implementation of Java.

Interactive Usage
-----------------

After :ref:`connecting to Bessemer <connecting>`,
start :ref:`an interactive session <submit_interactive_bessemer>`.

You can then load a version of of Java using one of the following: ::

   module load Java/11
   module load Java/11.0.2

Check that you have the version you expect. First, the runtime ::

   $ java -version
   openjdk version "11.0.2" 2019-01-15
   OpenJDK Runtime Environment 18.9 (build 11.0.2+9)
   OpenJDK 64-Bit Server VM 18.9 (build 11.0.2+9, mixed mode)

Now, the compiler ::

   $ javac -version
   javac 11.0.2

Installation notes
------------------
* 11: Installed using the unmodified `Java-11.eb` easyconfig provided with EasyBuild 4.1.0.
