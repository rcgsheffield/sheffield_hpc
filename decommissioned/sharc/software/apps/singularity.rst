.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _apptainer_sharc:

Apptainer/Singularity
=====================

.. sidebar:: Apptainer

   :Version: 1.1.x
   :URL: https://apptainer.org/

Designed around the notion of extreme mobility of compute and reproducible science,
Apptainer (:ref:`previously known as Singularity <apptainer_vs_singularity_sharc>`)
enables users to have full control of their operating system environment.
This means that a non-privileged user can "swap out" the operating system on the host for one they control.
So if the host system is running CentOS Linux but your application runs in Ubuntu Linux,
you can create an Ubuntu image,
install your applications into that image,
copy the image to another host,
and run your application on that host in it’s native Ubuntu environment.

Apptainer also allows you to leverage the resources of whatever host you are on.
This includes high-speed cluster interconnects,
resource managers,
file systems,
GPUs and/or
accelerators, etc.

About Apptainer Containers and Images
-------------------------------------

Similar to Docker,
an Apptainer container (image) is a self-contained software stack.
As Apptainer does not require a root-level daemon to run its images
it is compatible for use with ShARC's scheduler inside your job scripts.
The running images also uses the credentials of the person calling it.

In practice, this means that an image created on your local machine
with all your research software installed for local development
will also run on the HPC cluster.

Pre-built images have been provided on the cluster and
can also be download for use on your local machine
(see :ref:`use_image_apptainer_sharc`).
Creating and modifying images however,
requires root permission and so
must be done on your machine (see :ref:`create_image_apptainer_sharc`).

Apptainer images are currently provided for:

* :ref:`caffe_sharc`
* :ref:`theano_sharc`
* :ref:`torch_sharc`
* :ref:`tensorflow_sharc`

.. _apptainer_vs_singularity_sharc:

Apptainer versus Singularity
----------------------------

The Singularity project forked into the Apptainer and the Singularity CE projects in 2021.
If you've previously used Singularity on TUOS's HPC systems and now want to use Apptainer
then be aware that:

* Apptainer is (currently) almost identical in behaviour and usage to the latest release of Singularity:
  it understands the same image format and has very similar command-line behaviour;
* You should run ``apptainer`` instead of ``singularity``, although ``singularity`` still exists (as a _symlink_ to (alias of) of ``apptainer``);
* Singularity behaviour could previously be modified using environment variables with prefixes ``SINGULARITY_`` and ``SINGULARITYENV_``;
  you should now use ``APPTAINER_`` and ``APPTAINERENV_`` prefixes instead (but the old prefixes will still work for now);
* The per-user configuration directory has changed from ``~/.singularity`` to ``~/.apptainer``.
  One impact of this is that cached OCI/Docker image layers in ``~/.singularity/cache`` will be redundant following the switch to Apptainer,
  so you should probably manually delete that directory to free up space in your home directory.
* If you tried pulling images from a remote repository using Singularity without specifying the repository hostname then
  this would default to pulling images from `https://cloud.sylabs.io/ <https://cloud.sylabs.io/>`__.
  With Apptainer there is no default remote repository.

For more information on the differences between Apptainer and Singularity see the `Apptainer 1.0.0 release notes <https://github.com/apptainer/apptainer/releases/tag/v1.0.0>`__.

.. _use_image_apptainer_sharc:

Interactive Usage of Apptainer Images
-------------------------------------

**To use Apptainer interactively, an interactive session must first be requested using** :ref:`qrshx` **for example.**

To get an interactive shell in to the image, use the following command: ::

  apptainer shell path/to/imgfile.img

Or if you prefer bash: ::

  apptainer exec path/to/imgfile.img /bin/bash

Note that the ``exec`` command can also be used to execute other applications/scripts inside the image or
from the mounted directories (See :ref:`auto_mounting_filestore_apptainer_sharc`): ::

    apptainer exec path/to/imgfile.img my_script.sh

