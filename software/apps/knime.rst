Knime
=====

.. sidebar:: Knime

   :URL: https://www.knime.org
   :Documentation: http://tech.knime.org/documentation

KNIME Analytics Platform is an open solution for data-driven innovation, helping you discover the potential hidden in your data, mine for fresh insights, or predict new futures.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qrshx` command.

The latest version of Knime including all of the extensions can be loaded with ::

        module load apps/knime

Alternatively, you can load a specific version of Knime excluding all of the extensions using one of the following ::

        module load apps/knime/3.1.2

With extensions ::

        module load apps/knime/3.1.2ext

Knime can then be run with ::

        $ knime

Batch usage
-----------


Installation Notes
------------------
These notes are primarily for administrators of the system.

**Version 3.1.2 without extensions**

* Download from https://www.knime.org/downloads/overview
* Unzip to `/usr/local/extras/knime`


The modulefile is at `/usr/local/extras/modulefiles/apps/knime`

contains ::

  #%Module1.0

  proc ModulesHelp { } {
          puts stderr " Adds KNIME to your PATH environment variable and necessary libraries"
  }

  prepend-path PATH /usr/local/extras/knime

  **version 3.1.2 with extensions**

  ::

       wget https://download.knime.org/analytics-platform/linux/knime-full_3.1.2.linux.gtk.x86_64.tar.gz
       tar -xvzf knime-full_3.1.2.linux.gtk.x86_64.tar.gz
