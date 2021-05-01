---
title: About the kernel_module Resource
platform: linux
---

# kernel_module

Use the `kernel_module` Chef InSpec audit resource to test kernel modules on Linux
platforms. These parameters are located under `/lib/modules`. Any submodule may
be tested using this resource.

The `kernel_module` resource can also verify if a kernel module is `blacklisted`
or if a module is disabled via a fake install using the `bin_true` or `bin_false`
method.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `kernel_module` resource block declares a module name, and then tests if that
module is a loaded kernel module, if it is enabled, disabled or if it is
blacklisted:

    describe kernel_module('module_name') do
      it { should be_loaded }
      it { should_not be_disabled }
      it { should_not be_blacklisted }
    end

where

* `'module_name'` must specify a kernel module, such as `'bridge'`
* `{ should be_loaded }` tests if the module is a loaded kernel module
* `{ should be_blacklisted }` tests if the module is blacklisted or if the module is disabled via a fake install using /bin/false or /bin/true
* `{ should be_disabled }` tests if the module is disabled via a fake install using /bin/false or /bin/true

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### version

The `version` property tests if the kernel module on the system has the correct version:

    its('version') { should eq '3.2.2' }

### Test a kernel module's 'version'

      describe kernel_module('bridge') do
        it { should be_loaded }
        its('version') { should cmp >= '2.2.2' }
      end

### Test if a kernel module is loaded, not disabled, and not blacklisted

      describe kernel_module('video') do
        it { should be_loaded }
        it { should_not be_disabled }
        it { should_not be_blacklisted }
      end

### Check if a kernel module is blacklisted

      describe kernel_module('floppy') do
        it { should be_blacklisted }
      end

### Check if  a kernel module is *not* blacklisted and is loaded

      describe kernel_module('video') do
        it { should_not be_blacklisted }
        it { should be_loaded }
      end

### Check if  a kernel module is disabled via 'bin_false'

      describe kernel_module('sstfb') do
        it { should_not be_loaded }
        it { should be_disabled }
      end

### Check if  a kernel module is 'blacklisted'/'disabled' via 'bin_true'

      describe kernel_module('nvidiafb') do
        it { should_not be_loaded }
        it { should be_blacklisted }
      end

### Check if  a kernel module is not loaded

      describe kernel_module('dhcp') do
        it { should_not be_loaded }
      end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).


### be_blacklisted

The `be_blacklisted` matcher tests if the kernel module is a blacklisted module:

    it { should be_blacklisted }

### be_disabled

The `be_disabled` matcher tests if the kernel module is disabled:

    it { should be_disabled }

### be_loaded

The `be_loaded` matcher tests if the kernel module is loaded:

    it { should be_loaded }
