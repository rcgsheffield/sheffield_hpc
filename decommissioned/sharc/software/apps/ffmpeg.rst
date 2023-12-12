.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

FFmpeg
======

.. sidebar:: FFmpeg

   :Version: 4.1, 4.3.2
   :URL: https://www.ffmpeg.org/

FFmpeg is the leading multimedia framework, able to decode, encode, transcode, mux, demux, stream, filter and play pretty much anything that humans and machines have created.
It supports the most obscure ancient formats up to the cutting edge.
No matter if they were designed by some standards committee, the community or a corporation.
It is also highly portable: FFmpeg compiles, runs, and passes our testing infrastructure FATE across Linux, Mac OS X, Microsoft Windows, the BSDs, Solaris, etc. under a wide variety of build environments, machine architectures, and configurations.

.. note::
    You will need to use the ``apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1`` module to enable encoding your output files to common formats such as H.264, H.265 etc... (non-free). Please check the installation notes for further details.


Interactive Usage
-----------------
After connecting to the cluster (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or :code:`qrsh` command.
The latest version of ffmpeg (currently 4.3.2) is made available with the command ::

        module load apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1

This command makes the ffmpeg binaries available to your session. It also loads version 8.2 of the gcc compiler environment since gcc 8.2 was used to compile ffmpeg 4.3.2.

Alternatively, you can load a specific version with one of the following: ::

        module load apps/ffmpeg/4.1/gcc-4.9.4
        module load apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1




You can now run ffmpeg. For example, to confirm the version loaded ::

    ffmpeg -version

and to get help ::

    ffmpeg -h


or list supported codecs / formats with ::

    ffmpeg -codecs
    ffmpeg -formats

Documentation
-------------
Once you have made ffmpeg available to the system using the `module` command above, you can read the man pages by typing ::

    man ffmpeg

Installation notes
------------------
FFmpeg 4.3.2 was compiled using the
:download:`install_ffmpeg.sge </decommissioned/sharc/software/install_scripts/apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1/install_ffmpeg.sge>` script.

This included the following additional libraries / options enabled: ::

    --enable-gpl
    --enable-libfdk_aac
    --enable-libfreetype
    --enable-libmp3lame
    --enable-libopus
    --enable-libvpx
    --enable-libx264
    --enable-libx265
    --enable-shared
    --enable-pic
    --enable-nonfree

The module file is
:download:`/usr/local/modulefiles/apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1/ </decommissioned/sharc/software/modulefiles/apps/ffmpeg/4.3.2/gcc-8.2-cmake-3.17.1>`.

----------

FFmpeg 4.1 was compiled using the
:download:`install_ffmpeg.sh </decommissioned/sharc/software/install_scripts/apps/ffmpeg/4.1/gcc-4.9.4/install_ffmpeg.sh>` script and lacks support for most common encoders.

The module file is
:download:`/usr/local/modulefiles/apps/ffmpeg/4.1/gcc-4.9.4 </decommissioned/sharc/software/modulefiles/apps/ffmpeg/4.1/gcc-4.9.4>`.

Testing
-------
The test suite was executed (immediately post make install) ::

    make check

All tests passed.

