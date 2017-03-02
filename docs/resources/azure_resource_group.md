---
title: About the azure_resource_group Resource
---

# azure_resource_group

Use the `azure_resource_group` InSpec audit resource to ensure that an Azure Resource group has the correct resources.

## References

- [Azure Ruby SDK - Resources](https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_resources)

## Syntax

The name of the resource group is specified as an attribute on the resource:

```ruby
describe azure_resource_group(name: 'MyResourceGroup') do
  its('matcher') { should eq 'value' }
end
```

where

* `MyResourceGroup` is the name of the resource group being interrogated
* `matcher` is one of 
  - `total`
  - `count`
  - `nic_count`
  - `vm_count`
  - `vnet_count`
  - `sa_count`
  - `public_ip_count`
  - `contains`
  - `managed_disk_image_count`
  - `managed_disk_count`
* `value` is the expected output from the matcher

For example:

```ruby
describe azure_resource_group(name: 'ChefAutomate') do
  its('total') { should eq 7}
  its('nic_count') { should eq 1 }
  its('vm_count') { should eq 1 }
end
```

## Matchers

This InSpec audit resource has the following matchers:

### eq

Use the `eq` matcher to test the equality of two values: `its('Port') { should eq '22' }`.

Using `its('Port') { should eq 22 }` will fail because `22` is not a string value! Use the `cmp` matcher for less restrictive value comparisons.

### total

The total number of resources in the resource group

### nic_count

The number of network interface cards in the resource group

### vm_count

The number of virtual machines in the resource group

### vnet_count

The number of virtual networks in the resource group

### sa_count

The number of storage accounts in the resource group

### public_ip_count

The number of Public IP Addresses in the resource group

### managed_disk_image_count

The number of managed disk images that are in the resource group.

These are the items from which managed disks are created which are attached to machines. Generally the images are created from a base image or a custom image (e.g. Packer)

### managed_disk_count

The number of managed disks in the resource group.

If a resource group contains one virtual machine with an OS disk and 2 data disks that are all Managed Disks, then the count would be 3.

### contains

The `contains` filter allows testing of resources that are not directly supported by the resource pack:

```ruby
its('contains') { should be true }
```

This matcher is best used in conjunction with filters, for example the following tests that a Managed Disk image exists in the resource group

```ruby
describe azure_resource_group(name: 'MyResourceGroup').where { type: 'Microsoft.Compute/images' } do
  its('contains') { should be true }
end
```

### count

The `count` filter allows testing for the number of resources that are not directly supported by the resource pack:

As before it is best used in conjunction with a filter. The following checks that there is at least 1 Managed Disk Image in the resource group.

```ruby
describe azure_resource_group(name: 'MyResourceGroup').where { type: 'Microsoft.Compute/images' } do
  its('count') { should > 1 }
end
```

## Examples

The following examples show how to use this InSpec audit resource

### Test Resource Group has the correct number of resources

```ruby
describe azure_resource_group(name: 'ChefAutomate') do
  its('total') { should eq 7}
```

### Ensure that the Resource Group contains the correct resources

```ruby
describe azure_resource_group(name: 'ChefAutomate') do
  its('total') { should eq 7 }
  its('vm_count') { should eq 2 }
  its('nic_count') { should eq 2 }
  its('public_ip_count') { should eq 1 }
  its('sa_count') { should eq 1 }
  its('vnet_count') { should eq 1 }
end
```