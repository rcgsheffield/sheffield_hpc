git
===

.. sidebar:: git

   :Latest version: 2.39.2
   :Dependencies: None
   :URL: https://git-scm.com/

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Usage
-----
Two version of git are available - an older version that is provided by the operating system and is available on both the login nodes and worker nodes: ::

    $ git --version
    git version 1.8.3.1

And a newer version that can be activated by loading a module file and is only available on the worker nodes: ::

   $ module load git/2.39.2-GCCcore-10.3.0-nodocs 
   $ git --version
   git version 2.39.2


.. include:: /referenceinfo/imports/software/git/git-training-help-resources.rst


Installation notes
------------------

The git module has been installed using Easybuild 4.4.0 and a custom made git-2.39.2-GCCcore-10.3.0-nodocs.eb which can be found on system in the installation 
directory: ``/usr/local/packages/live/eb/git/2.39.2-GCCcore-10.3.0-nodocs/easybuild``
