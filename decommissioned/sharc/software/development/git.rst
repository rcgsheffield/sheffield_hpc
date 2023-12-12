.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

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

   $ module load dev/git/2.39.2/gcc-4.9.4
   $ git --version
   git version 2.39.2



.. include:: /referenceinfo/imports/software/git/git-training-help-resources.rst


Installation notes
------------------

2.39.2
^^^^^^

* :download:`Install script </decommissioned/sharc/software/install_scripts/dev/git/2.39.2/gcc-4.9.4/install_git.sh>`
* :download:`Module file </decommissioned/sharc/software/modulefiles/dev/git/2.39.2/gcc-4.9.4>`, located on the system at ``/usr/local/modulefiles/dev/git/2.39.2/gcc-4.9.4``


2.39.1
^^^^^^

Retired due to CVE.

* :download:`Install script </decommissioned/sharc/software/install_scripts/dev/git/2.39.1/gcc-4.9.4/install_git.sh>`
* :download:`Module file </decommissioned/sharc/software/modulefiles/dev/git/2.39.1/gcc-4.9.4>`, located on the system at ``/usr/local/modulefiles/dev/git/2.39.1/gcc-4.9.4``

2.35.2
^^^^^^

Retired due to CVE-2022-41903 and CVE-2022-23521.

* :download:`Install script </decommissioned/sharc/software/install_scripts/dev/git/2.35.2/gcc-4.9.4/install.sh>`
* :download:`Module file </decommissioned/sharc/software/modulefiles/dev/git/2.35.2/gcc-4.9.4>`, located on the system at ``/usr/local/modulefiles/dev/git/2.35.2/gcc-4.9.4``

2.19.2
^^^^^^

Retired due to CVE-2022-24765.

* :download:`Install script </decommissioned/sharc/software/install_scripts/dev/git/2.19.2/gcc-4.9.4/install.sh>`
* :download:`Module file </decommissioned/sharc/software/modulefiles/dev/git/2.19.2/gcc-4.9.4>`, located on the system at ``/usr/local/modulefiles/dev/git/2.19.2/gcc-4.9.4``

