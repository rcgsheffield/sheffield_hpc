.. _installing-personal-software-installations:

Installing software to the clusters
===================================

.. sidebar:: Contents

    .. contents::
        :depth: 2
        :local:
  

As :ref:`Stanage <stanage>` and :ref:`Bessemer <bessemer>` are general purpose HPC clusters, 
we provide and maintain only the most essential and most popular applications on them.

We are aware of our users' need to run applications that are specific to their own subject 
areas of research and as such we permit the installation of software within users' personal directories 
and special shared areas on the clusters for public use.

This option should be seen as a service without support as we will expect such users to be able to 
tackle the problems encountered during installations on their own. We will however help make such 
software available to other Stanage and Bessemer users by copying/installing scripts to shared locations.

    :underline-bold:`Policy on user-installed software on University of Sheffield HPC systems`

    |br|

    * Users should endeavour to download source code or software binaries 
         * produced by trusted developers/vendors and
         * acquired from trusted repositories/locations.
    * Users should keep software up to date where reproducibility is not a concern.
    * Users should remove any software that is definitely no longer needed.

To discuss and get support regarding these requirements 
please contact research-it@sheffield.ac.uk

---------

General background prequisites
------------------------------

.. tip::

    If you are not familiar with basic computer architecture we **highly recommend** reading our 
    :ref:`General Computer Architecture Quick Start page <general_computer_architecture_quickstart>` 
    before continuing.

What is source code?
^^^^^^^^^^^^^^^^^^^^

Source code is the collection of code written in a human readable programming language for a given 
software package. Source code is transformed by a compiler into machine code that can be 
executed by a computer.

---------

.. _what-is-compiling:

What is a compiler or compiling?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The shortest description of what a compiler is / what compiling is that it is a process that 
takes human made source code and turns it into machine code that will run on a computer. 
Machine code has to be specific to a given processor's architecture and the instruction sets it supports  
(aka, instructions/operations that a CPU can do) which is why you may need to compile your 
code for a specific instruction set (different processor manufacturers design different processors 
sometimes with different instruction sets) . 

For example, you are probably aware that mobile phones use ARM processors not Intel or AMD processors 
that you will typically find in a desktop or laptop computer. This difference in processors and their 
instruction sets is one of the reasons why applications that run on phones cannot typically 
run on desktop computers.

Within research, you may find certain clusters using different processor architectures which have been 
designed for optimal performance at certain tasks using different instruction sets. 
e.g. `Power 9 architecture <https://en.wikipedia.org/wiki/POWER9>`_ on the :ref:`BEDE cluster <bede>`.

This also means that to run software on these machines with different architecures you may need to 
recompile the software from source code if no binaries for that architecture are provided!

You may be wondering why you need to compile some software but not others, this is due to the 
`differences between compiled and interpreted languages <https://www.geeksforgeeks.org/difference-between-compiled-and-interpreted-language/>`_ 
, but this falls out of the scope of this page.

---------

What are binaries?
^^^^^^^^^^^^^^^^^^

When referring to software, software binaries, binary installations or binary downloads are 
software packages supplied to you pre-compiled by the developer for a specific processor / 
instruction set. This means that if you wish to use a binary software build you must check that you 
download and install the correct version that matches your machine's processor / architecture.

---------

What about software dependencies?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Many software packages have numerous libraries or other software packages on which they are dependant 
in order to function.

This means that the installation of one software package may require multiple packages requiring 
installation and loading prior or existing software modules provided on the cluster may need to 
be loaded prior in order for the software to install or function correctly.

---------

What is a Linux shell?
^^^^^^^^^^^^^^^^^^^^^^

A shell is a program that takes commands typed from the keyboard and gives them to the computer to run. 
Historically the shell was the only user interface available on a Unix-like system such as Linux. In the present 
day, graphical user interfaces (GUIs) are available in addition to interfaces such as the shell.

Most Linux operating systems use a program called **bash** (the Bourne Again SHell, an enhanced version of the original 
Unix shell program, **sh**, written by Steve Bourne) as the shell program. There are other shell programs available for 
Linux systems if desired by a user. Examples include: ash, dash, csh, tcsh, ksh and zsh.

---------

.. include:: ../referenceinfo/linux-shell/what-are-environment-variables.rst

---------

How do environment variables relate to installing software?
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

The usage of environment variables is critical to not only installing the software where you desire 
but also to making those software executables available to use in your shell.

A few of the most important variables are listed below with ``HOME``,  ``USER`` and ``LANG`` variables 
useful during installlation (e.g. setting directories in which to install) and the ``PATH`` and 
``LD_LIBRARY_PATH`` variables used to add libraries or executables to your shell.

