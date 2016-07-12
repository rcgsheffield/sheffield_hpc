Lua
===

.. sidebar:: Lua

   :URL: https://www.lua.org/
   :Documentation: https://www.lua.org/docs.html

Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming, object-oriented programming, functional programming, data-driven programming, and data description.

Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qrshx` command.

Lua can be loaded with ::

        module load apps/lua/5.3.3

Lua can then be run with ::

        $ lua

Installation Notes
------------------
These notes are primarily for administrators of the system.

**Version 5.3.3**

* curl -R -O http://www.lua.org/ftp/lua-5.3.3.tar.gz
* tar zxf lua-5.3.3.tar.gz
* cd lua-5.3.3
* make linux test

The modulefile is at `/usr/local/extras/modulefiles/apps/lua/5.3.3`

contains ::

  #%Module1.0

  proc ModulesHelp { } {
          puts stderr " Adds Lua to your PATH environment variable and necessary libraries"
  }

  prepend-path PATH /usr/local/extras/Lua/lua-5.3.3/src