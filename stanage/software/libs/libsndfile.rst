.. _libsndfile_stanage:

.. |softwarename| replace:: libsndfile
.. |currentver| replace:: 1.0.28
.. |ebtoolchain| replace:: GCCcore-10.2.0

|softwarename|
==========================================================================================================

.. sidebar:: 
       
    :Version: |currentver|
    :Dependencies: |ebtoolchain| (see Easybuild for details.)
    :URL: http://www.mega-nerd.com/libsndfile/
    
|softwarename| is a C library for reading and writing files containing sampled sound
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
To make this library available, run one of the following module commands:

.. code-block:: 

    module load libsndfile/1.0.28-GCCcore-9.3.0
    module load libsndfile/1.0.28-GCCcore-10.2.0
    module load libsndfile/1.0.31-GCCcore-11.2.0
    module load libsndfile/1.1.0-GCCcore-11.3.0
    module load libsndfile/1.2.0-GCCcore-12.2.0


Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 1.0.28 was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTLIBSNDFILE/easybuild`` with the module loaded.

--------

Testing
^^^^^^^

Testing has been conducted by running an interactive session and  compiling the example `list_formats <https://github.com/libsndfile/libsndfile/blob/master/examples/list_formats.c>`_.
Using the command :

.. code-block:: 

    gcc list_formats.c `pkg-config --libs sndfile` -o output