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

There is a command line option allowing the user to run KNIME in batch mode::

        knime -application org.knime.product.KNIME_BATCH_APPLICATION -nosplash -workflowDir="<path>"

* `-application org.knime.product.KNIME_BATCH_APPLICATION` launches the KNIME batch application.
* `-nosplash` does not show the initial splash window.
* `-workflowDir="<path>"` provides the path of the directory containing the workflow.

Full list of options:

* `-nosave` do not save the workflow after execution has finished
* `-reset` reset workflow prior to execution
* `-failonloaderror` don't execute if there are errors during workflow loading
* `-updateLinks`  update meta node links to latest version
* `-credential=name[;login[;password]]` for each credential enter credential name and optional login/password
* `-masterkey[=...]`  prompt for master password (used in e.g. database nodes),if provided with argument, use argument instead of prompting
* `-preferences=...`  path to the file containing eclipse/knime preferences,
* `-workflowFile=...` ZIP file with a ready-to-execute workflow in the root of the ZIP
* `-workflowDir=...` directory with a ready-to-execute workflow
* `-destFile=...` ZIP file where the executed workflow should be written to if omitted the workflow is only saved in place
* `-destDir=...` directory where the executed workflow is saved to if omitted the workflow is only saved in place
* `-workflow.variable=name,value,type`  define or overwrite workflow variable'name' with value 'value' (possibly enclosed by quotes). The'type' must be one of "String", "int" or "double".

The following return codes are defined:

* 0 upon successful execution
* 2 if parameters are wrong or missing
* 3 when an error occurs during loading a workflow
* 4 if an error during execution occurred

Installation Notes
------------------
These notes are primarily for administrators of the system.

**Version 3.1.2 without extensions**

* Download with `wget https://download.knime.org/analytics-platform/linux/knime_3.1.2.linux.gtk.x86_64.tar.gz`
* Move to `/usr/local/extras/knime_analytics/3.1.2`
* Unzip `tar -xvzf knime_3.1.2.linux.gtk.x86_64.tar.gz`

The modulefile is at `/usr/local/extras/modulefiles/apps/knime/3.1.2`

contains ::

  #%Module1.0

  proc ModulesHelp { } {
          puts stderr " Adds KNIME to your PATH environment variable and necessary libraries"
  }

  prepend-path PATH /usr/local/extras/knime_analytics/3.1.2

**Version 3.1.2 with extensions**

* Download with `wget https://download.knime.org/analytics-platform/linux/knime-full_3.1.2.linux.gtk.x86_64.tar.gz`
* Move to `/usr/local/extras/knime_analytics/3.1.2ext`
* Unzip `tar -xvzf knime-full_3.1.2.linux.gtk.x86_64.tar.gz`

The modulefile is at `/usr/local/extras/modulefiles/apps/knime/3.1.2ext`

contains ::

  #%Module1.0

  proc ModulesHelp { } {
          puts stderr " Adds KNIME to your PATH environment variable and necessary libraries"
  }

  prepend-path PATH /usr/local/extras/knime_analytics/3.1.2ext