* The ``HOME`` environment variable contains the path of your user's home directory.

* The ``USER`` environment variable contains the username of your current user.

* The ``PATH`` environment variable is a list of directories where your executables are located, 
  adding a directory to this list makes any of the executables in that directory available 
  from the terminal via their name.

* The ``LD_LIBRARY_PATH`` functions similarly, but is a list of directories where your 
  libraries are located. Adding a directory to this list makes any of the libraries in 
  that directory available to programs.

.. raw:: html

    <hr class="hr-mid-section-separator">

Installing software from binaries
---------------------------------

.. caution::

    Installing from pre-compiled binaries does not remove the need to supply correctly versioned 
    dependencies (e.g. shared libraries). 
    
    Using incorrectly versioned dependencies may allow a program to function but this could lead to 
    instability and software errors.

Downloading your binaries
^^^^^^^^^^^^^^^^^^^^^^^^^

The first step of completing and installation from binaries on the clusters is to download the binaries. 
In general there are few methods for downloading your binaries which will be detailed below in the 
prefered order.

---------

1. Downloading binaries for the cluster using Yumdownloader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

`Yumdownloader <https://linux.die.net/man/1/yumdownloader>`_ is an application installed on the cluster which will allow you to download RPM packaged 
applications directly from the cluster operating system's repositories. 

This is the best method as this will natively ensure that you get a version that is not only 
compatible with the operating system but this will also ensure that the package is downloaded 
from a trusted location.

As an example the following command will download the GNU Make RPM to your local folder indicating 
where it is downloading the RPM from as well as the full name of the file downloaded.

.. important::

    GNU Make is already available on our clusters! Any further examples of installing or compiling GNU Make are 
    examples only, you do not need to download or install Make.

.. code-block:: console
    :emphasize-lines: 1
    
    [user@node004 [stanage] yumpackages]$ yumdownloader make
    Loaded plugins: fastestmirror, priorities
    Loading mirror speeds from cached hostfile
    * epel: ftp.nluug.nl
    make-3.82-24.el7.x86_64.rpm                                | 421 kB  00:00:00     
    [user@node004 [stanage] yumpackages]$                  

This method will automatically check the package integrity and check it also has valid signatures.

---------

2. Downloading binaries from pkgs.org
"""""""""""""""""""""""""""""""""""""

`pkgs.org <https://pkgs.org/>`_ is a website which allows a user to search for and download binary packages 
for numerous Linux and Unix operating systems. Using this website you will be able to query for Centos 7 
x86_64 compatible packages and then download them.

.. caution::

    It is possible to download and use packages for different versions of Centos (or RHEL as both 
    operating systems are binary compatible) but this is not recommended and may lead to application 
    instability or errors.

Using GNU Make again as an example, the required page can be found by searching as: 

https://centos.pkgs.org/7/centos-x86_64/make-3.82-24.el7.x86_64.rpm.html

Looking at the **Download** section, the binary package download URL can be seen as:

http://mirror.centos.org/centos/7/os/x86_64/Packages/make-3.82-24.el7.x86_64.rpm

This RPM can now be downloaded using the ``wget`` command on the cluster:

.. code-block:: console
    :emphasize-lines: 1

    [user@node004 [stanage] yumpackages]$ wget http://mirror.centos.org/centos/7/os/x86_64/Packages/make-3.82-24.el7.x86_64.rpm
    --2021-07-15 12:19:18--  http://mirror.centos.org/centos/7/os/x86_64/Packages/make-3.82-24.el7.x86_64.rpm
    Resolving mirror.centos.org (mirror.centos.org)... 85.236.43.108, 2604:1380:2001:d00::3
    Connecting to mirror.centos.org (mirror.centos.org)|85.236.43.108|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 430712 (421K) [application/x-rpm]
    Saving to: ‘make-3.82-24.el7.x86_64.rpm’

    100%[==================================================================================================>] 430,712     --.-K/s   in 0.1s    

    2021-07-15 12:19:18 (3.74 MB/s) - ‘make-3.82-24.el7.x86_64.rpm’ saved [430712/430712]

.. _rpm-check-sigs:

Because we have downloaded this manually we should now verify both the package integrity and that the 
package has been signed as trusted. We can do this with the ``rpm --checksig`` command.


.. code-block:: console
    :emphasize-lines: 1

    [user@node004 [stanage] yumpackages]$ rpm --checksig make-3.82-24.el7.x86_64.rpm 
    make-3.82-24.el7.x86_64.rpm: rsa sha1 (md5) pgp md5 OK

.. hint::

    The `pkgs.org <https://pkgs.org/>`_ website will also show the dependencies of a package in the 
    **Requires** section. This can be very useful for resolving package / library dependencies.

