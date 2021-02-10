+++
title = "google_compute_instance_group_manager resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instance_group_manager"
    identifier = "inspec/resources/gcp/google_compute_instance_group_manager.md google_compute_instance_group_manager resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance_group_manager` is used to test a Google InstanceGroupManager resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_instance_group_manager(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-gcp-igm') do
  it { should exist }

  its('base_instance_name') { should eq 'igm' }
  its('named_ports.count') { should cmp 1 }
  its('named_ports.first.name') { should eq 'port' }
  its('named_ports.first.port') { should eq '80' }
end

describe google_compute_instance_group_manager(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_instance_group_manager` resource:

`base_instance_name`
: The base instance name to use for instances in this group. The value must be 1-58 characters long. Instances are named by appending a hyphen and a random four-character string to the base instance name. The base instance name must comply with RFC1035.

`creation_timestamp`
: The creation timestamp for this managed instance group in RFC3339 text format.

`current_actions`
: The list of instance actions and the number of instances in this managed instance group that are scheduled for each of those actions.

  `abandoning`
  : The total number of instances in the managed instance group that are scheduled to be abandoned. Abandoning an instance removes it from the managed instance group without deleting it.

  `creating`
  : The number of instances in the managed instance group that are scheduled to be created or are currently being created. If the group fails to create any of these instances, it tries again until it creates the instance successfully.  If you have disabled creation retries, this field will not be populated; instead, the creatingWithoutRetries field will be populated.

  `creating_without_retries`
  : The number of instances that the managed instance group will attempt to create. The group attempts to create each instance only once. If the group fails to create any of these instances, it decreases the group's targetSize value accordingly.

  `deleting`
  : The number of instances in the managed instance group that are scheduled to be deleted or are currently being deleted.

  `none`
  : The number of instances in the managed instance group that are running and have no scheduled actions.

  `recreating`
  : The number of instances in the managed instance group that are scheduled to be recreated or are currently being being recreated. Recreating an instance deletes the existing root persistent disk and creates a new disk from the image that is defined in the instance template.

  `refreshing`
  : The number of instances in the managed instance group that are being reconfigured with properties that do not require a restart or a recreate action. For example, setting or removing target pools for the instance.

  `restarting`
  : The number of instances in the managed instance group that are scheduled to be restarted or are currently being restarted.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: A unique identifier for this resource

`instance_group`
: The instance group being managed

`instance_template`
: The instance template that is specified for this managed instance group. The group uses this template to create all new instances in the managed instance group.

`name`
: The name of the managed instance group. The name must be 1-63 characters long, and comply with RFC1035.

`named_ports`
: Named ports configured for the Instance Groups complementary to this Instance Group Manager.

  `name`
  : The name for this named port. The name must be 1-63 characters long, and comply with RFC1035.

  `port`
  : The port number, which can be a value between 1 and 65535.

`region`
: The region this managed instance group resides (for regional resources).

`target_pools`
: TargetPool resources to which instances in the instanceGroup field are added. The target pools automatically apply to all of the instances in the managed instance group.

`target_size`
: The target number of running instances for this managed instance group. Deleting or abandoning instances reduces this number. Resizing the group changes this number.

`zone`
: The zone the managed instance group resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
