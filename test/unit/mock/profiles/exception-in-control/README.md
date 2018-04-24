# Regression test for issue 2981

Are exceptions in control blocks, outside of describe blocks, properly handled?

Properly means the run does not abort, no stacktrace, and the control fails. Unspecified if subsequent describe blocks within the control are expected to run.