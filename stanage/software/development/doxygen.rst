.. _doxygen_stanage:

Doxygen
=======

.. sidebar:: Doxygen

   :Latest Version: 1.9.5
   :URL: https://www.doxygen.nl/manual/index.html

Doxygen is a tool for building documentation for source code e.g. inter-related HTML pages for C++ source code.

Usage
-----

Doxygen can be loaded with:

.. tabs::

   .. group-tab:: icelake

        .. code-block:: console

            module load Doxygen/1.9.5-GCCcore-12.2.0
            module load Doxygen/1.9.4-GCCcore-11.3.0
            module load Doxygen/1.9.1-GCCcore-11.2.0
            module load Doxygen/1.9.1-GCCcore-10.3.0
            module load Doxygen/1.8.20-GCCcore-10.2.0      

   .. group-tab:: znver3

        .. code-block:: console

           module load Doxygen/1.9.4-GCCcore-11.3.0
    

The above command also loads the relevant :ref:`GCC compiler <gcc_stanage>` version as NB Doxygen has a run-time dependency on ``libstdc++``.
