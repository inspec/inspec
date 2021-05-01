---
title: About the google_sql_database_instances Resource
platform: gcp
---

# google\_sql\_database\_instances

Use the `google_sql_database_instances` InSpec audit resource to test properties of GCP Cloud SQL Database instances.

<br>

## Syntax

A `google_sql_database_instances` resource block collects GCP zones by project then tests that group.

    describe google_sql_database_instances(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_sql_database_instance`.

    google_sql_database_instances(project: 'chef-inspec-gcp').instance_names.each do |instance_name|
      describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: instance_name) do
        it { should exist }
        its('backend_type') { should eq "SECOND_GEN" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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

### Test that a subset of all database instances matching "*mysqldb*" are all version "MYSQL_5_7"

    google_sql_database_instances(project: 'chef-inspec-gcp').where(instance_name: /mysqldb/).instance_names.each do |instance_name|
      describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: instance_name) do
        it { should exist }
        its('database_version') { should eq "MYSQL_5_7" }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `instance_name`; `instance_version`; `instance_region`; `instance_zone` and `instance_state`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `instance_names` - an array of google_sql_database_instance name strings
*  `instance_versions` - an array of google_sql_database_instance version strings
*  `instance_regions`- an array of google_compute_region name strings
*  `instance_zones`- an array of google_sql_database_instance name strings
*  `instance_states`- an array of google_sql_database_instance state strings

<br>


## GCP Permissions

Ensure the [Cloud SQL API](https://console.cloud.google.com/projectselector/apis/api/sqladmin.googleapis.com/overview) is enabled for the project.