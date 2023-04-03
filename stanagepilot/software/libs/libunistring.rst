.. _libunistring_stanage:

libunistring
============

.. sidebar:: libunistring
    
    :Versions: 0.9.10, 1.0
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

.. code-block:: 
         
      module load libunistring/0.9.10-foss-2019b
      module load libunistring/0.9.10-GCCcore-10.3.0                     
      module load libunistring/1.0-GCCcore-11.3.0  

This correctly populates the environment variables ``LD_LIBRARY_PATH``, ``LIBRARY_PATH`` and ``CPATH``.

Installation Notes
------------------
This section is primarily for administrators of the system.

Libunistring was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTGMP/easybuild`` with the module loaded.


Testing
-------

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


