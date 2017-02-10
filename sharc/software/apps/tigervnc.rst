.. _TigerVNC-sharc:

TigerVNC
========

.. sidebar:: TigerVNC

   :Latest Version: 1.7.1
   :URL: https://www.tigervnc.org

TigerVNC is a high-performance implementation of VNC (Virtual Network Computing)

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`), start an interactive session with the `qrsh-vis`.  This will launch TigerVNC server automatically.  

IMPORTANT - note that TigerVNC will currently only work within a visualisation session, as by default the remote client will be unable to connect to the TigerVNC server due to the cluster firewall.

The default version of TigerVNC (which is also the most recent version; currently 1.7.1) can be made available with the command ::

        module load apps/tigervnc

Alternatively, you can explicitly load this version using::

       module load apps/tigervnc/1.7.1/binary


Installation notes
------------------
These are primarily for administrators of the system.

**TigerVNC 1.7.1**

#. Download *TigerVNC 1.7.1* `from bintray <https://bintray.com/tigervnc/stable/tigervnc/1.7.1>`_.  Select the tarball (``tigervnc-1.7.1.x86_64.tar.gz``) for Linux and the *x64* CPU architecture family.
#. Save this file to ``/usr/local/media/tigervnc/1.7.1/``.
#. Install TigerVNC using :download:`this script </sharc/software/install_scripts/apps/tigervnc/1.7.1/binary/install.sh>`. 
#. Install :download:`this modulefile </sharc/software/modulefiles/apps/tigervnc/1.7.1/binary>` as ``/usr/local/modulefiles/apps/tigervnc/1.7.1/binary``
	
	
