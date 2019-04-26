---
title: About the package Resource
platform: os
---

# package

Use the `package` Chef InSpec audit resource to test if the named package and/or package version is installed on the system.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `package` resource block declares a package and (optionally) a package version:

    describe package('name') do
      it { should be_installed }
    end

where

* `('name')` must specify the name of a package, such as `'nginx'`
* `be_installed` is a valid matcher for this resource

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test if NGINX version 1.9.5 is installed

    describe package('nginx') do
      it { should be_installed }
      its('version') { should eq '1.9.5' }
    end

### Test that a package is not installed

    describe package('some_package') do
      it { should_not be_installed }
    end

### Test that telnet is not installed

    describe package('telnetd') do
      it { should_not be_installed }
    end

    describe inetd_conf do
      its('telnet') { should eq nil }
    end

### Test if ClamAV (an antivirus engine) is installed and running

    describe package('clamav') do
      it { should be_installed }
      its('version') { should eq '0.98.7' }
    end

    describe service('clamd') do
      it { should be_enabled }
      it { should be_installed }
      it { should be_running }
    end

### Verify if a package is installed according to my rpm database

    describe package('some_package', rpm_dbpath: '/var/lib/my_rpmdb') do
      it { should be_installed }
    end

### Verify if Memcached is installed, enabled, and running

Memcached is an in-memory key-value store that helps improve the performance of database-driven websites and can be installed, maintained, and tested using the `memcached` cookbook (maintained by Chef). The following example is from the `memcached` cookbook and shows how to use a combination of the `package`, `service`, and `port` Chef InSpec audit resources to test if Memcached is installed, enabled, and running:

    describe package('memcached') do
      it { should be_installed }
    end

    describe service('memcached') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end

    describe port(11_211) do
      it { should be_listening }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_held

The `be_held` matcher tests if the named package is "held". On dpkg platforms, a "held" package
will not be upgraded to a later version.

    it { should be_held }

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }

### version

The `version` matcher tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }

You can also use the `cmp OPERATOR` matcher to perform comparisons using the version attribute:

    its('version') { should cmp >= '7.35.0-1ubuntu3.10' }

`cmp` understands version numbers using Gem::Version, and can use the operators `==, <, <=, >=, and >`.  It will compare versions by each segment, not as a string - so '7.4' is smaller than '7.30', for example.
