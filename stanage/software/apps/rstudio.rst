.. _julia_stanage:

.. |softwarename| replace:: RStudio
.. |currentver| replace:: 2023.12.0-369

|softwarename|
==============

.. sidebar:: |softwarename|

   :Versions:   |currentver|
   :URL: https://posit.co/products/open-source/rstudio/

The RStudio integrated development environment (IDE) is a set of tools built to help you be more productive with R and Python. 

Interactive Usage
-----------------
To use RStudio you will need to be in a :ref:`flight graphical session on Stanage <flight-desktop>`.

In your flight session open a terminal and load the R and Rstudio modules

.. code-block:: bash

    module load R/4.2.1-foss-2022a 
    module load rstudio/2023.12.0-369-x86_64-fedora

Once you have loaded the modules you can launch the RStudio IDE by running the following command:

.. code-block:: bash

    rstudio --no-sandbox


Installation Notes
------------------

|softwarename| version 2023.12.0-369 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Was installed using Easybuild 4.8.1, build details can be found 
in ``$EBROOTRSTUDIO/easybuild`` with the module loaded.

I created the following easy config. (Hasn't been pushed to the EB community yet)

.. code-block:: bash

        easyblock = 'Tarball'

        name = 'rstudio'
        version = "2023.12.0-369-x86_64-fedora"

        homepage = 'https://posit.co'
        description = """RStudio is an integrated development environment (IDE) for R and Python."""

        toolchain = SYSTEM

        source_urls = ['https://download1.rstudio.org/electron/centos7/x86_64/']
        sources = ['rstudio-%(version)s.tar.gz']
        checksums = ['8235b74bb564332788e2adcba95e23e9acd6c387cb42305b885da92e680760b6']

        modextrapaths = {
            'PATH': '',
                'LIBRARY_PATH': '',
                'LD_LIBRARY_PATH': '',
        }

        sanity_check_paths = {
            'files': ["rstudio"],
            'dirs': [],
        }

        moduleclass = 'devel'



--------

Testing
^^^^^^^

Testing has been conducted by running an interactive session and running some of the examples found `here. <https://moderndive.netlify.app/1-getting-started.html>`