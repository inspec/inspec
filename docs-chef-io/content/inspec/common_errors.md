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

* `Undefined local variable or method error for 'aws_eks_clusters' resource`

    Syntax of using AWS resource in InSpec profile to test eks clusters:

    ```bash
        describe aws_eks_clusters.where( failed: true ) do
            it { should_not exist }
        end
    ```

    For successful execution, it is necessary to define an InSpec Profile with a dependency on **inspec-aws** resource pack. It can be done using instructions in [inspec-aws README](https://github.com/inspec/inspec-aws#use-the-resources)
    