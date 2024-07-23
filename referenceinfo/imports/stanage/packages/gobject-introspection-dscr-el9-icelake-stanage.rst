GObject introspection is a middleware layer between C libraries
(using GObject) and language bindings. The C library can be scanned at
compile time and generate a metadata file, in addition to the actual
native C library. Then at runtime, language bindings can read this
metadata and automatically provide bindings to call into the C library.

