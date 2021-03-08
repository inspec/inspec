+++
title = "google_compute_node_group resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_node_group"
    identifier = "inspec/resources/gcp/google_compute_node_group.md google_compute_node_group resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_node_group` is used to test a Google NodeGroup resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_node_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-node-group') do
  it { should exist }
  its('description') { should cmp 'A description of the node group' }
  its('size') { should cmp '0' }
end

describe google_compute_node_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_node_group` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional textual description of the resource.

`name`
: Name of the resource.

`node_template`
: The URL of the node template to which this node group belongs.

`size`
: The total number of nodes in the node group.

`autoscaling_policy`
: (Beta only) If you use sole-tenant nodes for your workloads, you can use the node group autoscaler to automatically manage the sizes of your node groups.

`mode`
: The autoscaling mode. Set to one of the following: - OFF: Disables the autoscaler. - ON: Enables scaling in and scaling out. - ONLY_SCALE_OUT: Enables only scaling out. You must use this mode if your node groups are configured to restart their hosted VMs on minimal servers.

  Possible values:

  - OFF
  - ON
  - ONLY_SCALE_OUT

`min_nodes`
: Minimum size of the node group. Must be less than or equal to max-nodes. The default value is 0.

`max_nodes`
: Maximum size of the node group. Set to a value less than or equal to 100 and greater than or equal to min-nodes.

`zone`
: Zone where this node group is located

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
