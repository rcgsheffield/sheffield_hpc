.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _libsndfile_sharc:

libsndfile
==========

.. sidebar:: libsndfile

   :Version: 1.0.28
   :URL: http://www.mega-nerd.com/libsndfile/

Libsndfile is a C library for reading and writing files containing sampled sound
(such as MS Windows WAV and the Apple/SGI AIFF format)
through one standard library interface.
It is released in source code format under the GNU Lesser General Public License (GPL). 

It was designed to handle both little-endian (such as WAV) and big-endian (such as AIFF) data,
and to compile and run correctly on little-endian (such as Intel and DEC/Compaq Alpha) processor systems
as well as big-endian processor systems

libsndfile has the following main features:

* Ability to read and write a large number of file formats.
* A simple, elegant and easy to use Applications Programming Interface.
* Usable on Unix, Win32, MacOS and others.
* On the fly format conversion, including endian-ness swapping, type conversion and bitwidth scaling.
* Optional normalisation when reading floating point data from files containing integer data.
* Ability to open files in read/write mode.
* The ability to write the file header without closing the file (only on files open for write or read/write).
* Ability to query the library about all supported formats and retrieve text strings describing each format. 

Usage
-----
To make this library available, run the following module commands

.. code-block:: sh

   module load libs/libsndfile/1.0.28/gcc-4.9.4 

This also activates version 4.9.4 of the GCC compiler suite.

Installation notes
------------------
This section is primarily for administrators of the system.

**Version 1.0.28**

Libsndfile was compiled with v4.9.4 of the GCC compiler suite.

#. Download, configure, build, test and install using :download:`this script </decommissioned/sharc/software/install_scripts/libs/libsndfile/1.0.28/gcc-4.9.4/install_libsndfile.sh>`. 
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/libsndfile/1.0.28/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/libsndfile/1.0.28/gcc-4.9.4``

