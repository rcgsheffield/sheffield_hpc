pkg-config is a helper tool used when compiling applications and libraries.
It helps you insert the correct compiler options on the command line so an
application can use gcc -o test test.c `pkg-config --libs --cflags glib-2.0`
for instance, rather than hard-coding values on where to find glib (or other
libraries).

