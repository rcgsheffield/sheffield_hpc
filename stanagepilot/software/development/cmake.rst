.. _cmake_stanage:

CMake
=====

CMake is a build tool commonly used when compiling other libraries.

Usage
-----

CMake can be loaded with one of: ::

   
   module load CMake/3.9.1-GCCcore-6.4.0   # compatible with foss-2018a toolchain
   module load CMake/3.11.4-GCCcore-7.3.0  # compatible with foss-2019b toolchain  
   module load CMake/3.15.3-GCCcore-8.3.0  # compatible with foss-2019b toolchain
   module load CMake/3.16.4-GCCcore-9.3.0  # compatible with foss-2021a toolchain   
   module load CMake/3.18.4-GCCcore-10.2.0 # compatible with foss-2021a toolchain
   module load CMake/3.20.1-GCCcore-10.3.0 # compatible with foss-2021b toolchain
   module load CMake/3.21.1-GCCcore-11.2.0 # compatible with foss-2022a toolchain
   module load CMake/3.22.1-GCCcore-11.2.0 # compatible with foss-2022a toolchain
   module load CMake/3.23.1-GCCcore-11.3.0 # compatible with foss-2022b toolchain
   module load CMake/3.24.3-GCCcore-12.2.0 # compatible with foss-2022b toolchain
  
CMake has a run-time dependency on ``libstdc++`` so
the cmake module files depend on and load particular versions of the :ref:`GCC compiler <gcc_stanage>`,
plus versions of the ncurses, zlib, bzip2 and cURL libraries.

Usage of CMake often involves: 

1. Creating and ``cd``-ing into a dedicated build directory within a source tree then
2. Running something like ``cmake -DSOME_OPTION -DANOTHER_OPTION ..``
