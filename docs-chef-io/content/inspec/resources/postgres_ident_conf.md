+++
title = "postgres_ident_conf resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "postgres_ident_conf"
    identifier = "inspec/resources/os/postgres_ident_conf.md postgres_ident_conf resource"
    parent = "inspec/resources/os"
+++

Use the `postgres_ident_conf` Chef InSpec audit resource to test the client authentication data defined in the pg_ident.conf file.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.31.0 of InSpec.

## Syntax

An `postgres_ident_conf` Chef InSpec audit resource block declares client authentication data that should be tested:

    describe postgres_ident_conf.where { pg_username == 'filter_value' } do
      its('attribute') { should eq ['value'] }
    end

where

- `'attribute'` is a attribute in the pg ident configuration file
- `'filter_value'` is the value that is to be filtered for
- `'value'` is the value that is to be matched expected

## Properties

### map_name([String])

`map_name` returns a an array of strings that matches the where condition of the filter table

    describe postgres_ident_conf.where { pg_username == 'name' } do
      its('map_name') { should eq ['value'] }
    end

### pg_username([String])

`pg_username` returns a an array of strings that matches the where condition of the filter table

    describe postgres_ident_conf.where { pg_username == 'name' } do
      its('pg_username') { should eq ['value'] }
    end

### system_username([String])

`system_username` returns a an array of strings that matches the where condition of the filter table

    describe postgres_ident_conf.where { pg_username == 'name' } do
      its('system_username') { should eq ['value'] }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
