.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Maven
=====

.. sidebar:: Maven

   :Versions:  3.8.4
   :Dependencies: Java JDK/1.8.0
   :URL: https://maven.apache.org/

Apache Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), 
Maven can manage a project's build, reporting and documentation from a central piece of information.

Interactive usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive session with the :code:`qrshx` command.

The latest version of Maven (currently version 3.8.4) is made available with the commands:

.. code-block:: none

        module load apps/maven/3.8.4/binary

After this any of the Maven commands can be run from the prompt. The available commands can be obtained using:

.. code-block:: none

	mvn --help


Installation notes
------------------

Maven was installed from a binary download in ``/usr/local/packages/apps/maven/3.8.4/binary``


Modulefile
----------

The module file is on the system at :download:`/usr/local/modulefiles/apps/maven/3.8.4/binary </decommissioned/sharc/software/modulefiles/apps/maven/3.8.4/binary>`.

