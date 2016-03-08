# Example InSpec Profile

This example shows the use of InSpec [profile](../../docs/profiles.rst) inheritance.

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check examples/inheritance --profiles-path examples
```

## Execute a profile

To run a profile on a local machine use `inspec exec /path/to/profile`.

```bash
$ inspec exec examples/inheritance --profiles-path examples
```
