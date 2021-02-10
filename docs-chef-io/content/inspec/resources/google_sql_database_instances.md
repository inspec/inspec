+++
title = "google_sql_database_instances resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_sql_database_instances"
    identifier = "inspec/resources/gcp/google_sql_database_instances.md google_sql_database_instances resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_sql_database_instances` is used to test a Google DatabaseInstance resource

## Examples

```ruby

describe google_sql_database_instances(project: 'chef-gcp-inspec') do
  its('instance_states') { should include 'RUNNABLE' }
  its('instance_names') { should include 'my-database' }
end
```

### Test that there are no more than a specified number of zones available for the project

    describe google_sql_database_instances(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that a database instance exists in the expected zone

    describe google_sql_database_instances(project: 'chef-inspec-gcp') do
      its('instance_zones') { should include "us-east1-b" }
    end

### Test that a database instance exists in the expected region

    describe google_sql_database_instances(project: 'chef-inspec-gcp') do
      its('instance_regions') { should include "us-east1" }
    end

### Confirm that at least one database instance is in "RUNNABLE" state

    describe google_sql_database_instances(project: 'chef-inspec-gcp') do
      its('instance_states') { should include "RUNNABLE" }
    end

### Test that a subset of all database instances matching "_mysqldb_" are all version "MYSQL_5_7"

    google_sql_database_instances(project: 'chef-inspec-gcp').where(instance_name: /mysqldb/).instance_names.each do |instance_name|
      describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: instance_name) do
        it { should exist }
        its('database_version') { should eq "MYSQL_5_7" }
      end
    end

## Properties

Properties that can be accessed from the `google_sql_database_instances` resource:

See the [google_sql_database_instance](/inspec/resources/google_sql_database_instance/#properties) resource for more information.

`backend_types`
: an array of `google_sql_database_instance` backend_type

`connection_names`
: an array of `google_sql_database_instance` connection_name

`instance_versions`
: an array of `google_sql_database_instance` database_version

`failover_replicas`
: an array of `google_sql_database_instance` failover_replica

`instance_types`
: an array of `google_sql_database_instance` instance_type

`ip_addresses`
: an array of `google_sql_database_instance` ip_addresses

`ipv6_addresses`
: an array of `google_sql_database_instance` ipv6_address

`master_instance_names`
: an array of `google_sql_database_instance` master_instance_name

`max_disk_sizes`
: an array of `google_sql_database_instance` max_disk_size

`instance_names`
: an array of `google_sql_database_instance` name

`instance_regions`
: an array of `google_sql_database_instance` region

`replica_configurations`
: an array of `google_sql_database_instance` replica_configuration

`settings`
: an array of `google_sql_database_instance` settings

`instance_zones`
: an array of `google_sql_database_instance` gce_zone

`instance_states`
: an array of `google_sql_database_instance` state

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
