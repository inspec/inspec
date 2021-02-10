+++
title = "google_sql_users resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_sql_users"
    identifier = "inspec/resources/gcp/google_sql_users.md google_sql_users resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_sql_users` is used to test a Google User resource

## Examples

```ruby

describe google_sql_users(project: 'chef-gcp-inspec', database: 'my-database') do
  its('user_names') { should include 'user-name' }
end
```

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

## Properties

Properties that can be accessed from the `google_sql_users` resource:

See the [google_sql_user](/inspec/resources/google_sql_user/#properties) resource for more information.

`user_hosts`
: an array of `google_sql_user` host

`user_names`
: an array of `google_sql_user` name

`user_instances`
: an array of `google_sql_user` instance

`passwords`
: an array of `google_sql_user` password

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
