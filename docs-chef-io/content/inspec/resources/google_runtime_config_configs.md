+++
title = "google_runtime_config_configs resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_runtime_config_configs"
    identifier = "inspec/resources/gcp/google_runtime_config_configs.md google_runtime_config_configs resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_runtime_config_configs` is used to test a Google Config resource

## Examples

```ruby
describe google_runtime_config_configs(project: 'chef-gcp-inspec') do
  its('descriptions') { should include 'My runtime configurations' }
end
```

## Properties

Properties that can be accessed from the `google_runtime_config_configs` resource:

See the [google_runtime_config_config](/inspec/resources/google_runtime_config_config/#properties) resource for more information.

`descriptions`
: an array of `google_runtime_config_config` description

`names`
: an array of `google_runtime_config_config` name

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
