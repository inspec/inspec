---
title: About kitchen-inspec
---

# kitchen-inspec

Use Chef InSpec as a Kitchen verifier with `kitchen-inspec`.

Add the Chef InSpec verifier to the `.kitchen.yml` file:

```YML
  verifier:
    name: inspec
```

Use a compliance profile from the Chef Compliance server:

```YML
  suites:
    - name: compliance
      run_list:
        - recipe[ssh-hardening::default]
      verifier:
        inspec_tests:
          - compliance://base/ssh
```

and then run the following command:

```bash
  $ inspec compliance login https://compliance.test --user admin --insecure --token ''
```

where `--insecure` is required when using self-signed certificates.

Use a compliance profile from the Chef Supermarket:

```YML
  suites:
    - name: supermarket
      run_list:
        - recipe[ssh-hardening::default]
      verifier:
        inspec_tests:
          - supermarket://dev-sec/ssh-baseline
```

Use Chef InSpec tests from the local file system:

```YML
  suites:
    - name: local
      run_list:
        - recipe[my_cookbook::default]
      verifier:
        inspec_tests:
          - test/integration/default
```

Check out [Detect and correct with Test Kitchen](https://learn.chef.io/modules/detect-correct-kitchen#/) on Learn Chef Rally for a hands-on look at how to use Test Kitchen to run Chef InSpec profiles.
