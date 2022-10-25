+++
title = "cpan resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "cpan"
    identifier = "inspec/resources/os/cpan.md cpan resource"
    parent = "inspec/resources/os"
+++

Use the `cpan` Chef InSpec audit resource to test Perl modules that are installed by system packages or the CPAN installer.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.43.5 of InSpec.

## Syntax

A `cpan` resource block declares a package and (optionally) a package version:

    describe cpan('package_name') do
      it { should be_installed }
    end

where

- `'package_name'` is the name of the package, such as `'DBD::Pg'`
- `be_installed` tests to see if the package described above is installed

## Resource Parameters

This resource uses package names and perl library paths as resource parameters.

## Resource Parameter Examples

### Test if DBD::Pg is installed on the system

    describe cpan('DBD:Pg') do
      it { should be_installed }
    end

### Test if DBD::Pg 3.7.0 is installed on the system

    describe cpan('DBD::Pg') do
      it { should be_installed }
      its('version') { should eq '3.7.0' }
    end

### Test if DBD::Pg is installed within a custom PERL5LIB path on the system

Hint: You can pass multiple paths separated with a colon
`/path/to/perl5/lib:/usr/share/perl5/vendor_perl/lib/perl5`

    describe cpan('DBD::Pg', '/home/username/perl5/lib/perl5') do
      it { should be_installed }
    end

## Property Examples

The following examples show how to use this Chef InSpec audit resource.

### version

The `version` property tests if the named package version is on the system:

    its('version') { should eq '1.2.3' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_installed

The `be_installed` matcher tests if the named package is installed on the system:

    it { should be_installed }
