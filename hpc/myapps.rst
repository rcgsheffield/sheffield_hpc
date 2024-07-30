.. _myapps:

Connecting to Bessemer using myApps (web browser)
==================================================

For easier access to HPC resources,  IT Services runs an instance of Oracle Secure Global desktop called myApps to provide web-based access to CLI terminals and
text editors within interactive sessions for the Bessemer and Training HPC clusters.


.. important:: 
    
    The myApps service is only accessible on Bessemer (:underline-bold:`not` Stanage).

In order to access the HPC clusters you must set up a `VPN connection and MFA <https://www.sheffield.ac.uk/it-services/vpn>`_.

The web browser method of access to Bessemer is recommended. This method works well for most browsers on all the common 
computing platforms (Linux, Windows, Mac), however we recommend Chrome or Firefox.

:underline-bold:`How to login to the myApps service`


#. To login to Bessemer click the following link: `Connect via myAPPs Portal <https://myapps.shef.ac.uk/sgd/index.jsp?langSelected=en>`_
#. If you are logging in for the first time, select Client Options on the myApps Portal page (bottom right) and 
   then click the HTML5 option to run myApps entirely within your browser.

   * Alternatively you can select option 1 to download and install the client for your system (Windows, Mac, or Linux).

   .. hint::
    Usernames to connect with all HPC services will be the same as those you use to login to MUSE :underline-bold:`not` the prefix on your email address.

#. Enter your username and password on the myApps Portal login page.
#. Once you have managed to login, you will see a window with Bessemer applications on the left hand panel.

You can select a HPC interactive job or a HPC terminal.
The interactive job is equivalent to a ``srun`` session on a worker node.
The terminal is equivalent to a login node session from which you can use ``srun``.