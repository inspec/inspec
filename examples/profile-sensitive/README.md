# Example InSpec Profile with Sensitive failures

This profile demostrates resources flagged as sensitive

## Usage

```
$ inspec exec examples/profile-sensitive
....

  bob should
   ∅  eq "billy"

   expected: "billy"
        got: "bob"

   (compared using ==)

  sensitivepassword should
     ∅  eq "secret"
     *** sensitive output suppressed ***
  bob should
     ✔  eq "bob"
  sensitivepassword should
     ✔  eq "sensitivepassword"

Test Summary: 2 successful, 2 failures, 0 skipped

```
