+++
title = "google_dataproc_clusters resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dataproc_clusters"
    identifier = "inspec/resources/gcp/google_dataproc_clusters.md google_dataproc_clusters resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dataproc_clusters` is used to test a Google Cluster resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dataproc_clusters(project: 'chef-gcp-inspec', region: 'europe-west2') do
  its('count') { should be >= 1 }
  its('cluster_names') { should include 'inspec-dataproc-cluster' }
end
```

## Properties

Properties that can be accessed from the `google_dataproc_clusters` resource:

See the [google_dataproc_cluster](/inspec/resources/google_dataproc_cluster/#properties) resource for more information.

`cluster_names`
: an array of `google_dataproc_cluster` cluster_name

`labels`
: an array of `google_dataproc_cluster` labels

`configs`
: an array of `google_dataproc_cluster` config

`regions`
: an array of `google_dataproc_cluster` region

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Dataproc API](https://console.cloud.google.com/apis/library/dataproc.googleapis.com) is enabled for the current project.
