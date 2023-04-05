.. _hdf5_stanage:

HDF5
====

.. sidebar:: HDF5

   :URL: https://www.hdfgroup.org/solutions/hdf5/

"HDF5 is a data model, library, and file format for storing and managing data. It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data. HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5. The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format."

Usage
-----

To load this library plus
the :ref:`gompi or iimpi toolchain<stanage_eb_toolchains>`
(and the zlib and Szip libraries)
run *one* of the following: ::
   
   module load HDF5/1.10.5-gompi-2019b
   module load HDF5/1.10.6-gompi-2020a
   module load HDF5/1.10.6-iimpi-2020a
   module load HDF5/1.10.7-gompi-2020b
   module load HDF5/1.12.1-gompi-2021b
   module load HDF5/1.12.2-gompi-2022a
   module load HDF5/1.13.3-gompi-2022a

Installation notes
------------------

This section is primarily for administrators of the system. HDF5 has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBROOTHDF5/easybuild`` with a given module loaded.

