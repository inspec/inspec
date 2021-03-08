+++
title = "postgres_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "postgres_conf"
    identifier = "inspec/resources/os/postgres_conf.md postgres_conf resource"
    parent = "inspec/resources/os"
+++

Use the `postgres_conf` Chef InSpec audit resource to test the contents of the configuration file for PostgreSQL, typically located at `/etc/postgresql/<version>/main/postgresql.conf` or `/var/lib/postgres/data/postgresql.conf`, depending on the platform.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `postgres_conf` resource block declares one (or more) settings in the `postgresql.conf` file, and then compares the setting in the configuration file to the value stated in the test:

    describe postgres_conf('path') do
      its('setting') { should eq 'value' }
    end

where

- `'setting'` specifies a setting in the `postgresql.conf` file
- `('path')` is the non-default path to the `postgresql.conf` file (optional)
- `should eq 'value'` is the value that is expected

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the maximum number of allowed client connections

    describe postgres_conf do
      its('max_connections') { should eq '5' }
    end

### Test system logging

    describe postgres_conf do
      its('logging_collector') { should eq 'on' }
      its('log_connections') { should eq 'on' }
      its('log_disconnections') { should eq 'on' }
      its('log_duration') { should eq 'on' }
      its('log_hostname') { should eq 'on' }
      its('log_line_prefix') { should eq '%t %u %d %h' }
      its(['pgaudit.log_parameter']) { should cmp 'on' }
    end

### Test the port on which PostgreSQL listens

    describe postgres_conf do
      its('port') { should eq '5432' }
    end

### Test the Unix socket settings

    describe postgres_conf do
      its('unix_socket_directories') { should eq '.s.PGSQL.5432' }
      its('unix_socket_group') { should eq nil }
      its('unix_socket_permissions') { should eq '0770' }
    end

where `unix_socket_group` is set to the PostgreSQL default setting (the group to which the server user belongs).

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### setting

The `setting` matcher tests specific, named settings in the `postgresql.conf` file:

    its('setting') { should eq 'value' }

Use a `setting` matcher for each setting to be tested.
