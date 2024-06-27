.. _nlopt_stanage:

NLopt
=====

.. sidebar:: NLopt
   
   :URL: https://nlopt.readthedocs.io/
   :Documentation: https://github.com/stevengj/nlopt/

NLopt is a library for nonlinear local and global optimization, for functions with and without gradient information. It is designed as a simple, unified interface and packaging of several free/open-source nonlinear optimization libraries.

Usage
-----

NLopt can be activated using one of: ::

   module load NLopt/2.6.1-GCCcore-9.3.0
   module load NLopt/2.6.2-GCCcore-10.2.0
   module load NLopt/2.7.0-GCCcore-11.2.0
   module load NLopt/2.7.1-GCCcore-11.3.0
   module load NLopt/2.7.1-GCCcore-12.2.0

Example
-------

An example program that uses NLopt (taken from the NLopt `documentation <https://nlopt.readthedocs.io/en/latest/NLopt_Tutorial/>`_).
Save the file as ``example.c``:

.. code-block:: c

   #include <stdio.h>
   #include <math.h>
   #include <nlopt.h>

   // Objective function
   double myfunc(unsigned n, const double *x, double *grad, void *my_func_data)
   {
      if (grad) {
         grad[0] = 0.0;
         grad[1] = 0.5 / sqrt(x[1]);
      }
      return sqrt(x[1]);
   }

   // Constraint data structure
   typedef struct {
      double a, b;
   } my_constraint_data;

   // Constraint function
   double myconstraint(unsigned n, const double *x, double *grad, void *data)
   {
      my_constraint_data *d = (my_constraint_data *) data;
      double a = d->a, b = d->b;
      if (grad) {
         grad[0] = 3 * a * (a*x[0] + b) * (a*x[0] + b);
         grad[1] = -1.0;
      }
      return ((a*x[0] + b) * (a*x[0] + b) * (a*x[0] + b) - x[1]);
   }

   int main()
   {
      double lb[2] = { -HUGE_VAL, 0 }; /* lower bounds */
      nlopt_opt opt;

      opt = nlopt_create(NLOPT_LD_MMA, 2); /* algorithm and dimensionality */
      nlopt_set_lower_bounds(opt, lb);
      nlopt_set_min_objective(opt, myfunc, NULL);

      // Adding inequality constraints
      my_constraint_data data[2] = { {2, 0}, {-1, 1} };
      
      nlopt_add_inequality_constraint(opt, myconstraint, &data[0], 1e-8);
      nlopt_add_inequality_constraint(opt, myconstraint, &data[1], 1e-8);

      nlopt_set_xtol_rel(opt, 1e-4); // Stopping criteria

      double x[2] = { 1.234, 5.678 };  /* `*`some` `initial` `guess`*` */
      double minf; /* `*`the` `minimum` `objective` `value,` `upon` `return`*` */
      // Perform optimisation
      if (nlopt_optimize(opt, x, &minf) < 0) {
         printf("nlopt failed!\n");
      }
      else {
         printf("found minimum at f(%g,%g) = %0.10g\n", x[0], x[1], minf);
      }

      nlopt_destroy(opt); // Clean up

      return 0;
   }

Build this using:

.. code-block:: sh

   cc example.c -o example -lnlopt -lm

Then run using:

.. code-block:: sh

    ./example

which should print the minimum found in the following format: ::

   found minimum at f(0.333334,0.296296) = 0.544330847

Installation method
-------------------


This was installed as an Easybuild dependency for `R <https://docs.hpc.shef.ac.uk/en/latest/stanage/software/apps/R.html>`_