---------

3. Downloading binaries from a vendor / package maintainer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

If you have software from a vendor who does not supply source code or a package maintainer has provided 
binaries that are not supplied as part of the normal package repositories for the operating system you 
will typically be supplied by them with a RPM file (``package.rpm``) or a compressed tarball (``package.tar.gz``)
from their website, via email or similar.

You may be able to use the ``wget`` command to download this directly to the cluster or may have to 
transfer this manually using SCP or similar. Once downloaded you should verify the software download's 
integrity and validity.

.. include:: ../referenceinfo/linux-shell/verifying-software-package-downloads.rst

If you know that the vendor or maintainer already signs their other releases into the Centos repository 
and has supplied you an RPM then alternatively you can :ref:`check signatures as detailed previously <rpm-check-sigs>`.

---------

Unpacking your binaries
^^^^^^^^^^^^^^^^^^^^^^^

Unpacking binaries is typically an easy process but will depend on how they have been packaged, examples 
of unpacking an RPM and a Tarball are given below.

.. include:: ../referenceinfo/linux-shell/unpacking-an-rpm.rst

---------

.. include:: ../referenceinfo/linux-shell/unpacking-a-tarball.rst

Making your binaries available in the shell
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

At this stage you can typically move the unpackaged binaries as desired and any executables (in ``./bin``) 
or libraries (typically in **./lib** and **./lib64** ) can be added to ``PATH`` or ``LD_LIBRARY_PATH`` 
using one of the two methodologies mentioned in the 
:ref:`Making installed software available to execute <make_installed_software_available>` section.

.. raw:: html

    <hr class="hr-mid-section-separator">

Installing software by compiling from source
--------------------------------------------

Downloading the source code
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The first step of completing and installation from source on the clusters is to download 
the source code. In general there are few methods for downloading the source code for a project 
which will be detailed below.

Typically source code will be made available from the maintainer's FTP/HTTP servers or mirrors in the form 
of a compressed tarball or hosted on their chosen version control system site such as 
`Github <https://github.com/>`_ , `Gitlab <https://about.gitlab.com/>`_ , 
`Atlassian Bitbucket <https://bitbucket.org/>`_  and `GNU Savannah <https://savannah.gnu.org/>`_  
among many others.

---------

