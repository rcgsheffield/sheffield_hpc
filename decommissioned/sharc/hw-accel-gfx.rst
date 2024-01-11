.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _hw-accel-gfx:

Hardware-accelerated graphics rendering (qsh-vis)
=================================================

Software that requires OpenGL and a graphics card to render complex visualisations cannot be run on all of ShARC's nodes as:

* Only a limited number of nodes have graphics cards
* None of the nodes that do have a monitor attached

To run such software on ShARC we therefore need:

* A means to automate the finding of a node with a graphics card that we can use for visualisation purposes
* A way of streaming the images rendered on a node through to the machine the user is sat in front of.

We have set up on ShARC a system for hardware-accelerated visualisation that uses two main tools: VirtualGL and TigerVNC.  See below for simple usage instructions.

Usage instructions
------------------

#. Download and install `TigerVNC <http://sourceforge.net/projects/tigervnc/>`_ on your machine.  TigerVNC is a program that allows you to efficiently view graphical programs on one computer that are actually running on another computer.
#. :ref:`Connect to ShARC <connecting>`.  
#. On the login node (**not** a worker node) run the command ``qsh-vis``.  The output should look something like the following: ::

      [te1st@sharc-login1 ~]$ qsh-vis

      NOTE: you can only run 1 GPU acclerated session


      New 'sharc-node098.shef.ac.uk:1 (te1st)' desktop is sharc-node098.shef.ac.uk:1

      Starting applications specified in /home/te1st/.vnc/xstartup
      Log file is /home/te1st/.vnc/sharc-node098.shef.ac.uk:1.log


      Accelerated VNC graphics session started

      *******To connect: *******

      Use the TigerVNC application to connect to:
      sharc-node098.shef.ac.uk:5901

      Make sure to enter your normal ShARC username/password when prompted.

      The latest version of the TigerVNC client can be downloaded from:
      https://github.com/TigerVNC/tigervnc/releases

      Note that TigerVNC no longer supports http access to the java vncviewer client, however the
      java vncviewer application can be downloaded from https://github.com/TigerVNC/tigervnc/releases

      Hit [enter] to terminate this VNC graphics session

#. Leave that terminal running.
#. On your machine start the 'VNC Viewer' program that comes with TigerVNC (this is called ``vncviewer`` on Linux).  You should then see a dialog box like this:

    .. image:: /images/vncviewer_dialog.png

#. Enter the connection details for TigerVNC that were issued by the ``qsh-vis`` command e.g. ``sharc-node098.shef.ac.uk:5901`` (NB the node name and last four digits may differ when you run ``qsh-vis``).
#. Click *Connect*
#. You should now see a desktop within a window.  This desktop is running on a worker node (in the case of the presented example this is ``sharc-node098```; see the ``qsh-vis`` output) that is equipped with a graphics card (Optional: run ``nvidia-smi`` to see what type of graphics card).  A terminal window is automatically started from which you can :ref:`load modules <env_modules>` and start applications that require hardware-accelerated graphics.

    .. image:: /images/vncviewer_session.png

#. When you are finished, close VNC Viewer then return to the terminal within which you started ``qsh-vis`` and press enter to stop the worker session (and allow someone else to use that graphics-card-equipped node).

Resources available to qsh-vis sessions
---------------------------------------

* Sessions started using ``qsh-vis`` by default have allocated to them:

  * 1 CPU core
  * 1 GPU

* You can request additional resources by passing the same parameters to ``qsh-vis`` that can be used with ``qrsh``/``qrshx``/``qsh``/``qsub`` (see :ref:`submit_interactive_sharc`).
* Research groups who have purchased their own GPU visualisation nodes may have different defaults.

Availability
------------

At present only **one** graphics-card-equipped node is available for use with ``qsh-vis`` so there may be contention for this resource.  Some research groups have purchased their own visualisation nodes.

Technical details
-----------------

Behind the scenes: 

* ``qsh-vis`` sets the default resources to be requested for the interactive session (based on whether the user belongs to a research group that has dedicated visualisation nodes)...
* ...then uses ``qrsh`` to start a script with these resources.
* This script then starts a TigerVNC ``vncserver`` on a port that is unique over the range of machines on which hardware-accelerated visualisation sessions can be started.
* TigerVNC supports `VirtualGL <http://www.virtualgl.org/About/Introduction>`_, a means of streaming the images rendered by say a graphics card to a remote machine.
* The aforementioned script then kills the created ``Xvnc`` process when Enter is pressed.
