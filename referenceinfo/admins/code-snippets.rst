.. _admin-code-snippets:
.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

**************
Code snippets
**************

In the following examples the rendered output is followed by the markup that generated it.

Highlighting
-------------
``inline code``

::
 
    ``inline code``

Also commonly used for highlighting files, software etc

-----------------------

.. _links:

Links
------

**External link**

`Research Software Engineering <https://rse.shef.ac.uk/>`_

.. code-block:: rst
    
    `Research Software Engineering <https://rse.shef.ac.uk/>`_

--------------------

**Internal link**

The following shows the placeholder for this section

.. code-block:: rst
    
    .. _links:   #This is the placeholder for the Links section
    
    Links
    =====

:ref:`links`

.. code-block:: rst

    :ref:`links`

**Internal download link**

:download:`Abaqus-2021.lua </stanage/software/modulefiles/abaqus/2021/2021.lua>`

::

    :download:`Abaqus-2021.lua </stanage/software/modulefiles/abaqus/2021/2021.lua>``

--------------------


Callout boxes
--------------

.. note::
   
   This is an example of a note box.

::

    .. note::
       
       This is an example of a note box.

-----------------------------

.. warning::
    
    This is an example of a warning box.

::

    .. warning::
       
       This is an example of a warning box.

--------------------------------

.. tip::
   
   This is an example of a tip box.

::
    
    .. tip::
    
       This is an example of a tip box.

------------------------------------

.. important::

   This is an example of an important box.

::

   .. important::
   
      This is an example of an important box.

------------------------------------

.. hint::
   
   This is an example of a hint box.

::

   .. hint::

      This is an example of a hint box.

Code blocks
------------

::
    
    This is a literal code block

::
    
    ::
        This is a literal code block
        
------------------------------------    

.. code-block::

    $ some code
    
::

    .. code-block::

        $ some code
        
--------------------------

.. code-block:: sh

    $some code

::

    .. code-block:: sh

        $some code

--------------------------

.. code-block:: console

    $some code

::

    .. code-block:: console

        $some code

------------------------------------

::

    .. code-block:: <language>

        $some code

Current <languages> used in code-blocks in our docs are **bash, c++, console, html+jinja, jinja, matlab, none, pycon, python, rst, shell, TCL, text**.

Tabs
-----

The cluster tabs should be arranged from the most recent cluster to the oldest cluster.

.. tabs::

   .. group-tab:: Stanage

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: Bessemer

    .. code-block:: console

        srun --pty bash -i

   .. group-tab:: ShARC

    .. code-block:: console

        qrshx


.. code-block:: rst
    
    .. tabs::

        .. group-tab:: Stanage

            .. code-block:: console

                srun --pty bash -i

        .. group-tab:: Bessemer

            .. code-block:: console

                srun --pty bash -i

        .. group-tab:: ShARC

            .. code-block:: console

                qrshx