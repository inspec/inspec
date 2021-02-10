+++
title = "postgres_hba_conf resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "postgres_hba_conf"
    identifier = "inspec/resources/os/postgres_hba_conf.md postgres_hba_conf resource"
    parent = "inspec/resources/os"
+++

Use the `postgres_hba_conf` Chef InSpec audit resource to test the client authentication data defined in the pg_hba.conf file.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.31.0 of InSpec.

## Syntax

An `postgres_hba_conf` Chef InSpec audit resource block declares client authentication data that should be tested:

    describe postgres_hba_conf.where { type == 'local' } do
     its('auth_method') { should eq ['peer'] }
    end

where

- `'attribute'` is a attribute in the pg hba configuration file
- `'filter_value'` is the value that is to be filtered for
- `'value'` is the value that is to be matched expected

## Properties

    'address', 'auth_method', 'auth_params', 'conf_dir' , 'conf_file' , 'database', 'params' ,'type', 'user'

## Property Examples

### address([String])

`address` returns a an array of strings that matches the where condition of the filter table

    describe postgres_hba_conf.where { type == 'local' } do
      its('address') { should cmp 'value' }
    end

### auth_method([String])

`auth_method` returns a an array of strings that matches the where condition of the filter table

    describe postgres_hba_conf.where { type == 'local' } do
      its('auth_method') { should cmp 'value' }
    end

### database([String])

`database` returns a an array of strings that matches the where condition of the filter table

    describe postgres_hba_conf.where { type == 'local' } do
      its('database') { should cmp 'value' }
    end

### type([String])

`type` returns a an array of strings that matches the where condition of the filter table

    describe postgres_hba_conf.where { database == 'acme_test_db' } do
      its('type') { should cmp 'value' }
    end

### user([String])

`user` returns a an array of strings that matches the where condition of the filter table

    describe postgres_hba_conf.where { database == 'acme_test_db' } do
      its('user') { should cmp 'value' }
    end

## Matchers

This Chef InSpec audit resource matches any service that is listed in the HBA configuration file. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

    its('auth_method') { should_not cmp 'peer' }

or:

    its('auth_method') { should cmp 'peer' }

For example:

    describe postgres_hba_conf.where { type == 'type' } do
      its('auth_method') { should cmp 'value' }
      its('user') { should cmp 'value' }
    end
