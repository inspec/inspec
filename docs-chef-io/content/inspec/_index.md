+++
title = "An Overview of Chef InSpec"
draft = false
gh_repo = "inspec"

[cascade]
  product = ["inspec"]

[menu]
  [menu.inspec]
    title = "Chef InSpec Overview"
    identifier = "inspec/_index.md Chef InSpec Overview"
    parent = "inspec"
    weight = 10
+++

Chef InSpec is an open-source framework for testing and auditing your applications and infrastructure. Chef InSpec works by comparing the actual state of your system with the desired state that you express in easy-to-read and easy-to-write Chef InSpec code. Chef InSpec detects violations and displays findings in the form of a report, but puts you in control of remediation.

{{< note >}}

Versions of Chef InSpec 4.0 and later require accepting the EULA. Please
visit the [license acceptance page](/chef_license_accept/) for more information.

{{< /note >}}

## Getting started with Chef InSpec

Below are some of the core concepts that make up Chef InSpec.

### Create a profile

[Profiles](/inspec/profiles/) are the core of the Chef InSpec testing experience. Use Chef InSpec
profiles to manage everything you need to run a security or compliance scan--attributes,
metadata, and the tests themselves.

### Add your tests

You can create tests three different ways: By composing your own tests, by
including tests from the [Chef Supermarket](https://supermarket.chef.io/)
or by adding tests from the [Dev-Sec Project](http://dev-sec.io/) as dependencies.
You can also customize your tests--pulling in the tests from our Supermarket and
change them to suit your unique needs with the easy-to-read and easy-to-write Chef
InSpec domain specific language.

### Target your system

Run your tests wherever your infrastructure is--locally or in the cloud.  Chef
InSpec is designed for platforms and treats operating systems as special cases.
Chef InSpec helps you, whether you use Windows Server on your own hardware or
run Linux in Docker containers in the cloud. As for the cloud, you can use Chef
InSpec to target applications and services running on AWS and Azure.

### Resources

Chef InSpec has 80+ [resources](/inspec/resources/) ready use--apache to zfs pool.
If you need a solution that we haven’t provided, you can write your own [custom
resource](/inspec/dsl_resource/).
