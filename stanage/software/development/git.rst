.. _git_stanage:

git
===

.. sidebar:: git

   :Latest version: 2.39.2
   :Dependencies: None
   :URL: https://git-scm.com/

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Usage
-----
Two version of git are available - an older version that is provided by the operating system: ::

    $ git --version
    git version 1.8.3.1

And a much newer version that can be activated by loading a module file: ::

   $ module load git    # OR
   $ module load git/2.39.2-GCCcore-12.2.0-nodocs
   $ git --version
   git version 2.39.2


.. include:: /referenceinfo/imports/software/git/git-training-help-resources.rst


Installation notes
------------------

The git module has been installed using Easybuild and a custom ``git-2.39.2-GCCcore-12.2.0-nodocs.eb`` which can be found on system in the installation 
directory: ``/opt/apps/testapps/common/easybuild/easyconfigs/stanage/easyconfigs/g/git``
