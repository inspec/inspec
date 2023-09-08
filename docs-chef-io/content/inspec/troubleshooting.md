+++
title = "Chef InSpec Troubleshooting"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Troubleshooting"
    identifier = "inspec/Troubleshooting"
    parent = "inspec"
    weight = 55
+++

## Undefined Local Variable or Method Error for Cloud Resource

This error is a result of invoking a resource from one of the cloud resource packs without initializing an InSpec profile with that resource pack (AWS, Azure, or GCP) as a dependency.

InSpec profiles that use **any cloud resource** must have the resource pack defined as a dependency.

See the relevant resource pack readme for instructions:

- [inspec-aws README](https://github.com/inspec/inspec-aws#use-the-resources)
- [inspec-azure README](https://github.com/inspec/inspec-azure#use-the-resources)
- [inspec-gcp README](https://github.com/inspec/inspec-gcp#use-the-resources)

## Exit Code 174

Exit code 174 comes from running Chef InSpec 6 or greater without setting a Chef License key.
See the [InSpec install documentation](/inspec/install/) for setting a Chef License key.
See the [Chef License documentation](/licensing/) for more information about Chef licensing.
