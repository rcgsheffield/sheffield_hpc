.. _installing-personal-software-installations:

Installing software to the clusters
===================================

.. sidebar:: Contents

    .. contents::
        :depth: 2
        :local:
  

As :ref:`Bessemer <bessemer>` and :ref:`ShARC <sharc>`  are general purpose HPC clusters, 
we provide and maintain only the most essential and most popular applications on them.

We are aware of our users' need to run applications that are specific to their own subject 
areas of research and as such we permit the installation of software within users' personal directories 
and special shared areas on the clusters for public use.

This option should be seen as a service without support as we will expect such users to be able to 
tackle the problems encountered during installations on their own. We will however help make such 
software available to other Bessemer and ShARC users by copying/installing scripts to shared locations.

.. raw:: html

    <hr class="hr-mid-section-separator">

General background prequisites
------------------------------

What is source code?
^^^^^^^^^^^^^^^^^^^^

Source code is the collection of code written in a human readable programming language for a given 
software package.Source code is transformed by an assembler or compiler into machine code that can be 
executed by a computer.

Compiling and what a compiler does is explained below but the differences between 
`assemblers and assembler code versus compilers and compiler code <https://www.geeksforgeeks.org/language-processors-assembler-compiler-and-interpreter/>`_ 
is out of the scope of the explanation for software installation on the HPC clusters.

---------

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

What are environment variables?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In Linux based operating systems environment variables are dynamic named values stored within the 
system which are used by shells or subshells (your terminal) to facillitate functionality. Simply put, 
they are variables with a name and value which perform a function in how the operating system and 
applications work.

These variables have a simple format:

.. code-block:: bash

    KEY=value
    KEY="Some other value"
    KEY=value1:value2

.. important::

    * The variable names are case sensitive and by convention they are UPPER CASE.
    * If a variable has multiple values they should be separated by a colon ``:``.
    * Variables **do not** have spaces around the equals ``=`` sign.

Note that **environment variables** are variables that are available system-wide and are inherited 
by all spawned child processes and shells where **shell variables** are variables that apply only to 
the current shell instance. Each shell such as bash (the default on the clusters), has its own 
set of internal shell variables.

---------

Listing environment variables
"""""""""""""""""""""""""""""

* **env** – This command allows you to run another program in a custom environment without modifying 
  the current one. When used without an argument it will print a list of the current environment variables.
* **printenv** – This command prints all or the specified environment variables.
* **echo $MYVARIABLE** - The command **echo** when supplied with a variable name prefixed with ``$`` will 
  print that variable. An alternative syntax would be **echo ${MYVARIABLE}**. Variables can also be 
  utilized in bash scripts in this manner.

---------

Setting environment variables
"""""""""""""""""""""""""""""

Manually setting environment variables is trivial and can be accomplished with the commands below.

* **set** – The command sets or unsets shell variables. When used without an argument it will print a 
  **list** of all variables including environment and shell variables, and shell functions.
* **unset** – The command deletes shell and environment variables.
* **export** – The command sets environment variables.

.. caution::
    Setting or changing environment variables can lead to a corrupted shell environment which can leave you 
    unable to login or run programs. Manually changing values should be avoided in favour of using the 
    :ref:`modules system <software_installs_modules>`.

    If you find your shell environment is behaving oddly, programs are no longer available and 
    you suspect you may have corrupted your current shell environment by changing environment variables 
    in the terminal you can simply log out and log back in to clear the problem.

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

---------

The .bashrc file and its purpose
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``.bashrc`` file is a hidden script file located in a user's home directory which runs 
when the user logs in using the bash shell. The contents of ``.bashrc`` can be changed to define 
functions, command aliases, and customize the bash shell to the user's liking.

As this file is executed when the user logs in, it can be customised to add additional directories 
to the ``PATH`` and ``LD_LIBRARY_PATH`` in order to make software available to the shell.

.. caution::
    Like setting or changing environment variables, editing the ``.bashrc`` file can lead to a 
    corrupted shell environment which can leave you unable to login or run programs. 

    Please take care if editing this file and consider using the 
    :ref:`modules system <software_installs_modules>` to add directories to the ``PATH`` and 
    ``LD_LIBRARY_PATH`` to avoid inadvertent mistakes.
    
    If you find your shell environment is behaving oddly, programs are no longer available and 
    you suspect you may have corrupted your shell environment by editing the ``.bashrc`` file you 
    can reset it with the command ``resetenv`` or ``/usr/local/scripts/resetenv`` then 
    logging out and back in.

