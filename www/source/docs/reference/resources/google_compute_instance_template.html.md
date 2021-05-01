---
title: About the google_compute_instance_template resource
platform: gcp
---

## Syntax
A `google_compute_instance_template` is used to test a Google InstanceTemplate resource

## Examples
```
describe google_compute_instance_template(project: 'chef-gcp-inspec', name: 'inspec-gcp-instance-template') do
  it { should exist }
  its('description') { should eq 'A description of the instance template' }
  its('properties.description') { should eq 'A description of the instance itself' }
  its('properties.machine_type') { should eq 'n1-standard-1' }
  its('properties.tags.items') { should include 'foo' }
  its('properties.disks.count') { should eq 1 }
  its('properties.disks.first.auto_delete') { should eq 'true' }
  its('properties.disks.first.boot') { should eq 'true' }
  its('properties.network_interfaces.count') { should eq 1 }
  its('properties.service_accounts.count') { should eq 1 }
end

describe google_compute_instance_template(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_instance_template` resource:

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource. This identifier is defined by the server.

  * `name`: Name of the resource. The name is 1-63 characters long and complies with RFC1035.

  * `properties`: The instance properties for this instance template.

    * `canIpForward`: Enables instances created based on this template to send packets with source IP addresses other than their own and receive packets with destination IP addresses other than their own. If these instances will be used as an IP gateway or it will be set as the next-hop in a Route resource, specify true. If unsure, leave this set to false.

    * `description`: An optional text description for the instances that are created from this instance template.

    * `disks`: An array of disks that are associated with the instances that are created from this template.

    * `machineType`: The machine type to use in the VM instance template.

    * `minCpuPlatform`: Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms

    * `metadata`: The metadata key/value pairs to assign to instances that are created from this template. These pairs can consist of custom metadata or predefined keys.

    * `guestAccelerators`: List of the type and count of accelerator cards attached to the instance

    * `networkInterfaces`: An array of configurations for this interface. This specifies how this interface is configured to interact with other network services, such as connecting to the internet. Only one network interface is supported per instance.

    * `scheduling`: Sets the scheduling options for this instance.

    * `serviceAccounts`: A list of service accounts, with their specified scopes, authorized for this instance. Only one service account per VM instance is supported.

    * `tags`: A list of tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation. The tags can be later modified by the setTags method. Each tag within the list must comply with RFC1035.
