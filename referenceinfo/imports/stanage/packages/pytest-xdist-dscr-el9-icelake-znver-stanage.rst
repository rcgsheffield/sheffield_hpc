xdist: pytest distributed testing plugin

The pytest-xdist plugin extends pytest with some unique test execution modes:

test run parallelization: if you have multiple CPUs or hosts you
can use those for a combined test run. This allows to speed up
development or to use special resources of remote machines.

--looponfail: run your tests repeatedly in a subprocess. After
each run pytest waits until a file in your project changes and
then re-runs the previously failing tests. This is repeated
until all tests pass after which again a full run is
performed.

Multi-Platform coverage: you can specify different Python
interpreters or different platforms and run tests in parallel on
all of them.

Before running tests remotely, pytest efficiently “rsyncs” your
program source code to the remote place. All test results are reported
back and displayed to your local terminal. You may specify different
Python versions and interpreters.

