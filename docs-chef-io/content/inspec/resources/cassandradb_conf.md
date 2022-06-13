+++
title = "cassandradb_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "cassandradb_conf"
    identifier = "inspec/resources/os/cassandradb_conf.md cassandradb_conf resource"
    parent = "inspec/resources/os"
+++

Use the `cassandradb_conf` Chef InSpec audit resource to test the configuration of a Cassandra database, which is typically located at `$CASSANDRA_HOME/cassandra.yaml` or `$CASSANDRA_HOME\conf\cassandra.yaml` depending upon the platform.

## Installation

{{% inspec/inspec_installation %}}

## Requirements

- The value of the `CASSANDRA_HOME` environment variable must be set in the system.

## Syntax

A `cassandradb_conf` resource block fetches configurations in the `cassandra.yaml` file, and then compares them with the value stated in the test:

    describe cassandradb_conf do
      its('config item') { should eq 'value' }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test parameters set within the configuration file

    describe cassandradb_conf do
      its('listen_address') { should eq 'localhost' }
      its('num_tokens') { should eq 16 }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
