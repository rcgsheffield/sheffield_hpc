Maven
=====

.. sidebar:: Maven

   :Versions:  3.6.3
   :Dependencies: Java/11.0.2
   :URL: https://maven.apache.org/

Apache Maven is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.

Interactive usage
-----------------
After connecting to Bessemer (see :ref:`ssh`),  start an interactive session with the :code:`srun --pty bash -i` command.

The latest version of Maven (currently version 3.6.3) is made available with the commands:

.. code-block:: none

        module load Maven/3.6.3
	module load Java/11.0.2


After this any of the Maven commands can be run from the prompt. The available commands can be obtained using:

.. code-block:: none

	mvn --help



Installation notes
------------------
Maven was installed using Easybuild 4.3.4, build details can be found in ``/usr/local/packages/live/eb/Maven/3.6.3/easybuild/``


Modulefile
----------
The module file is on the system at :download:`/usr/local/modulefiles/live/eb/all/Maven/3.6.3 </bessemer/software/modulefiles/Maven/3.6.3>`.
