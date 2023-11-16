+++
title = "About kitchen-inspec"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "kitchen-inspec"
    identifier = "inspec/chef/kitchen-inspec"
    parent = "inspec/chef"
    weight = 10
+++

Use Chef InSpec as a [Test Kitchen](https://kitchen.ci/) verifier with `kitchen-inspec`.

For hands-on examples, learn how to use Test Kitchen to run Chef InSpec profiles on the Learn Chef course [Validate Infrastructure Code with Test Kitchen](https://learn.chef.io/courses/course-v1:chef+LocalDev101+Perpetual/about).

Add the Chef InSpec verifier to the `.kitchen.yml` file:

```yaml
verifier:
  name: inspec
```

Use a compliance profile from the Chef Compliance server:

```yaml
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
inspec automate login https://compliance.test --user admin --insecure --token ''
```

where:

- `--insecure` is required when using self-signed certificates.

`inspec compliance` is a backwards compatible alias for `inspec automate` and works the same way:

```bash
inspec compliance login https://compliance.test --user admin --insecure --token ''
```

Use a compliance profile from the Chef Supermarket:

```yaml
suites:
  - name: supermarket
    run_list:
      - recipe[ssh-hardening::default]
    verifier:
      inspec_tests:
        - supermarket://dev-sec/ssh-baseline
```

Use Chef InSpec tests from the local file system:

```yaml
suites:
  - name: local
    run_list:
      - recipe[my_cookbook::default]
    verifier:
      inspec_tests:
        - test/integration/default
```
