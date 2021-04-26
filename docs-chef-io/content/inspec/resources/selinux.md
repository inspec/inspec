+++
title = "selinux resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "selinux"
    identifier = "inspec/resources/os/selinux.md selinux resource"
    parent = "inspec/resources/os"
+++

Use the `selinux` Chef InSpec audit resource to test the configuration data of the SELinux policy, SELinux modules and SELinux booleans.

The `selinux` resource extracts and exposes data reported by the `sestatus`, `semodule -lfull`, and `semanage boolean -l -n` command.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v4.35.1 of InSpec.

## Syntax

The `selinux` Chef InSpec resource block tests the state and mode of SELinux policy.

    describe selinux do
      it { should be_installed }
      it { should_not be_disabled }
      it { should be_enforcing }
      it { should_not be_permissive }
    end

The `selinux` resource block also allows you to write tests for multiple modules:

    describe selinux.modules.where("zebra") do
      it { should exist }
      it { should be_installed }
      it { should be_enabled }
    end

or:

    describe selinux.modules.where(status: "installed") do
      it { should exist }
      its('count') { should cmp 404 }
    end

where:

- `.where()` specifies the parameter and expected value.
- `name`, `status`, `state`, and `priority` are valid parameters.

The `selinux` resource block also allows you to write tests for multiple booleans:

    describe selinux.booleans.where(name: "httpd_enable_homedirs") do
      it { should_not be_on }
    end

or:

    describe selinux.booleans.where(name: "xend_run_blktap", state: "on") do
      it { should exist }
      its('defaults') { should cmp "on" }
    end

- `.where()` specifies the parameter and expected value.
- `name`, `state`, and `default` are valid parameters for `booleans`.

## Examples

The following examples show how to use this Chef InSpec selinux resource.

### Test if SELinux is installed and enabled

    describe selinux do
      it { should be_installed }
      it { should_not be_disabled }
    end

### Test if SELinux is enabled and running in enforcing mode

    describe selinux do
      it { should_not be_disabled }
      it { should be_enforcing }
    end

### Test the selinux policy type

    describe selinux do
      its('policy') { should eq "targeted"}
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the SElinux policy or SElinux modules are installed on the system:

    it { should be_installed }

### be_disabled

The `be_disabled` matcher tests if the SELinux is disabled on the system:

    it { should be_disabled }

### be_enforcing

The `be_enforcing` matcher tests if the SELinux mode is set to enforcing:

    it { should be_enforcing }

### be_permissive

The `be_permissive` matcher tests if the SELinux mode is set to permissive:

    it { should be_permissive }

### be_on

The `be_on` matcher tests if the SELinux boolean is on:

    it { should be_on }

### be_enabled

The `be_enabled` matcher tests if the SElinux module is enabled:

    it { should be_enabled }

## Resource Parameters

- `names`, `status`, `states`, and `priorities` are valid parameters for SELinux policy modules.

- `names`, `status`, `states`, and `defaults` are valid parameters for SELinux `booleans`.

## Resource Parameter Examples

### modules

`modules` returns information about SELinux modules using the [semodule -lfull](https://man7.org/linux/man-pages/man8/semodule.8.html) command.

Note: The `semodule -l` command [does not provide version information](https://access.redhat.com/solutions/2760071) for newer versions of Linux-based systems like RHEL8 and Centos8, so we do not support that option.

```ruby
describe selinux.modules do
  its("names") { should include "zebra" }
  its("status") { should include "installed" }
  its("states") { should include "enabled" }
  its("priorities") { should include "100" }
end
```
### booleans

`booleans` returns information about SELinux booleans using the [semanage boolean -l -n](https://man7.org/linux/man-pages/man8/semanage-boolean.8.html) command.

```ruby
describe selinux.booleans do
  its("names") { should include "httpd_enable_homedirs" }
  its("states") { should include "on" }
  its("states") { should include "off" }
  its("defaults") { should include "on" }
  its("defaults") { should include "off" }
end
```