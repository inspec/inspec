+++
title = "google_spanner_databases resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_spanner_databases"
    identifier = "inspec/resources/gcp/google_spanner_databases.md google_spanner_databases resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_spanner_databases` is used to test a Google Database resource

## Examples

```ruby
describe.one do
  google_spanner_databases(project: 'chef-gcp-inspec', instance: 'spinstance').names.each do |name|
    describe name do
      it { should match 'spdatabase' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_spanner_databases` resource:

See the [google_spanner_database](/inspec/resources/google_spanner_database/#properties) resource for more information.

`names`
: an array of `google_spanner_database` name

`instances`
: an array of `google_spanner_database` instance

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Spanner API](https://console.cloud.google.com/apis/library/spanner.googleapis.com/) is enabled for the current project.
