.. _boost:

Boost C++ Library
=================

.. sidebar:: Boost C++ Library

   :Latest version: 1.58
   :URL: www.boost.org

Boost provides free, peer-reviewed and portable C++ source libraries.

Usage
-----
On Iceberg, different versions of Boost were built using different versions of gcc. We suggest that you use the matching version of gcc to build your code.

The latest version of Boost, version 1.59, was built using gcc 5.2. To make both the compiler and Boost library available to the system, execute the following module commands while in a `qrsh` or `qsh` session ::

    module load compilers/gcc/5.2
    module load libs/gcc/5.2/boost/1.59

Boost version 1.58 was built using gcc 4.8.2. To make both the compiler and Boost library available to the system, execute the following module commands while in a `qrsh` or `qsh` session ::

    module load compilers/gcc/4.8.2
    module load libs/gcc/4.8.2/boost/1.58

Version 1.41 of Boost uses version 4.4.7 of the gcc compiler. Since this is the default version of gcc on the system, you only need to load the module for the library ::

    module load libs/gcc/4.4.7/boost/1.41

Build a simple program using Boost
----------------------------------

Many boost libraries are header-only which makes them particularly simple to compile. The following program reads a sequence of integers from standard input, uses Boost.Lambda to multiply each number by three, and writes them to standard output (taken from http://www.boost.org/doc/libs/1_58_0/more/getting_started/unix-variants.html):

.. code-block:: c++

        #include <boost/lambda/lambda.hpp>
        #include <iostream>
        #include <iterator>
        #include <algorithm>

        int main()
        {
            using namespace boost::lambda;
            typedef std::istream_iterator<int> in;

            std::for_each(
                in(std::cin), in(), std::cout << (_1 * 3) << " " );
        }

Copy this into a file called example1.cpp and compile with

:code:`g++ example1.cpp -o example`

Provided you loaded the correct modules given above, the program should compile without error.

Linking to a Boost library
--------------------------
The following program is taken from the official Boost documentation http://www.boost.org/doc/libs/1_58_0/more/getting_started/unix-variants.html

.. code-block:: c++

        #include <boost/regex.hpp>
        #include <iostream>
        #include <string>

        int main()
        {
            std::string line;
            boost::regex pat( "^Subject: (Re: |Aw: )*(.*)" );

            while (std::cin)
            {
                std::getline(std::cin, line);
                boost::smatch matches;
                if (boost::regex_match(line, matches, pat))
                    std::cout << matches[2] << std::endl;
            }
        }

This program makes use of the Boost.Regex library, which has a separately-compiled binary component we need to link to.
Assuming that the above program is called example2.cpp, compile with the following command

:code:`g++ example2.cpp -o example2 -lboost_regex`

If you get an error message that looks like this:

:code:`example2.cpp:1:27: error: boost/regex.hpp: No such file or directory`

the most likely cause is that you forgot to load the correct modules as detailed above.

Installation Notes
------------------
This section is primarily for administrators of the system

**version 1.59: Compiled with gcc 5.2 and icu version 55** ::

  module load compilers/gcc/5.2
  module load libs/gcc/4.8.2/libunistring/0.9.5
  module load libs/gcc/4.8.2/icu/55

  mkdir -p /usr/local/packages6/libs/gcc/5.2/boost/1.59.0/
  tar -xvzf ./boost_1_59_0.tar.gz
  cd boost_1_59_0
  ./bootstrap.sh --prefix=/usr/local/packages6/libs/gcc/5.2/boost/1.59.0/

It complained that it could not find the icu library but when I ran ::

./b2 install --prefix=/usr/local/packages6/libs/gcc/5.2/boost/1.59.0/

It said that it had detected the icu library and was compiling it in

**Version 1.58: Compiled with gcc 4.8.2 and icu version 55** ::

    module load compilers/gcc/4.8.2
    module load libs/gcc/4.8.2/libunistring/0.9.5
    module load libs/gcc/4.8.2/icu/55
    tar -xvzf ./boost_1_58_0.tar.gz
    cd boost_1_58_0
    ./bootstrap.sh --prefix=/usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0/

It complained that it could not find the icu library but when I ran ::

    ./b2 install --prefix=/usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0

It said that it had detected the icu library and was compiling it in

**Version 1.41: This build of boost was built with gcc 4.4.7 and ICU version 42** ::

        module load libs/gcc/4.4.7/icu/42
        tar -xvzf ./boost_1_41_0.tar.gz
        cd boost_1_41_0
        ./bootstrap.sh --prefix=/usr/local/packages6/libs/gcc/4.4.7/boost/1.41
        ./bjam -sICU_PATH=/usr/local/packages6/libs/gcc/4.4.7/icu/42 install


Testing
-------
The two examples above were compiled and run.

Module Files
------------
**Version 1.59**

Module file location: `/usr/local/modulefiles/libs/gcc/5.2/boost/1.59` ::

  #%Module1.0#####################################################################
  ##
  ## boost 1.59 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  module load libs/gcc/4.8.2/libunistring/0.9.5
  module load libs/gcc/4.8.2/icu/55

  proc ModulesHelp { } {
          puts stderr "Makes the Boost 1.59 library available"
  }

  set BOOST_DIR /usr/local/packages6/libs/gcc/5.2/boost/1.59.0

  module-whatis   "Makes the Boost 1.59 library available"

  prepend-path LD_LIBRARY_PATH $BOOST_DIR/lib
  prepend-path CPLUS_INCLUDE_PATH $BOOST_DIR/include
  prepend-path LIBRARY_PATH $BOOST_DIR/lib

**Version 1.58**

Module file location: `/usr/local/modulefiles/libs/gcc/4.8.2/boost/1.58`

.. code-block:: none

        #%Module1.0#####################################################################
        ##
        ## boost 1.58 module file
        ##

        ## Module file logging
        source /usr/local/etc/module_logging.tcl
        ##

        module load libs/gcc/4.8.2/libunistring/0.9.5
        module load libs/gcc/4.8.2/icu/55

        proc ModulesHelp { } {
                puts stderr "Makes the Boost 1.58 library available"
        }

        set BOOST_DIR /usr/local/packages6/libs/gcc/4.8.2/boost/1.58.0

        module-whatis   "Makes the Boost 1.58 library available"

        prepend-path LD_LIBRARY_PATH $BOOST_DIR/lib
        prepend-path CPLUS_INCLUDE_PATH $BOOST_DIR/include
        prepend-path LIBRARY_PATH $BOOST_DIR/lib

Version 1.41

The module file is on the system at `/usr/local/modulefiles/libs/gcc/4.4.7/boost/1.41`

.. code-block:: none

        #%Module1.0#####################################################################
        ##
        ## Boost 1.41 module file
        ##

        ## Module file logging
        source /usr/local/etc/module_logging.tcl
        ##

        module load libs/gcc/4.4.7/icu/42

        proc ModulesHelp { } {
                puts stderr "Makes the Boost 1.41 library available"
        }

        set BOOST_DIR /usr/local/packages6/libs/gcc/4.4.7/boost/1.41

        module-whatis   "Makes the Boost 1.41 library available"

        prepend-path LD_LIBRARY_PATH $BOOST_DIR/lib
        prepend-path CPLUS_INCLUDE_PATH $BOOST_DIR/include
        prepend-path LIBRARY_PATH $BOOST_DIR/lib
