+++
title = "google_compute_node_template resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_node_template"
    identifier = "inspec/resources/gcp/google_compute_node_template.md google_compute_node_template resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_node_template` is used to test a Google NodeTemplate resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_node_template(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-node-template') do
  it { should exist }
  its('node_affinity_labels') { should include('key' => 'value') }
end

describe google_compute_node_template(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_node_template` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional textual description of the resource.

`name`
: Name of the resource.

`node_affinity_labels`
: Labels to use for node affinity, which will be used in instance scheduling.

`node_type`
: Node type to use for nodes group that are created from this template. Only one of nodeTypeFlexibility and nodeType can be specified.

`node_type_flexibility`
: Flexible properties for the desired node type. Node groups that use this node template will create nodes of a type that matches these properties. Only one of nodeTypeFlexibility and nodeType can be specified.

`cpus`
: Number of virtual CPUs to use.

`memory`
: Physical memory available to the node, defined in MB.

`local_ssd`
: Use local SSD

`server_binding`
: (Beta only) The server binding policy for nodes using this template. Determines where the nodes should restart following a maintenance event.

`type`
: Type of server binding policy. If `RESTART_NODE_ON_ANY_SERVER`, nodes using this template will restart on any physical server following a maintenance event. If `RESTART_NODE_ON_MINIMAL_SERVER`, nodes using this template will restart on the same physical server following a maintenance event, instead of being live migrated to or restarted on a new physical server. This option may be useful if you are using software licenses tied to the underlying server characteristics such as physical sockets or cores, to avoid the need for additional licenses when maintenance occurs. However, VMs on such nodes will experience outages while maintenance is applied.

  Possible values:
  - RESTART_NODE_ON_ANY_SERVER
  - RESTART_NODE_ON_MINIMAL_SERVERS

`region`
: Region where nodes using the node template will be created

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
