---
title: About the yaml Resource
platform: os
---

# yaml

Use the `yaml` Chef InSpec audit resource to test configuration data in a Yaml file.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `yaml` resource block declares the configuration data to be tested. Assume the following Yaml file:

    name: foo
    array:
      - zero
      - one

This file can be queried using:

    describe yaml('filename.yml') do
      its('name') { should eq 'foo' }
      its(['array', 1]) { should eq 'one' }
    end

where

* `name` is a configuration setting in a Yaml file
* `should eq 'foo'` tests a value of `name` as read from a Yaml file versus the value declared in the test

Like the `json` resource, the `yaml` resource can read a file, run a command, or accept content inline:

    describe yaml('config.yaml') do
      its(['driver', 'name']) { should eq 'vagrant' }
    end

    describe yaml({ command: 'retrieve_data.py --yaml' }) do
      its('state') { should eq 'open' }
    end

    describe yaml({ content: "\"key1: value1\nkey2: value2\"" }) do
      its('key2') { should cmp 'value2' }
    end

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a kitchen.yml file driver

    describe yaml('.kitchen.yaml') do
      its(['driver','name']) { should eq('vagrant') }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### name

The `name` matcher tests the value of `name` as read from a Yaml file versus the value declared in the test:

    its('name') { should eq 'foo' }
