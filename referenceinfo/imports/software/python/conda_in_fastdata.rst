Home directories have limited space and can often reach their quota limit. Conda environments exponentionally take up space, if you have or want to create one or more large Conda environments
(e.g. containing bulky Deep Learning packages such as TensorFlow or PyTorch)
then there's a risk you'll quickly use up your home directory's :ref:`storage quota <home_dir>`.

To avoid this, build your conda environments in a :ref:`fastdata area <fastdata_dir>`

1. Create a ``.condarc`` file in your home directory if it does not already exist.
2. Add an ``envs_dirs:`` and ``pkgs_dirs:`` section to your ``.condarc`` file as shown below:

.. tabs::

    .. group-tab:: Stanage

        ::

            pkgs_dirs:
            - /mnt/parscratch/users/$USER/anaconda/.pkg-cache/

            envs_dirs:
            - /mnt/parscratch/users/$USER/anaconda/.envs


    .. group-tab:: Bessemer

        ::

            pkgs_dirs:
            - /fastdata/$USER/anaconda/.pkg-cache/

            envs_dirs:
            - /fastdata/$USER/anaconda/.envs

3. We recommend users create their own personal folder in the /fastdata area. As this doesn’t exist by default, you can create it with safe permissions. See :ref:`fastdata area <fastdata_dir>`
4. Then create ``.envs`` and ``.pkg-cache`` directories in your fastdata area as shown below:

.. tabs::

    .. group-tab:: Stanage

        ::

            mkdir -p /mnt/parscratch/users/$USER/anaconda/.pkg-cache/  /mnt/parscratch/users/$USER/anaconda/.envs


    .. group-tab:: Bessemer

        ::

            mkdir -p /fastdata/$USER/anaconda/.pkg-cache/  /fastdata/$USER/anaconda/.envs

Installations of environments and package caching should now occur in your fastdata area