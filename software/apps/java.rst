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

Installation notes
------------------
These are primarily for administrators of the system.

Unzip and copy the install directory to `/usr/local/packages6/apps/binapps/java/jdk1.8.0_71/`

By default, Java requests lots of virtual memory on startup (usually a given fraction of the physical memory on a node, which can be quite a lot on Iceberg) which then exceeds a users virtual memory limit set by the scheduler. Requesting more virtual memory for the job will let Java start, but uses up resources unnecessarily and can result in long queue times. We use a wrapper around the java install that sets Java's Xmx parameter to a reasonable value.

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
