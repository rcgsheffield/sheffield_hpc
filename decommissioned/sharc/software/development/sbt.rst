.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

sbt
===

.. sidebar:: sbt

   :Versions:  0.13.13
   :URL: https://www.scala-sbt.org/

sbt is a build tool for Scala, Java, and more.

Interactive Usage
-----------------

After :ref:`connecting to the cluster <connecting>`, 
:ref:`start an interactive session <submit_batch_sharc>`.

Load a particular version of sbt using: ::

   module load dev/sbt/0.13.13

This makes the `sbt` command available to your session.

You will also need to load a version of Java. For example ::

   module load apps/java/jdk1.8.0_102/binary

Installation notes
------------------

These are primarily for administrators of the system.

sbt 0.13.13 was installed as follows ::

   cp /usr/local/media/sbt/sbt-0.13.13.tgz .
   tar -xvzf ./sbt-0.13.13.tgz
   cd sbt-launcher-packaging-0.13.13/
   mkdir -p /usr/local/packages/dev/sbt/0.13.13
   mv ./* /usr/local/packages/dev/sbt/0.13.13

Installation Media
------------------

* The install tarball is on the system at ``/usr/local/media/sbt/sbt-0.13.13.tgz``

Module files
------------

* The module file is on the system at ``/usr/local/modulefiles/dev/sbt/0.13.13``
* On github: :download:`0.13.13 </decommissioned/sharc/software/modulefiles/dev/sbt/0.13.13>`.

