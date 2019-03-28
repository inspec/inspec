# Example InSpec Profile

This example shows the implementation of an InSpec [profile](../../docs/profiles.md).

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check examples/profile
Summary
-------
Location: examples/profile
Profile: profile
Controls: 4
Timestamp: 2016-03-24T16:20:21+00:00
Valid: true

Errors
------

Warnings
--------
```

## Execute a profile

To run all **supported** controls on a local machine use `inspec exec /path/to/profile`.

```bash
$ inspec exec examples/profile
..

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
8 examples, 0 failures
```

## Execute a specific control from a profile

To run one control from the profile use `inspec exec /path/to/profile --controls name`.

```bash
$ inspec exec examples/profile --controls tmp-1.0
.

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
1 examples, 0 failures
```
