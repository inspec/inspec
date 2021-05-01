---
title: About the google_sql_database_instance Resource
platform: gcp
---

# google\_sql\_database\_instance

Use the `google_sql_database_instance` InSpec audit resource to test properties of a single GCP Cloud SQL Database instance.

<br>

## Syntax

A `google_sql_database_instance` resource block declares the tests for a single CP Cloud SQL Database instance by project and name.

    describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.


### Test that a GCP Cloud SQL Database instance is in the expected state

    describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
      its('state') { should eq 'RUNNABLE' }
    end

### Test that a GCP Cloud SQL Database instance generation type

    describe google_sql_database_instance(project: 'chef-inspec-gcp',  database: 'my-database') do
      its('backend_type') { should eq "SECOND_GEN" }
    end

### Test that a GCP Cloud SQL Database instance connection name is as expected

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('connection_name') { should eq "spaterson-project:europe-west2:gcp-inspec-db-instance" }
    end

### Confirm that a GCP Cloud SQL Database instance has the correct version 

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('database_version') { should eq "MYSQL_5_7" }
    end

### Confirm that a GCP Cloud SQL Database instance is running in the desired region and zone 

    describe google_sql_database_instance(project: 'spaterson-project',  database: 'gcp-inspec-db-instance') do
      its('gce_zone') { should eq "europe-west2-a" }
      its('region') { should eq "europe-west2" }
    end

<br>

## Properties

*  `backend_type`, `connection_name`, `database_version`, `etag`, `gce_zone`, `instance_type`, `ip_addresses`, `kind`, `name`, `project`, `region`, `server_ca_cert`, `service_account_email_address`, `settings`, `state`

<br>


## GCP Permissions

Ensure the [Cloud SQL API](https://console.cloud.google.com/projectselector/apis/api/sqladmin.googleapis.com/overview) is enabled for the project.