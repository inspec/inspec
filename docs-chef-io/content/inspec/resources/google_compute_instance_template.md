+++
title = "google_compute_instance_template resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instance_template"
    identifier = "inspec/resources/gcp/google_compute_instance_template.md google_compute_instance_template resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance_template` is used to test a Google InstanceTemplate resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_instance_template(project: 'chef-gcp-inspec', name: 'inspec-gcp-instance-template') do
  it { should exist }
  its('description') { should eq 'A description of the instance template' }
  its('properties.description') { should eq 'A description of the instance itself' }
  its('properties.machine_type') { should eq 'f1-micro' }
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

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`name`
: Name of the resource. The name is 1-63 characters long and complies with RFC1035.

`properties`
: The instance properties for this instance template.

  `can_ip_forward`
  : Enables instances created based on this template to send packets with source IP addresses other than their own and receive packets with destination IP addresses other than their own. If these instances will be used as an IP gateway or it will be set as the next-hop in a Route resource, specify true. If unsure, leave this set to false.

  `description`
  : An optional text description for the instances that are created from this instance template.

  `disks`
  : An array of disks that are associated with the instances that are created from this template.

    `licenses`
    : Any applicable license URI.

    `auto_delete`
    : Specifies whether the disk will be auto-deleted when the instance is deleted (but not when the disk is detached from the instance).  Tip: Disks should be set to autoDelete=true so that leftover disks are not left behind on machine deletion.

    `boot`
    : Indicates that this is a boot disk. The virtual machine will use the first partition of the disk for its root filesystem.

    `device_name`
    : Specifies a unique device name of your choice that is reflected into the /dev/disk/by-id/google-* tree of a Linux operating system running within the instance. This name can be used to reference the device for mounting, resizing, and so on, from within the instance.

    `disk_encryption_key`
    : Encrypts or decrypts a disk using a customer-supplied encryption key.

      `raw_key`
      : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

      `rsa_encrypted_key`
      : Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource.

      `sha256`
      : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

    `index`
    : Assigns a zero-based index to this disk, where 0 is reserved for the boot disk. For example, if you have many disks attached to an instance, each disk would have a unique index number. If not specified, the server will choose an appropriate value.

    `initialize_params`
    : Specifies the parameters for a new disk that will be created alongside the new instance. Use initialization parameters to create boot disks or local SSDs attached to the new instance.

      `disk_name`
      : Specifies the disk name. If not specified, the default is to use the name of the instance.

      `disk_size_gb`
      : Specifies the size of the disk in base-2 GB.

      `disk_type`
      : Reference to a disk type. Specifies the disk type to use to create the instance. If not specified, the default is pd-standard.

      `source_image`
      : The source image to create this disk. When creating a new instance, one of initializeParams.sourceImage or disks.source is required.  To create a disk with one of the public operating system images, specify the image by its family name.

      `source_image_encryption_key`
      : The customer-supplied encryption key of the source image. Required if the source image is protected by a customer-supplied encryption key.  Instance templates do not store customer-supplied encryption keys, so you cannot create disks for instances in a managed instance group if the source images are encrypted with your own keys.

        `raw_key`
        : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

        `sha256`
        : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

    `interface`
    : Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. Persistent disks must always use SCSI and the request will fail if you attempt to attach a persistent disk in any other format than SCSI.

      Possible values:

      - SCSI
      - NVME

    `mode`
    : The mode in which to attach this disk, either READ_WRITE or READ_ONLY. If not specified, the default is to attach the disk in READ_WRITE mode.

      Possible values:
      - READ_WRITE
      - READ_ONLY

    `source`
    : Reference to a disk. When creating a new instance, one of initializeParams.sourceImage or disks.source is required.  If desired, you can also attach existing non-root persistent disks using this property. This field is only applicable for persistent disks.  Note that for InstanceTemplate, specify the disk name, not the URL for the disk.

    `type`
    : Specifies the type of the disk, either SCRATCH or PERSISTENT. If not specified, the default is PERSISTENT.

      Possible values:
      - SCRATCH
      - PERSISTENT

  `labels`
  : Labels to apply to this address.  A list of key->value pairs.

  `machine_type`
  : The machine type to use in the VM instance template.

  `min_cpu_platform`
  : Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms

  `metadata`
  : The metadata key/value pairs to assign to instances that are created from this template. These pairs can consist of custom metadata or predefined keys.

  `guest_accelerators`
  : List of the type and count of accelerator cards attached to the instance

    `accelerator_count`
    : The number of the guest accelerator cards exposed to this instance.

    `accelerator_type`
    : Full or partial URL of the accelerator type resource to expose to this instance.

  `network_interfaces`
  : An array of configurations for this interface. This specifies how this interface is configured to interact with other network services, such as connecting to the internet. Only one network interface is supported per instance.

    `access_configs`
    : An array of configurations for this interface. Currently, only one access config, ONE_TO_ONE_NAT, is supported. If there are no accessConfigs specified, then this instance will have no external internet access.

      `name`
      : The name of this access configuration. The default and recommended name is External NAT but you can use any arbitrary string you would like. For example, My external IP or Network Access.

      `nat_ip`
      : Reference to an address. An external IP address associated with this instance. Specify an unused static external IP address available to the project or leave this field undefined to use an IP from a shared ephemeral IP address pool. If you specify a static external IP address, it must live in the same region as the zone of the instance.

      `type`
      : The type of configuration. The default and only option is ONE_TO_ONE_NAT.

        Possible values:
        - ONE_TO_ONE_NAT

      `set_public_ptr`
      : Specifies whether a public DNS PTR record should be created to map the external IP address of the instance to a DNS domain name.

      `public_ptr_domain_name`
      : The DNS domain name for the public PTR record. You can set this field only if the setPublicPtr field is enabled.

      `network_tier`
      : This signifies the networking tier used for configuring this access configuration. If an AccessConfig is specified without a valid external IP address, an ephemeral IP will be created with this networkTier. If an AccessConfig with a valid external IP address is specified, it must match that of the networkTier associated with the Address resource owning that IP.

        Possible values:
        - PREMIUM
        - STANDARD

    `alias_ip_ranges`
    : An array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks.

      `ip_cidr_range`
      : The IP CIDR range represented by this alias IP range. This IP CIDR range must belong to the specified subnetwork and cannot contain IP addresses reserved by system or used by other network interfaces. This range may be a single IP address (e.g. 10.2.3.4), a netmask (e.g. /24) or a CIDR format string (e.g. 10.1.2.0/24).

      `subnetwork_range_name`
      : Optional subnetwork secondary range name specifying the secondary range from which to allocate the IP CIDR range for this alias IP range. If left unspecified, the primary range of the subnetwork will be used.

    `name`
    : The name of the network interface, generated by the server. For network devices, these are eth0, eth1, etc

    `network`
    : Specifies the title of an existing network.  When creating an instance, if neither the network nor the subnetwork is specified, the default network global/networks/default is used; if the network is not specified but the subnetwork is specified, the network is inferred.

    `network_ip`
    : An IPv4 internal network address to assign to the instance for this network interface. If not specified by the user, an unused internal IP is assigned by the system.

    `subnetwork`
    : Reference to a VPC network. If the network resource is in legacy mode, do not provide this property.  If the network is in auto subnet mode, providing the subnetwork is optional. If the network is in custom subnet mode, then this field should be specified.

  `scheduling`
  : Sets the scheduling options for this instance.

    `automatic_restart`
    : Specifies whether the instance should be automatically restarted if it is terminated by Compute Engine (not terminated by a user). You can only set the automatic restart option for standard instances. Preemptible instances cannot be automatically restarted.

    `on_host_maintenance`
    : Defines the maintenance behavior for this instance. For standard instances, the default behavior is MIGRATE. For preemptible instances, the default and only possible behavior is TERMINATE. For more information, see Setting Instance Scheduling Options.

    `preemptible`
    : Defines whether the instance is preemptible. This can only be set during instance creation, it cannot be set or changed after the instance has been created.

  `service_accounts`
  : A list of service accounts, with their specified scopes, authorized for this instance. Only one service account per VM instance is supported.

    `email`
    : Email address of the service account.

    `scopes`
    : The list of scopes to be made available for this service account.

  `tags`
  : A list of tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation. The tags can be later modified by the setTags method. Each tag within the list must comply with RFC1035.

    `fingerprint`
    : Specifies a fingerprint for this request, which is essentially a hash of the metadata's contents and used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update metadata. You must always provide an up-to-date fingerprint hash in order to update or change metadata.

    `items`
    : An array of tags. Each tag must be 1-63 characters long, and comply with RFC1035.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
