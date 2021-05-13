+++
title = "Chef InSpec Common Errors"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Common Errors"
    identifier = "inspec/reference/common_errors.md Chef InSpec Common Errors"
    parent = "inspec/reference"
    weight = 150
+++

This section documents some of the Common Errors encountered while using Chef Inspec.

* `Undefined local variable or method error` while using cloud resources in InSpec profile.

    For the successful execution of an InSpec profile using **any of the cloud resources**, it is necessary to define the profile with a dependency on them.

    Some of the examples of using cloud resources in an InSpec profile are:

    ```bash
        describe aws_generic_resource(group_name: 'MyResourceGroup', name: 'MyResource') do
            its('property') { should eq 'value' }
        end
    ```

    To define dependency on **inspec-aws** resource pack use the instructions listed in [inspec-aws README](https://github.com/inspec/inspec-aws#use-the-resources)


    ```bash
        describe azure_generic_resource(group_name: 'MyResourceGroup', name: 'MyResource') do
            its('property') { should eq 'value' }
        end
    ```

    To define dependency on **inspec-azure** resource pack use the instructions listed in [inspec-azure README](https://github.com/inspec/inspec-azure#use-the-resources)


    ```bash
        describe gcp_generic_resource(group_name: 'MyResourceGroup', name: 'MyResource') do
            its('property') { should eq 'value' }
        end
    ```

    To define dependency on **inspec-gcp** resource pack use the instructions listed in [inspec-gcp README](https://github.com/inspec/inspec-gcp#use-the-resources)
    