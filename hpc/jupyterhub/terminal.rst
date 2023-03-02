.. _jh_terminal:

Jupyter's web terminal
======================

You can start a terminal  

* Via the top menu bar (**File**, **New**, **Terminal**) or
* Via the :ref:`Files <jh_jupyterlab>` Launcher tab.

.. image:: /images/jupyterhub/jupyterlab-terminal.png

You can use this terminal to perform any command-line-only operation on the cluster, including:

* **Managing versions of Notebooks** / other code 
  using `version control software such as git <https://swcarpentry.github.io/git-novice/>`__
  (as illustrated above);
* **Searching for files/directories**;
* **Configuring Python or R environments** 
  (although there is an (enabled) plug-in for 
  creating/selecting environments and 
  installing/upgrading/removing packages 
  :ref:`using Jupyter's graphical interface <jh_conda>`);
* :ref:`Triggering the automounting of directories <jh_automount_issue>` not visible in JupyterHub's :ref:`file browser <jh_jupyterlab>`.

Having a terminal interface available within the browser 
negates the need to separately :ref:`log into the cluster via SSH <connecting>`
to access the command-line.

Limitations:

* Not all keyboard shortcuts that typically work in terminal programs work within this web console:

  * *tab* can be used for tab completion
  * but *Ctrl-C* kills the program running in the terminal
  * To copy text, select it, right-click and click *Copy*.
  * To paste text, right-click and click *Paste*.

* You cannot start graphical programs (e.g. ``xeyes``) from this terminal.
