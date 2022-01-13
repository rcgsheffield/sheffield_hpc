.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

What are environment variables?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In Linux based operating systems, environment variables are dynamic named values stored within the 
system which are used by shells or subshells (your terminal) to facilitate functionality. Simply put, 
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