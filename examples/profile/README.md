# Example InSpec Profile

This example shows the implementation of a InSpec profile.

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check examples/profile
I, [2015-11-21T12:44:50.851137 #20661]  INFO -- : Checking profile in examples/profile
I, [2015-11-21T12:44:50.851216 #20661]  INFO -- : Metadata OK.
D, [2015-11-21T12:44:50.851239 #20661] DEBUG -- : Found 2 rules.
D, [2015-11-21T12:44:50.851251 #20661] DEBUG -- : Verify all rules in  examples/profile/controls/example_spec.rb
D, [2015-11-21T12:44:50.851263 #20661] DEBUG -- : Verify all rules in  examples/profile/controls/gordon_spec.rb
I, [2015-11-21T12:44:50.851317 #20661]  INFO -- : Rule definitions OK.
```

## Execute a profile

To run a profile on a local machine use `inspec exec /path/to/profile`.

```bash
$ inspec exec examples/profile
..

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
2 examples, 0 failures

```
