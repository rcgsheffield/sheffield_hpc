.. _admin-custom-config:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:
    
Custom configuration
====================

Global.rst
-----------

Hide external link icons
^^^^^^^^^^^^^^^^^^^^^^^^

Usage: add to any page to suppress any external link icons on that page.

.. code-block:: 

    |hide-external-link-icons|

Insert line break
^^^^^^^^^^^^^^^^^^

Usage: add anywhere you would like to insert a line break 

|br|

like this:

.. code-block:: 

    Usage: add anywhere you would like to insert a line break 

    |br|

    like this:

Underline bold
---------------

:underline-bold:`Some important information`

.. code-block:: rst

    :underline-bold:`Some important information`

Underline-bold has been defined in **global.rst** and **custom.css**.

Conf.py
--------

Extensions 
^^^^^^^^^^^
* `sphinx.ext.intersphinx <https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html>`_
* `sphinx_substitution_extensions <https://pypi.org/project/Sphinx-Substitution-Extensions/#toc-entry-1>`_
* `sphinxcontrib.jquery <https://pypi.org/project/sphinxcontrib-jquery/>`_
* `sphinx_rtd_theme <https://sphinx-rtd-theme.readthedocs.io/en/stable/>`_
* `sphinx_copybutton <https://sphinx-copybutton.readthedocs.io/en/latest/>`_
* `sphinx.ext.todo <https://www.sphinx-doc.org/en/master/usage/extensions/todo.html>`_
    * ``todo_include_todos = False`` *- not included in generated documentation*
* `sphinx_tabs.tabs <https://sphinx-tabs.readthedocs.io/en/latest/>`_
    * ``sphinx_tabs_valid_builders = ['linkcheck']`` *- extension will be enabled when running the linkcheck builder* 
    * ``sphinx_tabs_disable_tab_closing = True`` *- user won't be able to close tabs in the generated documentation* 

Currently used directives 
^^^^^^^^^^^^^^^^^^^^^^^^^^
Last updated 27.03.2024

.. code-block:: 

    .. ::
    .. admonition::
    .. attention::
    .. caution::
    .. code-block::
    .. contents::
    .. cssclass::
    .. danger::
    .. dropdown::
    .. error::
    .. figure::
    .. glossary::
    .. group-tab::
    .. highlight::
    .. hint::
    .. image::
    .. important::
    .. include::
    .. list-table::
    .. literalinclude::
    .. note::
    .. raw::
    .. role::
    .. seealso::
    .. sidebar::
    .. tab::
    .. table::
    .. tabs::
    .. tip::
    .. toctree::
    .. todo::
    .. warning::



