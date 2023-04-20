.. _admin-code-snippets:

**************
Code snippets
**************

Formatting
===========
::

    * This is a bullet point

* This is a bullet point

-----------------------

Callout boxes
=============


::

    .. note::
       This is an example of a note box.

.. note::
   
   This is an example of a note box.

-----------------------------

::

    .. warning::
       
       This is an example of a warning box.

.. warning::
    
    This is an example of a warning box.

--------------------------------

::
    
    .. tip::
    
       This is an example of a tip box.

.. tip::
   
   This is an example of a tip box.

------------------------------------

::

   .. important::
   
      This is an example of an important box.

.. important::

   This is an example of an important box.

------------------------------------

::

   .. hint::

      This is an example of a hint box.

.. hint::
   
   This is an example of a hint box.


Code blocks
===========
::
    
    ::
        This is a literal code block
        
::
    
    This is a literal code block
    

::

    .. code-block::

        $ some code
        
.. code-block::

    $ some code
    
--------------------------

::

    .. code-block:: sh

        $some code

.. code-block:: sh

    $some code

--------------------------

::

    .. code-block:: console

        $some code

.. code-block:: console

    $some code

::

    .. code-block:: <language>

        $some code

Current <language> used in code-blocks in our docs are **bash, c++, console, html+jinja, jinja, matlab, none, pycon, python, rst, shell, TCL, text**.

Tabs
====

The correct order for cluster tabs is newest to oldest cluster.

.. code-block:: rst
    
    .. tabs::

        .. group-tab:: Stanage

            .. code-block:: console

                srun --pty bash -i

        .. group-tab:: Bessemer

            .. code-block:: console

                srun --pty bash -i

        .. group-tab:: Sharc

            .. code-block:: console

                qrshx

.. tabs::

   .. group-tab:: Stanage

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: Bessemer

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: Sharc

    .. code-block:: console

        qrshx