.. note::

    You may get a warning similar to:

    .. code-block:: none

        groups: cannot find name for group ID ...

    :ref:`This can be ignored <unnamed_groups>` and will not have an affect on running the image.


.. _use_image_batch_apptainer_sharc:

Submitting Batch Jobs That Uses Apptainer Images
--------------------------------------------------

When submitting a job that uses an Apptainer image,
it is not possible to use the interactive shell
(e.g. ``apptainer shell`` or ``apptainer exec path/to/imgfile.img /bin/bash``).
You must use the ``exec`` command to call the desired application or script directly.

For example, if we would like to use a command ``ls /`` to get the content of the root folder in the image,
two approaches are shown in the following job script ``my_apptainer_job.sh``:

.. code-block:: bash

  #!/bin/bash
  #$ -l rmem=8G
  # We requested 8GB of memory in the line above, change this according to your
  # needs e.g. add -l gpu=1 to reqest a single GPU

  # Calling ls directly using the exec command
  apptainer exec path/to/imgfile.img ls /

  # Have Apptainer call a custom script from your home or other mounted directories
  # Don't forget to make the script executable before running by using chmod
  chmod +x ~/myscript.sh
  apptainer exec path/to/imgfile.img ~/myscript.sh

Where the content of ``~/myscript.sh`` is shown below:

.. code-block:: bash

  #!/bin/bash

  ls /

The job can then be submitted as normal with ``qsub``: ::

  qsub my_apptainer_job.sh


Using Nvidia GPUs with Apptainer Images
---------------------------------------

You can use GPUs in your image by adding the ``--nv`` flag to the command e.g. for running interactively: ::

  apptainer shell --nv myimage.sif

or when running within the batch file: ::

  apptainer exec --nv myimage.sim myscript.sh

A quick way to test that GPU is enabled in your image is by running the command: ::

  nvidia-smi

Where you will get something similar to the following:

.. code-block:: none

  Tue Mar 28 16:43:08 2017
  +-----------------------------------------------------------------------------+
  | NVIDIA-SMI 367.57                 Driver Version: 367.57                    |
  |-------------------------------+----------------------+----------------------+
  | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
  |===============================+======================+======================|
  |   0  GeForce GTX TITAN   Off  | 0000:01:00.0      On |                  N/A |
  | 30%   35C    P8    18W / 250W |    635MiB /  6078MiB |      1%      Default |
  +-------------------------------+----------------------+----------------------+


.. _auto_mounting_filestore_apptainer_sharc:

Automatic Mounting of ShARC Filestore Inside Images
---------------------------------------------------

When running Apptainer containers on the cluster,
the paths ``/fastdata``, ``/data``, ``/home``, ``/scratch``, ``/shared`` and ``/tmp`` are
automatically *bind-mounted* (exposed) from the *host* operating system into your container,
i.e. the cluster's ordinary filestores will be automatically visible within a container started on the cluster
without that directory being explicitly created when the corresponding Apptainer image was built.

.. warning::

  The automatic bind mounting of your HPC home directory into Apptainer containers can result in the unexpected sharing of things like executables
  and libraries between the host and Apptainer container.

  Unintended behaviour may occur with Apptainer on the HPC system due to the presence of:

  * Shell initialisation files e.g. ``~/.bashrc`` or ``~/.profile``
  * R profile files (e.g. ``~/.Rprofile``) and/or libraries (e.g ``~/R/x86_64-pc-linux-gnu-library/4.1``)
  * Python or Conda initilisation files, (virtual/conda) envs or packages ``~/.conda/``, ``~/.condarc``, ``~/.local/python`` etc...
  * User supplied executables or libraries e.g. ``~/bin``, ``~/lib``, etc...

MPI and Apptainer
-------------------
If you try running MPI within an Apptainer container on a single node the MPI implementation may auto-detect that its processes are running under the SGE job scheduler and will try to read a SGE file containing information on the CPU cores SGE has allocated to that job.
This **will fail** unless you run your container with a ``--bind $PE_HOSTFILE:$PE_HOSTFILE:ro`` argument e.g.: ::

    apptainer exec --bind $PE_HOSTFILE:$PE_HOSTFILE:ro /usr/local/packages/singularity/images/example.sif /home/$USER/my_script.sh