Downloading source Tarballs
"""""""""""""""""""""""""""

Downloading a source tarball is typically straightforwardand you can simply navigate to a package 
maintainer's website, go into the download area and then download a tarball and it's signature file if 
available.

For example, the GNU make project download area can be found at https://ftp.gnu.org/gnu/make/ or on one of 
the numerous mirror websites.

You may be able to use the ``wget`` command to download this directly to the cluster or may have to 
transfer this manually using SCP or similar. Once downloaded you should verify the software download's 
integrity and validity.

---------

.. include:: ../referenceinfo/linux-shell/verifying-software-package-downloads.rst

---------

.. include:: ../referenceinfo/linux-shell/unpacking-a-tarball.rst

With the files now decompressed and available on the local file system you are ready to compile your 
software.

---------

Downloading source code with Git 
""""""""""""""""""""""""""""""""

Downloading source code with Git is straightforward with the Git program already installed on the clusters.
Once you have located the source code repository of interest you need only clone it to your local filesystem.

An example of this process is shown with the GNU Make project. The GNU make project source code is hosted at 
https://git.savannah.gnu.org/cgit/make.git . Opening this page in the web browser will detail some important 
infomation needed in order to download and select the version of Make we are interested in.

First clone the project using Git and the ``.git`` URL above as follows:

.. code-block:: console
    :emphasize-lines: 1

    [user@login1 [stanage] make-git]$ git clone https://git.savannah.gnu.org/git/make.git
    Cloning into 'make'...
    remote: Counting objects: 16331, done.
    remote: Compressing objects: 100% (3434/3434), done.
    remote: Total 16331 (delta 12822), reused 16331 (delta 12822)
    Receiving objects: 100% (16331/16331), 5.07 MiB | 2.79 MiB/s, done.
    Resolving deltas: 100% (12822/12822), done.

This has cloned the latest version of the master branch into our local filesystem. Now we can instruct Git 
to checkout a specific version of Make via tags after entering the subdirectory that has been cloned. 
The available tags and branches will be shown on the source code repository webpage.

.. code-block:: console
    :emphasize-lines: 1,2

    [user@login1 [stanage] make-git]$ cd make
    [user@login1 [stanage] make]$ git checkout tags/4.3
    Note: checking out 'tags/4.3'.
    
    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.
    
    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:
    
      git checkout -b new_branch_name
    
    HEAD is now at f430a65... GNU Make release 4.3

The files on the local file system are now version 4.3, have been cloned over HTTPS and Git will have 
ensured the integrity of the downloaded files automatically. You are now able to compile your software.


Compiling your source code into binaries
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compiling from source is normally straightforward assuming that the prerequisites that a software package 
has are fulfilled correctly. 

Care **must**  be taken to read through the documentation provided in the 
software package files which are usually called ``README`` or ``INSTALL`` in the top level directory of
the downloaded files. These files will dictate what specific instructions, compilers, build systems and 
versions are required for a successful compile.

With this in mind, the process is very similar for most packages and will require you to first module 
load appropriate versions of GCC and / or CMake, potentially run a specific script (e.g. ./autogen.sh or 
./build), configure the build options and then compile the source code.

e.g. compiling a more modern version of the ``make`` program on the Stanage cluster:

.. note::

    Make is a tool which controls the generation of executables and other non-source files of a program 
    from the program's source files.

    Below shows the ``make`` program provided by the base operating system using GCC 8.2 to compile a more 
    modern version of itself. This may seem quirky or recursive but is normal and will not lead to 
    conflicts or issues.    

.. code-block:: console

    [user@node001 [stanage] make]$ cd make
    [user@node001 [stanage] make]$ mkdir ./build && cd ./build
    [user@node001 [stanage] make]$ module load GCC/12.2.0
    [user@node001 [stanage] make]$ ../configure --prefix=$HOME/software/installed/make
    [user@node001 [stanage] make]$ make -j $NSLOTS
    [user@node001 [stanage] make]$ make -j $NSLOTS check
    [user@node001 [stanage] make]$ make -j $NSLOTS install

* A ``build`` directory is made and then used to keep the source files unpolluted.
* The ``../configure`` script is called from the directory above with the ``--prefix`` option set
  to where we want the installed files to be located.
* The ``make`` program provided the base operating system is then called 3 times. The first instance 
  calls the compiler to compile the code, the second instance runs the maintainers' check scripts to 
  verify successful compilation and the final instance is called to then install the files.
* The ``-j $NSLOTS`` argument supplied to ``make`` instructs ``make`` to use multiple cores with the 
  ``$NSLOTS`` variable containing the number of cores currently available in the requested interactive 
  or batch session.


  .. warning::
    Care should be taken to observe the log output generated by this process to verify successful compilation 
    and any indicated warnings or failed checks which could negatively affect your work or result in hard to 
    diagnose unexpected behaviour.

Making your compiled binaries available in the shell
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

At this stage you can typically move the generated binaries as desired and any executables (in ``./bin``) 
or libraries (typically in **./lib** and **./lib64** ) can be added to the ``PATH`` or ``LD_LIBRARY_PATH`` 
using one of the two methodologies mentioned in the :ref:`following <make_installed_software_available>` section.



.. raw:: html

    <hr class="hr-mid-section-separator">

.. _make_installed_software_available:

Making installed software available to execute
-----------------------------------------------

Software on the HPC cluster can be made available using one of the two methods below: 
using your ``.bashrc`` file or making a custom module file (preferred) to enable multiple 
versions of the same software without conflicts.

.. _software_installs_bashrc:

.. include:: ../referenceinfo/linux-shell/the-bashrc-file.rst

.. include:: ../referenceinfo/linux-shell/making-software-available-with-bashrc.rst

------------

.. _software_installs_modules:

Environment 'Modules' and their purpose
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

‘Environment Modules’ are the mechanism by which much of the software is made available to the users 
of the Stanage and Bessemer clusters. You are able to load and unload modules which make specific 
configurations of software available in a structured way which can avoid conflicts between different 
versions of the same software.

They do this by adding and removing software to the the ``PATH`` and ``LD_LIBRARY_PATH`` environment 
variables as well as set any additional required environment varibles, configuration or license files using 
the ``module load`` or  ``module unload`` functionality.

Module files are written in Lua on Stanage and TCL on Bessemer. To see examples, check the module paths with ``echo $MODULEPATH`` 
to get an idea of what these should look like.

Further detail on the environment modules system in use on the clusters can be found on the 
:ref:`modules page <env_modules>`.

.. include:: ../referenceinfo/environment-modules/creating-custom-modulefiles.rst

.. raw:: html

    <hr class="hr-mid-section-separator">

Why should I install from source?
---------------------------------

* Further performance optimisations may be available for your chosen cluster / computer.
* Dependencies may not be available with the versions required for a binary installation.
* The version of the software you desire has no precompiled binaries available.
* Your machine architecture does not have any precompiled binaries available.

.. raw:: html

    <hr class="hr-mid-section-separator">

What alternative methods exist?
-------------------------------

* Conda
* Pip
