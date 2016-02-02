.. index::
    single: Paraview

Paraview
========

.. sidebar:: Paraview
   
   :Version: 4.3
   :Support Level: extras
   :Dependancies: openmpi (1.8)
   :URL: http://paraview.org/ 
   :Documentation: http://www.paraview.org/documentation/ 

Paraview is a parallel visualisation tool.

Using Paraview on iceberg
-------------------------

This guide describes how to use `Paraview <http://www.paraview.org/>`_ from iceberg.
Paraview is a parallel visualisation tool designed for use on clusters like iceberg.
Because iceberg is designed primarily as a headless computational cluster paraview
has not been installed on iceberg in such a way that you load the GUI remotely on iceberg [1]_.
Paraview therefore runs on iceberg in client + server mode, the server running 
on iceberg, and the client on your local machine.

Configuring the Client
######################

To use Paraview on iceberg, first download and install `Paraview 4.3 <http://www.paraview.org/download/>`_ [2]_.
Once you have installed Paraview locally (the client) you need to configure the 
connection to iceberg.
In Paraview go to File > Connect, then click Add Server, name the connection 
iceberg, and select 'Client / Server (reverse connection)' for the Server Type,
the port should retain the default value of 11111.
Then click configure, on the next screen leave the connection as manual and 
click save.
Once you are back at the original connect menu, click connect to start listening
for the connection from iceberg.

Starting the Server
###################

Once you have configured the local paraview client, login to iceberg from the 
client machine via ssh [3]_ and run `qsub-paraview`.
This will submit a job to the scheduler que for 16 processes with 4GB or RAM each.
This is designed to be used for large visualisation tasks, smaller jobs can be 
requested by specifying standard qsub commands to `qsub-paraview` 
i.e. `qsub-paraview -pe openmpi-ib 1` will only request one process.

Assuming you still have the client listening for connections, once the paraview
job starts in the que it should connect to your client and you should be able 
to start accessing data stored on iceberg and rendering images.


.. [1] It is not possible to install the latest version of the paraview GUI on  
   iceberg due to the Qt version shipped with Scientific Liunx 5.
.. [2] The client and server versions have to match.
.. [3] Connecting to Paraview via the automatic method descibed here is not 
   supported on the MyApps portal.

A Note on Performance
---------------------

When you run Paraview locally it will use the graphics hardware of your local 
machine for rendering. This is using hardware in your computer to create and 
display these images. On iceberg there is no such hardware, it is simulated via
software. Therefore for small datasets you will probably find you are paying a 
performance penalty for using Paraview on iceberg.

The advantage however, is that the renderer is on the same cluster as your data,
so no data transfer is needed, and you have access to very large amounts of 
memory for visualising very large datasets.


Manually Starting the Server
----------------------------
The `qsub-paraview` command is a wrapper that automatically detects the client
IP address from the SSH connection and submits the job.
It is possible to customise this behavior by copying and modifying this script.
This for instance would allow you to start the paraview server via MyApps or 
from a different computer to the one with the client installed.
The script used by `qsub-paraview` also serves as a good example script and 
can be copied into your home directory by running `cp /usr/local/bin/pvserver_submit.sh ~/`.
This script can then be qsubmitted as normal by `qsub`.
The client IP address can be added manually by replacing `echo $SSH_CLIENT | awk '{ print $1}'`
with the IP address.
More information on Paraview client/server can be found `Here <http://www.paraview.org/Wiki/Setting_up_a_ParaView_Server#Running_the_Server>`_.


Installation
------------

Custom build scripts are availible in `/usr/local/extras/paraview/build_scripts`
which can be used to recompile.
