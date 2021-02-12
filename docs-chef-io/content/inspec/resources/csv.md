+++
title = "csv resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "csv"
    identifier = "inspec/resources/os/csv.md csv resource"
    parent = "inspec/resources/os"
+++

Use the `csv` Chef InSpec audit resource to test configuration data in a CSV file.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `csv` resource block declares the configuration data to be tested:

    describe csv('file') do
      its('name') { should cmp 'foo' }
    end

where

- `'file'` is the path to a CSV file
- `name` is a configuration setting in a CSV file
- `should eq 'foo'` tests a value of `name` as read from a CSV file versus the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a CSV file

    describe csv('some_file.csv') do
      its('setting') { should eq 1 }
    end

## Property Examples

### name

The `name` property tests the value of `name` as read from a CSV file compared to the value declared in the test.

    its('name') { should cmp 'foo' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
