libunistring
============

.. sidebar:: libunistring
    
    .. tabs::
     .. group-tab:: Stanage
        :Versions: 0.9.10, 1.0
        :Documentation:  http://www.gnu.org/software/libunistring/

     .. group-tab:: Bessemer
        :Versions: None installed on bessemer
        :Documentation:  http://www.gnu.org/software/libunistring/

     .. group-tab:: Sharc
        :Versions: 0.9.7, 0.9.10, 1.1
        :Documentation:  http://www.gnu.org/software/libunistring/


Text files are nowadays usually encoded in Unicode, and may consist of very
different scripts - from Latin letters to Chinese Hanzi, with many kinds of
special characters: accents, right-to-left writing marks, hyphens, Roman
numbers, and much more. But the POSIX platform APIs for text do not contain
adequate functions for dealing with particular properties of many Unicode
characters. In fact, the POSIX APIs for text have several assumptions at their
base which don’t hold for Unicode text.

This library provides functions for manipulating Unicode strings and for
manipulating C strings according to the Unicode standard.

Usage
-----
To make the library available, run one of the following: 

.. tabs:: 

   .. group-tab:: Stanage

    .. code-block:: console
         
      module load libunistring/0.9.10-foss-2019b
      module load libunistring/0.9.10-GCCcore-10.3.0                     
      module load libunistring/1.0-GCCcore-11.3.0  

   .. group-tab:: Bessemer

    .. code-block:: console  
                              
      Currently not installed in bessemer.

   .. group-tab:: Sharc

    .. code-block:: console

      module load libs/libunistring/0.9.7/gcc-4.9.4
      module load libs/libunistring/0.9.10/gcc-8.2-cmake-3.17.1

This correctly populates the environment variables ``LD_LIBRARY_PATH``, ``LIBRARY_PATH`` and ``CPATH``.

Installation Notes
------------------
This section is primarily for administrators of the system.

.. tabs::

   .. group-tab:: Stanage
      
        GnuMP was installed using Easybuild 4.7.0, build details can be found in $EBROOTGMP/easybuild with the module loaded.

   .. group-tab:: Bessemer
    
        Currently not installed in live.

   .. group-tab:: Sharc
    

        **Version 0.9.10**

        This build was installed as a dependency of `boost_sharc` (build using the same C++ standard library); Boost in turn was installed as a dependency of Caffe.

        #. Download, configure, build, test and install using :download:`this script </sharc/software/install_scripts/libs/libunistring/0.9.10/gcc-8.2-cmake-3.17.1/install_script.sge>`
        #. Check the console output of the install process to check that no tests have errored/failed.
        #. Install :download:`this modulefile </sharc/software/modulefiles/libs/libunistring/0.9.10/gcc-8.2-cmake-3.17.1>` as ``/usr/local/modulefiles/libs/libunistring/0.9.10/gcc-8.2-cmake-3.17.1``


        **Version 0.9.7**

        This build was installed as a dependency of `boost_sharc` (build using the same C++ standard library); Boost in turn was installed as a dependency of Caffe.

        #. Download, configure, build, test and install using :download:`this script </sharc/software/install_scripts/libs/libunistring/0.9.7/gcc-4.9.4/install.sh>`
        #. Check the console output of the install process to check that no tests have errored/failed: ``TOTAL: 499 / PASS: 489 / SKIP: 10``
        #. Install :download:`this modulefile </sharc/software/modulefiles/libs/libunistring/0.9.7/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/libunistring/0.9.7/gcc-4.9.4``


Testing
-------

.. tabs::

   .. group-tab:: Stanage

        Test done through importing the headers to a c file and compiling

        .. code-block:: c++
            
            #include <unistr.h>
            #include <unictype.h>
            #include <uninorm.h>
            #include <unicase.h>
            #include<stdio.h>
            int main(void)
            {
                printf("The libunistring libraries exist ");
                return(0);
            }


