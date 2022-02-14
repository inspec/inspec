+++
title = "azure_resource_group resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azure_resource_group"
    identifier = "inspec/resources/azure/azure_resource_group.md azure_resource_group resource"
    parent = "inspec/resources/azure"
+++

Use the `azure_resource_group_resource_count` Chef InSpec audit resource to check the number of Azure resources in a resource group.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v2.0.16 of InSpec.

## Syntax

The name of the resource group is specified as a parameter on the resource:

    describe azure_resource_group(name: 'MyResourceGroup') do
      its('property') { should eq 'value' }
    end

where

- `MyResourceGroup` is the name of the resource group being interrogated
- `property` is one a resource property
- `value` is the expected output from the matcher

## Examples

The following examples show how to use this Chef InSpec audit resource:

### Ensure the Resource Group has the correct number of resources

    describe azure_resource_group_resource_count(name: 'InSpec-Azure') do
      its('total') { should eq 7}
    end

### Ensure that the Resource Group contains the correct resources

    describe azure_resource_group_resource_count(name: 'InSpec-Azure') do
      its('total') { should eq 7 }
      its('vm_count') { should eq 2 }
      its('nic_count') { should eq 2 }
      its('public_ip_count') { should eq 1 }
      its('sa_count') { should eq 1 }
      its('vnet_count') { should eq 1 }
    end

## Parameters

- `group_name`
- `name`

### `group_name` (required)

Use this parameter to define the Azure Resource Group to be tested.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure') do
        ...
    end

### `name`

Use this parameter to define the name of the Azure resource to test.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM') do
        ...
    end

If both `group_name` and `name` is set then `name` takes priority

These options can also be set using the environment variables:

- `AZURE_RESOURCE_GROUP_NAME`
- `AZURE_RESOURCE_NAME`

When the options have been set as well as the environment variables, the environment variables take priority.

### Parameter Example

    describe azure_generic_resource(group_name: 'InSpec-Azure', name: 'Linux-Internal-VM') do
      its('location') { should eq 'westeurope' }
    end

## Properties

- `name`
- `location`
- `id`
- `provisioning_state`
- `subscription_id`
- `total`
- `nic_count`
- `vm_count`
- `extension_count`
- `vnet_count`
- `sa_count`
- `public_ip_count`
- `managed_disk_image_count`
- `managed_disk_count`
- `tag_count`

### name

Tests the name of the resource group.

    its('name') { should cmp 'InSpec-Azure' }

### location

Tests where in Azure the resource group is located.

    its('location') { should cmp 'westeurope' }

### id

Tests the full qualified ID of the resource group.

This takes the format: `/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>`.

    its('id') { should cmp 'FQDN' }

### provisioning_state

Tests the provisioning state of the resource group.

    its('provisioning_state') { should cmp 'Succeeded' }

### total

Tests the total number of resources in the resource group.

    its('total') { should eq 13 }

### nic_count

Tests the number of network interface cards in the resource group.

    it { should have_nics }
    its('nic_count') { should eq 3 }

### vm_count

Tests the number of virtual machines in the resource group.

    its('vm_count') { should eq 5 }

### vnet_count

Tests the number of virtual networks in the resource group.

    its('vnet_count') { should eq 5 }

### sa_count

Tests the number of storage accounts in the resource group.

    its('sa_count') { should eq 5 }

### public_ip_count

Tests the number of Public IP Addresses in the resource group.

    its('public_ip_count') { should eq 5 }

### managed_disk_image_count

Tests the number of managed disk images that are in the resource group.

Managed disks are created from disk images and then attached to the machines. Generally, the images are created from a base image or a custom image (e.g., Packer)

    its('managed_disk_image_count') { should eq 5 }

### managed_disk_count

Tests the number of managed disks in the resource group.

If a resource group contains one virtual machine with an OS disk and 2 data disks that are all Managed Disks, then the count would be 3.

    its('managed_disk_count') { should eq 3 }

## Matchers

This resource has a number of special matchers that provide a simple way to test if a specific Azure Resource type exists in the resource group.

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### have_nics

Use this matcher to test if network interfaces exist.

    it { should have_nics }

### have_vms

Use this matcher to test that virtual machines exist.

    it { should have_vms }

### have_extensions

Use this matcher to test for virtual machine extensions.

    it { should have_extensions }

### have_nsgs

Use this matcher to test that network security groups exist.

    it { should have_nsgs }

### have_vnets

Use this matcher to test that virtual networks exist.

    it { should have_vnets }

### have_managed_disks

Use this matcher to test that managed disks exist.

    it { should have_managed_disks }

### have_managed_disk_images

Use this matcher to test that managed disk images exist.

    it { should have_managed_disk_images }

### have_sas

Use this matcher to test that storage accounts exist.

    it { should have_sas }

### have_public_ips

Use this matcher to test that public ips exist.

    it { should have_public_ips }

## Tags

It is possible to test the tags that have been assigned to the resource. There are some properties for checking that a resource has tags, that it has the correct number of tags, and that the correct tags are assigned.

### have_tags

This is a simple test to see if the machine has tags assigned to it or not.

    it { should have_tags }

### tag_count

Returns the number of tags that are assigned to the resource

    its ('tag_count') { should eq 2 }

### tags

It is possible to check if a specific tag has been set on the resource.

    its('tags') { should include 'owner' }

### xxx_tag

To get the value of the tag, some properties are created from the tags themselves.

For example, if the following tag is set on a resource:

- owner: JG Jinglehimerschmidt

Then a property is available called `Owner_tag`.

    its('owner_tag') { should cmp 'JG Jinglehimerschmidt' }

Note: The tag name is case sensitive which makes the test case sensitive. E.g. `owner_tag` does not equal `Owner_tag`.

## References

For more information on Azure Ruby SDK resources, see:

- [Azure Ruby SDK - Resources](https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_resources)
- [Resource Group](https://github.com/chef/inspec/blob/fc990346f2438690f0ac36a9f6606e61574a79b8/test/azure/verify/controls/resource_group.rb)
