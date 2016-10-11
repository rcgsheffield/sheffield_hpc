.. _curl:

curl
====

.. sidebar:: curl

   :Latest version: 7.47.1
   :URL: https://curl.haxx.se/

curl is an open source command line tool and library for transferring data with URL syntax, supporting DICT, FILE, FTP, FTPS, Gopher, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMTP, SMTPS, Telnet and TFTP. curl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading, HTTP form based upload, proxies, HTTP/2, cookies, user+password authentication (Basic, Plain, Digest, CRAM-MD5, NTLM, Negotiate and Kerberos), file transfer resume, proxy tunneling and more.

Usage
-----
There is a default version of curl available on the system but it is rather old ::

    curl-config --version

gives the result ::

    libcurl 7.19.7

Version 7.19.7 was released in November 2009!

A newer version of the library is available via the module system. To make it available ::

    module load libs/gcc/4.4.7/curl/7.47.1

The `curl-config` command will now report the newer version ::

    curl-config --version

Should result in ::

    libcurl 7.47.1

Documentation
-------------
Standard `man` pages are available ::

    man curl

Installation notes
------------------
This section is primarily for administrators of the system.

Curl 7.47.1 was compiled with gcc 4.47

* Install script: `install_curl_7.47.1.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/install_scripts/libs/gcc/4.4.7/curl/install_curl_7.47.1.sh>`_
* Module file: `7.47.1 <https://github.com/rcgsheffield/iceberg_software/blob/master/iceberg/software/modulefiles/libs/gcc/4.4.7/curl/7.47.1>`_
