.. table:: **DIRECTORY OPERATIONS** 
   :align: left
   :widths: auto

   ================  ===============================
   pwd               Show current working directory
   mkdir *dir*       Make a new working directory (*dir*)
   cd *dir*          Change directory to *dir*
   cd ..             Go up a directory
   cd -              Go to previous directory
   cd *or* cd ~      Navigate to home directory
   du -sh *dir*      Size of directory *dir*
   rmdir *dir*       Deletes empty directory *dir*
   rm -r *dir*       Deletes directory *dir* and contents 
   mv *dir* *dir2*   Rename *dir* to *dir2*
   ls                List contents of directory
   ================  ===============================

.. table:: **LS OPTIONS**
   :align: left
   :widths: auto

   ========    =================================
   -lrath      A combination of options             
   -a          Show all (including hidden)
   -R          Recursive list
   -r          Reverse order
   -t          Sort by last modified
   -S          Sort by file size
   -l          Long listing format
   -h          Human-readable memory
   ========    =================================           

.. table:: **FILE OPERATIONS** 
   :align: left
   :widths: auto

   ========================   =============================================
   touch *file_name*          Create new file *file_name*
   cat *file_name*            Display contents of file *file_name*
   cat file1 file2 > file3    Concatenate two files in a new file (file3)
   mv file /new/file/path/    Moves the file to the new location
   cp file /new/file/path/    Copies the file to the new location
   mv *file* *file_new*       Renames the *file* to *file_new*
   rm *file*                  Deletes the *file*
   head *file*                Display first 10 lines of *file*
   tail *file*                Display last 10 lines of *file*
   ========================   =============================================

.. table:: **BASH SHORTCUTS**
   :align: left
   :widths: auto
   
   ========    ================================
   CTRL-c      Stop current execution
   CTRL-r      Search history
   history     Show history
   !1234       Repeat 1234 command in history
   !!          Repeat last command in history
   clear       Clears the terminal
   ========    ================================

.. table:: **COMMAND LISTS**
   :align: left
   :widths: auto
           
   ===============       ================================
   cmd1 ; cmd2           Run cmd1 then cmd2
   cmd1 && cmd2          Run cmd2 if cmd1 is successful
   cmd1 || cmd2          Run cmd2 if cmd1 is not successful
   cmd &                 Run cmd in a subshell
   ===============       ================================

.. table:: **SEARCH FILES**
   :align: left
   :widths: auto

   ============================     ======================================================
   grep *pattern* *files*           Search for *pattern* in *files*
   grep -i                          Case insensitive search
   grep -r                          Recursive search
   grep -v                          Inverted search
   grep -o                          Show matched part of file only
   find /dir/ -name *dir_name*      Find files starting with name in dir
   find /dir/ -mmin num             Find files modified less than num minutes ago in dir
   whereis *command*                Find binary / source / manual for command
   locate *file*                    Find file (quick search of system index)
   ============================     ======================================================

.. table:: **FILE PERMISSIONS**
   :align: left
   :widths: auto
   
   =============================    ================================
   chmod777 *file*                  File read, write, execute permissions to everyone 
   chmod755 *file*                  Full permission to owner, read permissions for others  
   chmod766 *file*                  Full permission to owner, read and write for others 
   chown *user* *file*              Change file ownership 
   chown *user*:*group* *file*      Change file owner and group   
   =============================    ================================


.. table:: **ENVIRONMENT VARIABLES**
   :widths: auto
   
   ===================      =================================================
   **Listing environment variables**
   --------------------------------------------------------------------------
   env                      List current environment variables
   printenv                 List specified environment variables
   echo ${MYVARIABLE}       Print specified variable
   **Setting environment variables**
   --------------------------------------------------------------------------
   set                      Sets or unsets shell variables
   unset                    Deletes shell and environment variables
   export NAME=value        Sets environment variables
   **Commonly used environment variables**
   --------------------------------------------------------------------------
   HOME                     Path of your user’s home directory
   USER                     Username of your current user.
   PATH                     Any executables in the listed directories will be available from the terminal via their name.
   LD_LIBRARY_PATH          Any libraries in the listed directories will be available to programs.
   ===================      =================================================

 
.. tip:: 

    You can find more information about most commands with the :ref:`man<man_pages>` command. i.e *man <command>*
