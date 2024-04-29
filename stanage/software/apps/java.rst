.. _java-stanage:

Java (Temurin/OpenJDK)
======================

.. sidebar:: Java

   :Latest Version: 17.0.4
   :URL: https://adoptium.net/en-GB/temurin/releases/
   :CPU Arch availability: icelake; znver3

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

OpenJDK is an open-source implementation of Java.

Interactive Usage
-----------------

After :ref:`connecting to Stanage <connecting>`,
start an interactive session with the ``srun --pty bash -i`` command.

You can then load a version of of Java using one of the following:

.. tabs::

   .. group-tab:: icelake

        .. code-block:: console

           module load Java/11.0.2
           module load Java/11.0.16
           module load Java/11.0.20
           module load Java/17.0.4

   .. group-tab:: znver3

        .. code-block:: console

           module load Java/11.0.18
           module load Java/11.0.20

NB ``Java/11.0.2`` is `OpenJDK <https://openjdk.org/>`__;
``Java/11.0.16`` and newer are `Eclipse Temurin <https://adoptium.net/en-GB/temurin/releases/>`__, which is based on OpenJDK.


Check that you have the version you expect. First, the runtime:

.. code-block:: console
   :emphasize-lines: 1
   
   $ java -version
   openjdk version "17.0.4" 2022-07-19
   OpenJDK Runtime Environment Temurin-17.0.4+8 (build 17.0.4+8)
   OpenJDK 64-Bit Server VM Temurin-17.0.4+8 (build 17.0.4+8, mixed mode, sharing)

Now, the compiler:

.. code-block:: console
   :emphasize-lines: 1

   $ javac -version
   javac 17.0.4

Installation notes
------------------
This section is primarily for administrators of the system. Java has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTJAVA/easybuild`` with a given module loaded.
