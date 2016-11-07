.. _iceberg_wxwidgets:

wxWidgets
=========

.. sidebar:: wxWidgets

   :Version: 3.1.0
   :URL: http://www.wxwidgets.org/

"wxWidgets is a C++ library that lets developers create applications for Windows, Mac OS X, Linux and other platforms with a single code base. It has popular language bindings for Python, Perl, Ruby and many other languages, and unlike other cross-platform toolkits, wxWidgets gives applications a truly native look and feel because it uses the platform's native API rather than emulating the GUI. It's also extensive, free, open-source and mature."

Usage
-----

Activate wxWidgets using: ::

        module load libs/gcc/4.9.2/wxWidgets/3.1.0

You can then check that wxWidgets is available using: ::

        $ wx-config --version
        3.1.0

Installation notes
------------------
This section is primarily for system administrators.

**Version 3.1.0**

This is a pre-requisite for ctffind 4.x.  It was built using gcc 4.9.2.   Unicode support was enabled.

#. Download, configure, compile and install using :download:`this script </iceberg/software/install_scripts/libs/gcc/4.9.2/wxWidgets/3.1.0/install.sh>`
#. Install :download:`this modulefile </iceberg/software/modulefiles/libs/gcc/4.9.2/wxWidgets/3.1.0>` as ``/usr/local/modulefiles//libs/gcc/4.9.2/wxWidgets/3.1.0``
