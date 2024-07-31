.. _git_stanage:

.. |softwarename| replace:: Git

git
===

.. sidebar:: git

   :Latest version: System 2.43.0; Modules 2.41.0
   :Dependencies: None
   :URL: https://git-scm.com/

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Usage
-----
The following version is provided by the operating system: 

.. code-block:: console
        
    $ git --version
    git version 2.43.0

Other versions can be activated by loading a module file: 

.. tabs::

   .. group-tab:: icelake

      .. code-block:: console 
        
         module load git/2.41.0-GCCcore-12.3.0-nodocs
         module load git/2.39.2-GCCcore-12.2.0-nodocs
         module load git/2.38.1-GCCcore-12.2.0-nodocs
         module load git/2.36.0-GCCcore-11.3.0-nodocs
         module load git/2.33.1-GCCcore-11.2.0-nodocs
         module load git/2.32.0-GCCcore-10.3.0-nodocs
         module load git/2.28.0-GCCcore-10.2.0-nodocs
         module load git/2.23.0-GCCcore-9.3.0-nodocs

   .. group-tab:: znver3
      
      .. code-block:: console
            
         module load git/2.41.0-GCCcore-12.3.0-nodocs
         module load git/2.36.0-GCCcore-11.3.0-nodocs
         module load git/2.33.1-GCCcore-11.2.0-nodocs


.. include:: /referenceinfo/imports/software/git/git-training-help-resources.rst


Installation notes
------------------

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.