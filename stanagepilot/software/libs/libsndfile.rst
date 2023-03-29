.. |softwarename| replace:: libsndfile
.. |currentver| replace:: 1.0.28
.. |ebtoolchain| replace:: GCCcore-10.2.0

|softwarename|
==========================================================================================================

.. sidebar:: 
    
    .. tabs::
     .. group-tab:: Stanage        
        :Version: |currentver|
        :Dependencies: |ebtoolchain| (see Easybuild for details.)
        :URL: http://www.mega-nerd.com/libsndfile/
     .. group-tab:: Bessemer        
        :Version: |currentver|
        :Dependencies: GCCcore-9.3.0 (see Easybuild for details.)
        :URL: http://www.mega-nerd.com/libsndfile/
     .. group-tab:: Sharc        
        :Version: |currentver|
        :Dependencies: gcc-4.9.4  
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
To make this library available, run the following module commands

.. tabs::

   .. group-tab:: Stanage

    .. code-block:: console

        module load libsndfile/1.0.28-GCCcore-10.2.0 
        module load libsndfile/1.0.28-GCCcore-9.3.0   

   .. group-tab:: Bessemer

    .. code-block:: console

        module load libsndfile/1.0.28-GCCcore-9.3.0   
        module load libsndfile/1.0.28-GCCcore-8.3.0

   .. group-tab:: Sharc

    .. code-block:: console

        module load libs/libsndfile/1.0.28/gcc-4.9.4    


Installation method
^^^^^^^^^^^^^^^^^^^
.. tabs::

   .. group-tab:: Stanage
    |softwarename| version 1.0.28 was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTLIBSNDFILE/easybuild`` with the module loaded.

   .. group-tab:: Bessemer
    |softwarename| was installed using easybuild 4.4.0.

   .. group-tab:: Sharc
    **Version 1.0.28**
    |softwarename| was compiled with v4.9.4 of the GCC compiler suite.

    #. Download, configure, build, test and install using :download:`this script </sharc/software/install_scripts/libs/libsndfile/1.0.28/gcc-4.9.4/install_libsndfile.sh>`. 
    #. Install :download:`this modulefile </sharc/software/modulefiles/libs/libsndfile/1.0.28/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/libsndfile/1.0.28/gcc-4.9.4``

--------

Testing
^^^^^^^

.. tabs::

   .. group-tab:: Stanage

    Testing has been conducted by running an interactive session and  compiling the example `list_formats <https://github.com/libsndfile/libsndfile/blob/master/examples/list_formats.c>`_.

    Using the command :

    .. code-block:: console

        gcc list_formats.c pkg-config --libs sndfile -o output

   .. group-tab:: Stanage

    -

   .. group-tab:: Sharc

    -


