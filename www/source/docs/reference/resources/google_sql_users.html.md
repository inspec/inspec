---
title: About the google_sql_users Resource
platform: gcp
---

# google\_sql\_users

Use the `google_sql_users` InSpec audit resource to test properties of all, or a filtered group of, GCP sql users for a project database instance.

<br>

## Syntax

A `google_sql_users` resource block collects GCP users by project then tests that group.

    describe google_sql_users(project: 'chef-inspec-gcp', database: 'database-instance') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of users available for the project

    describe google_sql_users(project: 'chef-inspec-gcp', database: 'database-instance') do
      its('count') { should be <= 100}
    end

### Test that an expected user is available for the project

    describe google_sql_users(project: 'chef-inspec-gcp') do
      its('user_names') { should include "us-east1-b" }
    end

### Test whether any users are in status "DOWN"

    describe google_sql_users(project: 'chef-inspec-gcp') do
      its('user_statuses') { should_not include "DOWN" }
    end

### Test users exist for all database instances in a project

    google_sql_database_instances(project: 'chef-inspec-gcp').instance_names.each do |instance_name|
      describe google_sql_users(project: 'chef-inspec-gcp', database: instance_name) do
        it { should exist }
      end
    end

<br>

## Filter Criteria

This resource supports the following filter criteria:  `user_id`; `user_name` and `user_status`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `user_namess` - an array of google sql user name strings
*  `user_instances`- an array of google_sql_database_instance name strings
*  `user_hosts`- an array of google sql user host strings

<br>


## GCP Permissions

Ensure the [Cloud SQL API](https://console.cloud.google.com/projectselector/apis/api/sqladmin.googleapis.com/overview) is enabled for the project.