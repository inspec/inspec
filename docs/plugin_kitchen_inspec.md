---
title: About kitchen-inspec
---

# kitchen-inspec

Use InSpec as a Kitchen verifier with `kitchen-inspec`.

Add the InSpec verifier to the `.kitchen.yml` file:

    verifier:
      name: inspec

Use a compliance profile from the Chef Compliance server:

    suites:
      - name: compliance
        run_list:
          - recipe[ssh-hardening::default]
        verifier:
          inspec_tests:
            - compliance://base/ssh

and then run the following command:

    $ inspec compliance login https://compliance.test --user admin --insecure --token ''

where `--insecure` is required when using self-signed certificates.

Use a compliance profile from the Chef Supermarket:

    suites:
      - name: supermarket
        run_list:
          - recipe[ssh-hardening::default]
        verifier:
          inspec_tests:
            - supermarket://dev-sec/ssh-baseline

Use InSpec tests from the local file system:

    suites:
      - name: local
        run_list:
          - recipe[my_cookbook::default]
        verifier:
          inspec_tests:
            - test/integration/default

