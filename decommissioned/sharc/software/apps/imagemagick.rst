.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

ImageMagick
===========

.. sidebar:: ImageMagick

   :Version: 6.7.8.9-15
   :URL: https://legacy.imagemagick.org/script/index.php

ImageMagick is a collection of tools for creating, editing, viewing, composing and converting images.  
Many bitmap and vector-based file formats are supported.

ImageMagick is installed on the cluster's worker nodes.  
It provides a number of command-line programs plus an API for programmatic control.

Command-line usage
------------------

Some of the some of the most useful included command-line programs are:

display
^^^^^^^

Display an image stored in a file: ::

	display winterview.jpg      

	display -resize 800x600 winterview.jpg

Display a series of files as a slide show: ::

	display -delay 2 *.jpg 

convert
^^^^^^^

Convert an image from one format to another e.g. ::

	convert -format tiff pic1.jpg pic1.tiff 

To capture from screen to a file: ::

	convert -format jpeg X: newpicture.jpg  

animate
^^^^^^^

Create an animation effect from a set of files containing snap-shots: ::

        animate pic1.tiff pic2.tiff pic3.tiff pic4.tiff pic5.tiff 

Create an animated-gif from a series of gif files (``mypics*.gif``): ::

       convert -delay 40 -loop 0 mypics*.gif myanimated.gif 

Note that non-gif files should first be converted: ::

       convert -format gif mypic1.jpg mypic1.gif

identify
^^^^^^^^

View image metadata: ::

	identify parkwood.jpg

More detailed information: ::

	identify -verbose parkwood.jpg

More information on on these and other provided command-line tools (``compare``, ``composite``, ``conjure``, ``import``, ``mogrify``, ``montage`` and ``stream``) can be found in the `official ImageMagick 6 documentation <https://legacy.imagemagick.org/script/command-line-tools.php>`_.

Programmatic access (API)
-------------------------

There are ImageMagick APIs for most common programming languages, allowing you to script/automate your image manipulation using C++, Ruby, Perl, Python etc.

A `list of ImageMagick APIs <https://legacy.imagemagick.org/script/develop.php>`_ can be found on the ImageMagick 6 site.  This list may not be comprehensive.

Installation notes
------------------

Version 6.7.8.9-15
^^^^^^^^^^^^^^^^^^

This was installed on the worker nodes using the operating system's package manager (i.e. the RPM for Centos 7.x is installed).

