---
title: About kitchen-inspec
---

# kitchen-inspec

The `kitchen-inspec` driver enables InSpec to be used as a verifier within Kitchen.

To use InSpec as a verifier, add it to the kitchen.yml file:

    verifier:
      name: inspec

To define a suite that pulls its run-list from the Chef Compliance server:

    suites:
      - name: compliance
        run_list:
          - recipe[ssh-hardening]
        verifier:
          inspec_tests:
            - compliance://base/ssh

and then run the following command:

    $ inspec compliance login https://compliance.test --user admin --insecure --token ''

where `--insecure` is required when using self-signed certificates.

To define a suite that pulls its run-list from the Chef Supermarket:

    suites:
      - name: supermarket
        run_list:
          - recipe[ssh-hardening]
        verifier:
          inspec_tests:
            - supermarket://hardening/ssh-hardening

The `kitchen-inspec` driver expects tests to be located in the `test/integration` directory in a cookbook. For example::

    .
    ├── Berksfile
    ├── Gemfile
    ├── README.md
    ├── metadata.rb
    ├── recipes
    │   ├── default.rb
    │   └── nginx.rb
    └── test
        └── integration
            └── default
                ├── controls
                ├── inspec.yml
                └── libraries
