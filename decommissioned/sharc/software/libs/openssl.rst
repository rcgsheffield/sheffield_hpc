.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

OpenSSL
=======

.. sidebar:: OpenSSL

   :Latest Version: provided by the operating system
   :URL: https://www.openssl.org/

> OpenSSL is an open source project that provides a robust, commercial-grade, and full-featured toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols. It is also a general-purpose cryptography library.

Usage
-----

If user applications are installed in a *central* location by a system administrator
then they are typically made available using one or more Environment Modules 
to allow users to select the version(s) they want to use, 
facilitating *reproducible research*.

However, OpenSSL has been installed as an operating system package on ShARC so:

* There is only one version available;
* There is no need to load an Environment Module to use it.

There are two reasons for this:

* It is more important to use the latest version of OpenSSL (for security reasons) 
  than it is to continue to provide older versions for reproducible research purposes;
* Relatively few new features are added between OpenSSL versions 
  so concerns about reproducible research are marginal.

To check the version of OpenSSL that has been installed using the operating system's package manager run: ::

       openssl version

Conda
-----

If you are using the :ref:`conda <sharc-python-conda>` package manager (e.g. if using Anaconda/Miniconda) to maintain software environments (e.g. for Python or R) in your home directory then you will find that conda installs its own  ``openssl`` package.  

Note that this conda package is not managed by system administrators: if you install it (which you will do whenever you create a new conda environment) then you should be aware that it will **not be automatically updated if security vulnerabilities are found and a new version released**.  However, you can update it yourself periodically using: ::

        conda upgrade openssl

or if you are using R: ::

        conda upgrade -c r openssl r-openssl

Installation Notes
------------------

The ``openssl`` RPM is installed by default in Centos 7.x.
The ``openssl-devel`` RPM (header files) was installed using Puppet.