Adding a directory such as a personal installation directory with executables and libraries can be 
achieved as below: 

.. code-block:: bash

    export PATH=$HOME/software/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/software/lib:$LD_LIBRARY_PATH

.. note::
    The code above adds the personal directory to the front of each list - the order of the directories 
    in each list is important as the highest priority for the list is read from left to right.

    This means that in the above case, the personal installations take priority and the shell will 
    preferentially run the binaries from the personal installations if there are multiple locations 
    with the same named executable or library.

---------

.. _software_installs_modules:

Using modules to make software executables available
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



Module files are written in TCL, please have a look at some of our modules in /usr/local/modulefiles/ 
to get an idea of what these should look like.

.. raw:: html

    <hr class="hr-mid-section-separator">

Installing software from binaries
---------------------------------

.. caution::

    Installing from pre-compiled binaries does not remove the need to supply correctly versioned 
    dependencies (e.g. shared libraries). 
    
    Using incorrectly versioned dependencies may allow a program to function but this could lead to 
    instability and software errors.

1) binary installs - copy the relevant binary files to a folder of
your choice (in general create a folder with the software name e.g.
plink_install). The path to this folder is:  

.. code-block:: bash

    /home/username/plink_install

The executable can then be run in 2 ways: 

.. code-block:: bash

    cd /home/username/plink_install

If the binary is called plink then run it using: 

.. code-block:: bash

    ./plink

OR, from anywhere in your directory structure run using

.. code-block:: bash

    /home/username/plink_install/plink

.. raw:: html

    <hr class="hr-mid-section-separator">

Installing software by compiling from source
--------------------------------------------


Some software installation procedures require running a command called configure that sets up the 
installation in a default location which is usually a system area where users do not have write access. 
If you do need to run configure to install a program on iceberg under your area you can use the following 
parameter to configure to install the software on a specified location.

.. code-block:: bash

    ./configure --prefix /home/csxyz

We shall make available an area ( under /usr/local/extras ) with necessary disk space for the work,
we shall give the principle installer full access rights to this area for installation work,
if and when necessary we shall help install the execution scripts to a commonly accessible area and create module files.

The fact that during the installation there will be no (write access) to some system areas should not present any major problems.

Here are some technical hints;

Extra libraries that may be needed can be installed under the programs own directory and
the LD_LIBRARY_PATH system variable can be altered to add this directory to it;
i.e. LD_LIBRARY_PATH=$LD_LIBRARY_PATH:location_of_your_own_library
Similarly PATH variable can be altered either by
PATH=$PATH:location_of_your_own_executables
or
by using the addpath locally written command. Just type addpath for further info.
the above changes can be inserted into your own .bashrc file to automate it all
Finally we can create a module that implements these so that anyone can use the module load command to access the software. If you like to take advantage of this option contact research-it@sheffield.ac.uk .

Single user software install: users can install software in their /home or /data directories as follows:


2) build & install source code - copy the source code (normally a .zip
or .tar.gz) to your /home or /data areas. Extract the files using
unzip or tar xf, & then cd into the source code directory. It is
important to read the README file here since this will give details on
how to build the code & any dependencies etc. However in general the
build process is as follows:

Source code is for an application called wobble.

Install the software in a directory called wobble_install in /data:

.. code-block:: bash

    mkdir /data/username/wobble_install
    #cd into the source code directory which we extracted
    cd wobble
    module load dev/gcc/4.9.4 (altho the README file may suggest a
    different gcc version &/or cmake)
    ./configure --prefix=/data/username/wobble_install
    make install

If the program executable is called wobble, located in
``/data/username/wobble_install/bin``, then it can be run using:

.. code-block:: bash

    /data/username/wobble_install/bin/wobble

Note for both (1) & (2) above you can add the directories containing the 
executables to the PATH variable so that to run the executables you just type 
their names i.e. plink or wobble:

export PATH=path_to_executable_folder:$PATH

NOTE on Library dependencies - sometimes during a build you will get errors related to 
missing libraries or other dependencies (these should be specified in the README file). 
However before you trigger a help desk call check to see if the library or other dependency is
available on ShARC. Do this using: 

.. code-block:: bash

    module avail
    
or: 

.. code-block:: bash

    module avail |& grep -i name_of_dependency

If it is available then load it using:

.. code-block:: bash

    module load name_module


.. raw:: html

    <hr class="hr-mid-section-separator">

Why should I install from source if binaries are available?
------------------------------------------------------------

* Performance optimisations
* Dependencies may not be available with the versions used for binary compilation.