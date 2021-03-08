+++
title = "google_compute_instance resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_instance"
    identifier = "inspec/resources/gcp/google_compute_instance.md google_compute_instance resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_instance` is used to test a Google Instance resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

describe google_compute_instance(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-instance') do
  it { should exist }
  its('machine_type') { should match 'n1-standard-1' }
  its('tags.items') { should include 'foo' }
  its('tags.items') { should include 'bar' }
  its('tag_count') { should cmp 2 }
  its('service_account_scopes') { should include 'https://www.googleapis.com/auth/compute.readonly' }
  its('metadata_keys') { should include '123' }
  its('metadata_values') { should include 'asdf' }
end

describe google_compute_instance(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute instance does not exist

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm-not-there') do
      it { should_not exist }
    end

### Test that a GCP compute instance is in the expected state ([explore possible states here](https://cloud.google.com/compute/docs/instances/checking-instance-status))

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('status') { should eq 'RUNNING' }
    end

### Test that a GCP compute instance is the expected size

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('machine_type') { should match "f1-micro" }
    end

### Test that a GCP compute instance has the expected CPU platform

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('cpu_platform') { should match "Intel" }
    end

### Test that a GCP compute instance has the expected number of attached disks

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('disk_count'){should eq 2}
    end

### Test that a GCP compute instance has the expected number of attached network interfaces

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('network_interfaces_count'){should eq 1}
    end

### Test that a GCP compute instance has the expected number of tags

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('tag_count'){should eq 1}
    end

### Test that a GCP compute instance has a single public IP address

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('first_network_interface_nat_ip_exists'){ should be true }
      its('first_network_interface_name'){ should eq "external-nat" }
      its('first_network_interface_type'){ should eq "one_to_one_nat" }
    end

### Test that a particular compute instance label key is present

    describe google_compute_instance(project: 'chef-inspec-gcp',  zone: 'us-east1-b', name: 'inspec-test-vm') do
      its('labels_keys') { should include 'my_favourite_label' }
    end

### Test that a particular compute instance label value is matching regexp

    describe google_compute_instance(project: 'chef-inspec-gcp', zone:'us-east1-b', name:'inspec-test-vm').label_value_by_key('business-area') do
      it { should match '^(marketing|research)$' }
    end

### Test that a particular compute instance metadata key is present

    describe google_compute_instance(project: 'chef-inspec-gcp', zone:'us-east1-b', name:'inspec-test-vm') do
      its('metadata_keys') { should include 'patching-type' }
    end

### Test that a particular compute instance metadata value is matching regexp

    describe google_compute_instance(project: 'chef-inspec-gcp', zone:'us-east1-b', name:'inspec-test-vm').metadata_value_by_key('patching-window') do
      it { should match '^\d{1}-\d{2}$' }
    end

## Properties

Properties that can be accessed from the `google_compute_instance` resource:

`can_ip_forward`
: Allows this instance to send and receive packets with non-matching destination or source IPs. This is required if you plan to use this instance to forward routes.

`cpu_platform`
: The CPU platform used by this instance.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`deletion_protection`
: Whether the resource should be protected against deletion.

`disks`
: An array of disks that are associated with the instances that are created from this template.

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
  : Reference to a disk. When creating a new instance, one of initializeParams.sourceImage or disks.source is required.  If desired, you can also attach existing non-root persistent disks using this property. This field is only applicable for persistent disks.

  `type`
  : Specifies the type of the disk, either SCRATCH or PERSISTENT. If not specified, the default is PERSISTENT.

    Possible values:
    - SCRATCH
    - PERSISTENT

  `licenses`
  : Any applicable publicly visible licenses.

`guest_accelerators`
: List of the type and count of accelerator cards attached to the instance

    `accelerator_count`
    : The number of the guest accelerator cards exposed to this instance.

    `accelerator_type`
    : Full or partial URL of the accelerator type resource to expose to this instance.

`hostname`
: The hostname of the instance to be created. The specified hostname must be RFC1035 compliant. If hostname is not specified, the default hostname is [INSTANCE_NAME].c.[PROJECT_ID].internal when using the global DNS, and [INSTANCE_NAME].[ZONE].c.[PROJECT_ID].internal when using zonal DNS.

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`label_fingerprint`
: The fingerprint used for optimistic locking of this resource. Used internally during updates.

`labels`
: Labels to apply to this instance. A list of key->value pairs.

`metadata`
: The metadata key/value pairs to assign to instances that are created from this template. These pairs can consist of custom metadata or predefined keys.

`machine_type`
: A reference to a machine type which defines VM kind.

`min_cpu_platform`
: Specifies a minimum CPU platform for the VM instance. Applicable values are the friendly names of CPU platforms

`name`
: The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

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

`shielded_instance_config`
: Configuration for various parameters related to shielded instances.

    `enable_secure_boot`
    : Defines whether the instance has Secure Boot enabled.

    `enable_vtpm`
    : Defines whether the instance has the vTPM enabled

    `enable_integrity_monitoring`
    : Defines whether the instance has integrity monitoring enabled.

`status`
: The status of the instance. One of the following values: PROVISIONING, STAGING, RUNNING, STOPPING, SUSPENDING, SUSPENDED, and TERMINATED. As a user, use RUNNING to keep a machine "on" and TERMINATED to turn a machine off

  Possible values:

  - PROVISIONING
  - STAGING
  - RUNNING
  - STOPPING
  - SUSPENDING
  - SUSPENDED
  - TERMINATED

`status_message`
: An optional, human-readable explanation of the status.

`tags`
: A list of tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation. The tags can be later modified by the setTags method. Each tag within the list must comply with RFC1035.

  `fingerprint`
  : Specifies a fingerprint for this request, which is essentially a hash of the metadata's contents and used for optimistic locking. The fingerprint is initially generated by Compute Engine and changes after every request to modify or update metadata. You must always provide an up-to-date fingerprint hash in order to update or change metadata.

  `items`
  : An array of tags. Each tag must be 1-63 characters long, and comply with RFC1035.

`zone`
: A reference to the zone where the machine resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
