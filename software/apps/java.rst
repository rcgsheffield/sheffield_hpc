.. _Java:

Java
====

.. sidebar:: Java

   :Latest Version: 1.8u71
   :URL: https://www.java.com/en/download/

Java is a programming language and computing platform first released by Sun Microsystems in 1995.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`), start an interactive session with the `qrsh` or `qsh` command.

The latest version of Java (currently 1.8u71) is made available with the command ::

        module load apps/java

Alternatively, you can load a specific version with one of ::

       module load apps/java/1.8u71
       module load apps/java/1.7.0u55
       module load apps/java/1.7
       module load apps/java/1.6

Check that you have the version you expect. First, the runtime ::

    java -version

    java version "1.8.0_71"
    Java(TM) SE Runtime Environment (build 1.8.0_71-b15)
    Java HotSpot(TM) 64-Bit Server VM (build 25.71-b15, mixed mode)

Now, the compiler ::

    javac -version

    javac 1.8.0_71

Virtual Memory
--------------
By default, Java requests a lot of virtual memory on startup. This is usually a given fraction of the physical memory on a node, which can be quite a lot on Iceberg. This then exceeds a user's virtual memory limit set by the scheduler and causes a job to fail.

To fix this, we have created a wrapper script to Java that uses the `-Xmx1G` switch to force Java to only request one Gigabyte of memory for its heap size. If this is insufficient, you are free to allocate as much memory as you require but be sure to request enough from the scheduler as well. You'll typically need to request more virtual memory from the scheduler than you specify in the Java `-Xmx` switch.

For example, consider the following submission script. Note that it was necessary to request 9 Gigabytes of memory from the scheduler even though we only allocated 5 Gigabytes heap size in Java. The requirement for 9 gigabytes was determined empirically  ::

  #!/bin/bash
  #Request 9 gigabytes of real memory from the scheduler (mem)
  #and 9 gigabytes of virtual memory from the scheduler (mem)
  #$ -l mem=9G -l rmem=9G

  # load the Java module
  module load apps/java/1.8u71

  #Run java program allocating 5 Gigabytes
  java -Xmx5G HelloWorld

Installation notes
------------------
These are primarily for administrators of the system.

Unzip and copy the install directory to `/usr/local/packages6/apps/binapps/java/jdk1.8.0_71/`

To fix the virtual memory issue described above, we use a wrapper around the java install that sets Java's Xmx parameter to a reasonable value.

Create the file `/usr/local/packages6/apps/binapps/java/jdk1.8.0_71/shef/java` with contents ::

  #!/bin/bash
  #
  # Java version 1.8 cannot be invoked without specifying the java virtual
  # machine size due to the limitations imposed by us via SGE on memory usage.
  # Therefore this script intercepts the java invocations and adds a
  # memory constraint parameter to java engine unless there was one already
  # specified on the command parameter.
  #
  #
    if test -z "`echo $* | grep -e -Xmx`"; then
  # user has not specified -Xmx memory requirement flag, so add it.
      /usr/local/packages6/apps/binapps/java/jdk1.8.0_71/bin/java -Xmx1G $*
  else
  # user specified the -Xmx flag, so don't add it.
      /usr/local/packages6/apps/binapps/java/jdk1.8.0_71/bin/java $*
  fi

The module file is at ``/usr/local/modulefiles/apps/java/1.8u71``. It's contents are ::

  #%Module10.2#####################################################################

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##


  proc ModulesHelp { } {
      global helpmsg
      puts stderr "\t$helpmsg\n"
  }


  set version 1.8

  set javahome /usr/local/packages6/apps/binapps/java/jdk1.8.0_71/

  if [ file isdirectory $javahome/bin ] {
      module-whatis "Sets JAVA to version $version"
      set helpmsg "Changes the default version of Java to Version $version"
      # bring in new version
      setenv JAVA_HOME $javahome
      prepend-path PATH $javahome/bin
      prepend-path PATH $javahome/shef
      prepend-path MANPATH $javahome/man
  } else {
      module-whatis "JAVA $version not installed"
      set helpmsg "JAVA $version not installed"
      if [ expr [ module-info mode load ] || [ module-info mode display ] ] {
  	# bring in new version
  	puts stderr "JAVA $version not installed on [uname nodename]"
      }
  }
