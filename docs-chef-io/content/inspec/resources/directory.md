+++
title = "directory resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "directory"
    identifier = "inspec/resources/os/directory.md directory resource"
    parent = "inspec/resources/os"
+++

Use the `directory` Chef InSpec audit resource to test if the file type is a directory. This is equivalent to using the [`file` resource](/inspec/resources/file/) and the `be_directory` matcher, but provides a simpler and more direct way to test directories.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `directory` resource block declares the location of the directory to be tested, and then one (or more) matchers.

    describe directory('path') do
      its('property') { should cmp 'value' }
    end

## Properties

All of the properties available to [`file`](/inspec/resources/file/) may be used with `directory`.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
