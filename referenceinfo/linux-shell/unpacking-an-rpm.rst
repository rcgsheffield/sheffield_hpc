.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Unpacking an RPM
""""""""""""""""

Unpacking an RPM is achieved by using the ``rpm2cpio`` and ``cpio`` commands in concert as shown below. 
This will unpackage the RPM into the current directory following a localised structure which would 
otherwise be where this package would be installed conventionally.

i.e. ``./usr/bin/gmake`` rather than ``/usr/bin/gmake``

.. code-block:: console
    :emphasize-lines: 1
    :caption: The output below has been truncated to save space as indicated by \*SNIP\*.

    [user@node004 [stanage] yumpackages]$ rpm2cpio make-3.82-24.el7.x86_64.rpm | cpio -idmv
    ./usr/bin/gmake
    ./usr/bin/make
    ./usr/share/doc/make-3.82
    ./usr/share/doc/make-3.82/AUTHORS
    ./usr/share/doc/make-3.82/COPYING
    ./usr/share/doc/make-3.82/NEWS
    ./usr/share/doc/make-3.82/README
    *SNIP*
    ./usr/share/info/make.info-1.gz
    ./usr/share/info/make.info-2.gz
    ./usr/share/info/make.info.gz
    ./usr/share/man/man1/gmake.1.gz
    ./usr/share/man/man1/make.1.gz
    2278 blocks