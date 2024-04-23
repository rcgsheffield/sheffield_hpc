.. _admin-code-snippets:
.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

**************
Code snippets
**************

.. note::

    In the following examples the rendered output is followed by the markup that generated it.

Highlighting
-------------
``inline code``

::
 
    ``inline code``

Also commonly used for highlighting files, software etc

-----------------------

.. _placeholder-links-section:

Links
-----

**External link**

`Research Software Engineering <https://rse.shef.ac.uk/>`_

.. code-block:: rst
    
    `Research Software Engineering <https://rse.shef.ac.uk/>`_

--------------------

**Internal link**

The following shows the placeholder for this section

.. code-block:: rst
    
    .. _placeholder-links-section:   

    Links
    =====

:ref:`placeholder-links-section` this link renders as the section title immediately below the placeholder.

:ref:`Link to the Links section<placeholder-links-section>` here we defined the link text. 

.. code-block:: rst
    
    :ref:`placeholder-links-section`

    :ref:`Link to the Links section <placeholder-links-section>`

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

.. attention::
   
   This is an example of a attention box.

::

    .. attention::
       
       This is an example of a attention box.

-----------------------------

.. warning::
    
    This is an example of a warning box.

::

    .. warning::
       
       This is an example of a warning box.

-----------------------------

.. caution::
    
    This is an example of a caution box.

::

    .. caution::
       
       This is an example of a caution box.

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

------------------------------------

.. error::
   
   This is an example of a error box.

::

   .. error::

      This is an example of a error box.

------------------------------------

.. danger::
   
   This is an example of a danger box.

::

   .. danger::

      This is an example of a danger box.

------------------------------------

.. seealso::
   
   This is an example of a see also box.

::

   .. seealso::

      This is an example of a see also box.

------------------------------------

.. admonition:: This is an example of a general admonition.

   You can make up your own admonitions too.

::

    .. admonition:: This is an example of a general admonition.

        You can make up your own admonitions too.


------------------------------------

.. raw:: html

   <style>
   .admonition.definition {
       background: lightgreen;
   }

   .admonition.definition > .admonition-title {
       background-color: green;
   }
   </style>

.. admonition::  This is an example of a general admonition with a custom colour.
   :class: definition
   
   You can make up your own admonitions with a custom colour scheme using defining a class and the CSS code to apply to it.

   Here we use the class name "definition" to target and override the CSS via a raw HTML injection.

:: 

    .. raw:: html

    <style>
    .admonition.definition {
        background: lightgreen;
    }

    .admonition.definition > .admonition-title {
        background-color: green;
    }
    </style>

    .. admonition::  This is an example of a general admonition with a custom colour.
    :class: definition
    
    You can make up your own admonitions with a custom colour scheme using defining a class and the CSS code to apply to it.

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

.. code-block:: console
   :emphasize-lines: 1
    
    $some highlighted code
    some more code

::

    .. code-block:: console
        :emphasize-lines:1
        
        $some highlighted code
        some more code

------------------------------------

::
    
    .. code-block:: <language>

        $some code

Current **<languages>** used in code-blocks in our docs are: **bash, c++, console, html+jinja, jinja, matlab, none, pycon, python, rst, shell, TCL, text**.

Grouped Tabs
-------------

The cluster tabs should be arranged from the most recent cluster to the oldest cluster.

.. tabs::

    .. group-tab:: Stanage

        .. code-block:: console

            $ srun --pty bash -i

    .. group-tab:: Bessemer

        .. code-block:: console

            $ srun --pty bash -i


.. tabs::

    .. group-tab:: Stanage

        .. code-block:: console

            $ srun --mem=8G --pty bash -i

    .. group-tab:: Bessemer

        .. code-block:: console

            $ srun --mem=8G --pty bash -i

.. code-block:: rst
    
    .. tabs::

        .. group-tab:: Stanage

            .. code-block:: console

                $ srun --pty bash -i

        .. group-tab:: Bessemer

            .. code-block:: console

                $ srun --pty bash -i


.. code-block:: rst
    
    .. tabs::

        .. group-tab:: Stanage

            .. code-block:: console

                $ srun --mem=8G --pty bash -i

        .. group-tab:: Bessemer

            .. code-block:: console

                $ srun --mem=8G --pty bash -i

