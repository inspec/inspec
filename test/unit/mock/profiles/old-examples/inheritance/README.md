# Example InSpec Profile

This example shows the use of InSpec [profile](../../docs/profiles.rst) inheritance.

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check examples/inheritance
```

## Execute a profile

To run a profile on a local machine use `inspec exec /path/to/profile`. All dependencies are automatically resolved.

```bash
$ inspec exec examples/inheritance
```

## Set attributes for dependent profiles

Without setting attributes, an `inspec exec` would return the following:

```
$ inspec git:(master) ✗ b inspec exec examples/inheritance

Profile: InSpec example inheritance (inheritance)
Version: 1.0.0
Target:  local://


  ○  gordon-1.0: Verify the version number of Gordon (1 skipped)
     ○  Can't find file "/tmp/gordon/config.yaml"
     ✔  File  content should match nil
  ✔  ssh-1: Allow only SSH Protocol 2
     ✔  File /bin/sh should be owned by "root"

  File /tmp
     ✔  should be directory
  alice should
     ✖  eq "bob"

     expected: "bob"
          got: "alice"

     (compared using ==)

  should eq
     ✖  "secret"

     expected: "secret"
          got: nil

     (compared using ==)


Test Summary: 3 successful, 2 failures, 1 skipped
```

To pass in attributes, just call:

```
$ inspec exec examples/inheritance --attrs examples/profile-attribute.yml
```
