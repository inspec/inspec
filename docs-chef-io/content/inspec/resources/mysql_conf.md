+++
title = "mysql_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "mysql_conf"
    identifier = "inspec/resources/os/mysql_conf.md mysql_conf resource"
    parent = "inspec/resources/os"
+++

Use the `mysql_conf` Chef InSpec audit resource to test the contents of the configuration file for MySQL, typically located at `/etc/mysql/my.cnf` or `/etc/my.cnf`.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `mysql_conf` resource block declares one (or more) settings in the `my.cnf` file, and then compares the setting in the configuration file to the value stated in the test:

    describe mysql_conf('path') do
      its('setting') { should eq 'value' }
    end

    # Test a parameter set within the [mysqld] section
    describe mysql_conf do
      its('mysqld.port') { should cmp 3306 }
    end

    # Test a parameter set within the [mariadb] section using array notation
    describe mysql_conf do
      its(['mariadb', 'max-connections']) { should_not be_nil }
    end

where

- `'setting'` specifies a setting in the `my.cnf` file, such as `max_connections`
  - when checking a setting within sections, such as `[mysqld]`, the section name must be included
- `('path')` is the non-default path to the `my.cnf` file
- `should eq 'value'` is the value that is expected

## Properties

This resource supports any settings listed in a `my.cnf` file as properties. For example, `max_connections`.

    its('max_connections') { should eq '505' }

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the maximum number of allowed connections

    describe mysql_conf do
      its('max_connections') { should eq '505' }
      its('max_user_connections') { should eq '500' }
    end

### Test slow query logging\*\*

    describe mysql_conf do
      its('slow_query_log_file') { should eq 'hostname_slow.log' }
      its('slow_query_log') { should eq '0' }
      its('log_queries_not_using_indexes') { should eq '1' }
      its('long_query_time') { should eq '0.5' }
      its('min_examined_row_limit') { should eq '100' }
    end

### Test the port and socket on which MySQL listens

    describe mysql_conf do
      its('port') { should eq '3306' }
      its('socket') { should eq '/var/run/mysqld/mysql.sock' }
    end

### Test connection and thread variables

    describe mysql_conf do
      its('port') { should eq '3306' }
      its('socket') { should eq '/var/run/mysqld/mysql.sock' }
      its('max_allowed_packet') { should eq '12M' }
      its('default_storage_engine') { should eq 'InnoDB' }
      its('character_set_server') { should eq 'utf8' }
      its('collation_server') { should eq 'utf8_general_ci' }
      its('max_connections') { should eq '505' }
      its('max_user_connections') { should eq '500' }
      its('thread_cache_size') { should eq '505' }
    end

### Test the safe-user-create parameter

    describe mysql_conf.params('mysqld') do
      its('safe-user-create') { should eq('1') }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
