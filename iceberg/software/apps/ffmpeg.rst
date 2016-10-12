ffmpeg
======

.. sidebar:: ffmpeg

   :Version: 2.8.3
   :URL: https://www.ffmpeg.org/

FFmpeg is the leading multimedia framework, able to decode, encode, transcode, mux, demux, stream, filter and play pretty much anything that humans and machines have created.
It supports the most obscure ancient formats up to the cutting edge.
No matter if they were designed by some standards committee, the community or a corporation.
It is also highly portable: FFmpeg compiles, runs, and passes our testing infrastructure FATE across Linux, Mac OS X, Microsoft Windows, the BSDs, Solaris, etc. under a wide variety of build environments, machine architectures, and configurations.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qsh` or :code:`qrsh` command.
The latest version of ffmpeg (currently 2.8.3) is made available with the command ::

        module load apps/gcc/5.2/ffmpeg

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/ffmpeg/2.8.3

This command makes the ffmpeg binaries available to your session. It also loads version 5.2 of the gcc compiler environment since gcc 5.2 was used to compile ffmpeg 2.8.3

You can now run ffmpeg. For example, to confirm the version loaded ::

    ffmpeg -version

and to get help ::

    ffmpeg -h

Documentation
-------------
Once you have made ffmpeg available to the system using the `module` command above, you can read the man pages by typing ::

    man ffmpeg

Installation notes
------------------
ffmpeg was installed using gcc 5.2 ::

  module load compilers/gcc/5.2

  tar xf ./ffmpeg-2.8.3.tar.xz
  cd ffmpeg-2.8.3
  mkdir -p /usr/local/packages6/apps/gcc/5.2/ffmpeg/2.8.3
  ./configure --prefix=/usr/local/packages6/apps/gcc/5.2/ffmpeg/2.8.3
  make
  make install

Testing
-------
The test suite was executed ::

    make check

All tests passed.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/ffmpeg/2.8.3`
* The module file is `on github <https://github.com/rcgsheffield/sheffield_hpc/blob/master/software/modulefiles/apps/gcc/5.2/ffmpeg/2.8.3>`_.
