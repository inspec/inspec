+++
title = "google_sql_user resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_sql_user"
    identifier = "inspec/resources/gcp/google_sql_user.md google_sql_user resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_sql_user` is used to test a Google User resource

## Examples

```ruby

describe google_sql_user(project: 'chef-gcp-inspec', database: 'my-database', name: 'user-name', host: "example.com") do
  it { should exist }
  its('name') { should cmp 'user-name' }
  its('instance') { should cmp 'my-database' }
end

describe google_sql_user(project: 'chef-gcp-inspec', database: 'my-database', name: "nonexistent", host: "example.com") do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_sql_user` resource:

`host`
: The host name from which the user can connect. For insert operations, host defaults to an empty string. For update operations, host is specified as part of the request URL. The host name cannot be updated after insertion.

`name`
: The name of the user in the Cloud SQL instance.

`instance`
: The name of the Cloud SQL instance. This does not include the project ID.

`password`
: The password for the user.

## GCP Permissions

Ensure the [Cloud SQL Admin API](https://console.cloud.google.com/apis/library/sqladmin.googleapis.com/) is enabled for the current project.
