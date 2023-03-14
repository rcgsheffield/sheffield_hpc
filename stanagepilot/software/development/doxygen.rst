.. _doxygen_stanage:

Doxygen
=======

Doxygen is a tool for building documentation for source code e.g. inter-related HTML pages for C++ source code.

Usage
-----

Doxygen can be loaded with: ::

    module load Doxygen/1.8.17-GCCcore-9.3.0
    module load Doxygen/1.8.20-GCCcore-10.2.0
    module load Doxygen/1.9.1-GCCcore-11.2.0
    module load Doxygen/1.9.4-GCCcore-11.3.0

NB Doxygen has a run-time dependency on ``libstdc++`` so the above also needs to
(and does) load the relevant :ref:`GCC compiler <gcc_stanage>` version.