For a more complete guide to using MPI with Apptainer (inc. multi-node jobs) `see the Apptainer project's documentation <https://apptainer.org/docs/user/1.1/mpi.html>`__.

Image Index on Github
---------------------

All our Apptainer container definitions can be found at `https://github.com/rses-singularity <https://github.com/rses-singularity>`_. The definition files can be used as a template for building your own images.


Installing Apptainer on Your Local Machine
--------------------------------------------

You will need Apptainer installed on your machine in order to locally run, create and modify images.
See the `Apptainer project's installation instructions <https://github.com/apptainer/apptainer/blob/main/INSTALL.md>`__.


Manually mounting paths
-----------------------

When using ShARC's pre-built images on your local machine,
it may be useful to mount the existing directories in the image to your own path.
This can be done with the flag ``-B local/path:image/path`` with
the path outside of the image left of the colon and
the path in the image on the right side, e.g. ::

  apptainer shell -B local/datapath:/data,local/fastdatapath:/fastdata path/to/imgfile.img

The command mounts the path ``local/datapath`` on your local machine to
the ``/data`` path in the image.
Multiple mount points can be joined with ``,``
as shown above where we additionally specify that ``local/fastdata`` mounts to ``/fastdata``.
The ``/home`` folder is automatically mounted by default.

**Note: In order to mount a path, the directory must already exist within the image.**

.. _create_image_apptainer_sharc:

Creating Your Own Apptainer Images
------------------------------------

.. important::

  Root access is required for modifying Apptainer images so if you need to edit an
  image it must be done on your local machine.  However you can create disk
  images and import Docker images using normal user privileges on recent
  versions of Apptainer.

First create an Apptainer definition file for bootstrapping an image your image. An example definition file we'll name ``apptainer-test.def`` is shown below ::

  Bootstrap: docker
  From: ubuntu:latest

  %setup
    # Runs on host. The path to the image is $APPTAINER_ROOTFS

  %post
    #Post setup, runs inside the image

    # Default mount paths
    mkdir /scratch /data /shared /fastdata

    # Install the packages you need
    apt-get install git vim cmake


  %runscript
    # Runs inside the image every time it starts up

  %test
    # Test script to verify that the image is built and running correctly

The definition file takes a base image from `DockerHub <https://hub.docker.com/>`_,
in this case the latest version of Ubuntu ``ubuntu:latest``.
Other images on the hub can also be used as the base for the Apptainer image,
e.g. ``From: nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04`` uses Nvidia's docker image with Ubuntu 16.04 that already has CUDA 8 installed.

After creating a definition file, use the ``build`` command to build the image from your definition file: ::

  sudo apptainer build apptainer-test.sif apptainer-test.def

It is also possible to build Apptainer images directory directly from images on `DockerHub <https://hub.docker.com/>`_: ::

  sudo apptainer build myimage.sif docker://ubuntu:latest

By default, the ``build`` command creates a read-only squashfs file. It is possible to add the ``--writable`` or ``--sandbox`` flag to the build command in order to create a writable ext image or a writable sandbox directory respectively. ::

  sudo apptainer build --sandbox myimage_folder Apptainer

You will also need to add the ``--writable`` flag to the command when going in to change the contents of an image: ::

  sudo apptainer shell --writable myimage_folder


How Apptainer is installed and 'versioned' on the cluster
-----------------------------------------------------------

Apptainer, unlike much of the other key software packages on ShARC,
is not activated using module files.
This is because module files are primarily for the purpose of
being able to install multiple version of the same software
and for security reasons only the most recent version of Apptainer is installed.
The security risks associated with providing outdated builds of Apptainer
are considered to outweigh the risk of upgrading to backwards incompatible versions.

Apptainer has been installed on all worker nodes
using the latest RPM package
from the `EPEL <https://fedoraproject.org/wiki/EPEL>`_ repository.

