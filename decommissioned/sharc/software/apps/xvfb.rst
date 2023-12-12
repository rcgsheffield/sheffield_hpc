.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Xvfb 
====

.. sidebar:: Xvfb
   
   :URL: https://linux.die.net/man/1/xvfb

Xvfb is:

   an X server that can run on machines with no display hardware and no physical input devices. It emulates a dumb framebuffer using virtual memory.

Some applications can require a display to run properly, 
even if no interaction with the user is actually required. 
This can cause problems for those wanting to run such applications from within batch jobs.

One approach to this problem is to use an X Virtual Frame Buffer (Xvfb): 
this is a mechanism that provides what appears to applications be a real display device 
but is just a buffer in memory. 
An Xvfb can be created by an unprivileged user on-demand then 
killed when no longer needed. 
One can also take screenshots of Xvfb displays.

Usage
-----

For example, to 

#. start an application that requires a display, 
#. take a screenshot of it an hour later 
#. then kill the associated Xvfb 

you could add something similar to the following to your batch job submission script:

.. code-block:: sh

  # Start an 'X virtual frame buffer' (a dummy display)
  export DISPLAY=:1
  Xvfb $DISPLAY &
  xvfb_process_id=$!
  
  # Start an application that requires a display 
  ./myprogram arg1 arg2 & 
  myprogram_process_id=$!
  
  # Wait an hour then take a screenshot
  sleep 3600
  import -window root myprogram_screenshot.png
  
  # Kill your program
  kill $myprogram_process_id
  
  # Kill your 'X virtual frame buffer'
  kill -9 $xvfb_process_id

Xvfb is available on all worker nodes.

Installation notes
------------------

Installed and updated using the ``centos-updates`` YUM repository.

