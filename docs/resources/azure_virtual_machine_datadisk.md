---
title:  About the azure_virtual_machine_datadisk Resource
---

# azure_virtual_machine_datadisk

Use this resource to ensure that a specific data disk attached to a machine has been created properly.

## References

- [Azure Ruby SDK - Compute](https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_compute)

## Syntax

The name of the resource group and machine are required to use this resource.

```ruby
describe azure_virtual_machine_data_disk(group_name: 'MyResourceGroup', name: 'MyVM') do
  its('property') { should eq 'value' }
end
```

where 

* Resource Parameters
  * `MyVm` is the name of the virtual machine as seen in Azure. (It is **not** the hostname of the machine)
  * `MyResourceGroup` is the name of the resouce group that the machine is in.
* `property` is one of
   - `count` the number of data disks attached to the machine
   - `have_data_disks` boolean test denoting if data disks are attached
   - `have_managed_disks` boolean test denoting if the data disks are all managed disks or not
   - `disk` the zero based index of the disk attached to the machine
   - `number` disk number of the disk attached to the machine, starting at 1
   - `name` name of the disk
   - `size` size of the disk
   - `lun` the lun of the disk as reported by Azure
   - `caching` the caching that has been set on the disk
   - `create_option` how the disk was created   
   - `is_managed_disk?` if this particular disk is a managed disk or not   
   - `vhd_uri` URI of the disk if it is in a storage account
   - `storage_account_name` the storage account name that the disk is stored in
   - `storage_account_type` if this is a managed disk what is the the storage type
   - `id` the fully qualified id to the disk in Azure
   - `subscription_id` if this is a managed disk the subscription that it is located in
   - `resource_group` if this is a managed disk the resource group that it is in
* `value` is the expected output fdrom the matcher

The `count`, `have_data_disks` and `have_managed_disks` are catchall tests that give information about the virtual machine. The specific tests need to be used in conjunction with the `where` option as shown below.

| Name        | Description                                                                                                         | Required | Example                           |
|-------------|---------------------------------------------------------------------------------------------------------------------|----------|-----------------------------------|
| group_name: | Azure Resource Group to be tested                                                                                   | yes      | MyResourceGroup                   |
| name:       | Name of the Azure resource to test                                                                                  | no       | MyVM                              |
| apiversion: | API Version to use when interrogating the resource. If not set then the latest version for the resoure type is used | no       | 2017-10-9                         |

These options can also be set using the environment variables:

 - `AZURE_RESOURCE_GROUP_NAME`
 - `AZURE_RESOURCE_NAME`
 - `AZURE_RESOURCE_API_VERSION`

When the options have been set as well as the environment variables, the environment variables take priority.

For example:

```ruby
describe azure_virtual_machine_data_disk(group_name: 'Inspec-Azure', name: 'Linux-Internal-VM') do
  its('count') { should cmp > 0 }
  it { should have_data_disks }
end
```

## Matchers

This InSpec audit resource has the following matchers:

### eq

Use the `eq` matcher to test the equality of two values: `its('Port') { should eq '22' }`.

Using `its('Port') { should eq 22 }` will fail because `22` is not a string value! Use the `cmp` matcher for less restrictive value comparisons.

**The following properties are ones that are applied to the virtual machine itself and not specfic disks**

## Properties

### count

Returns the number of data disks attached to the machine

```ruby
its('count') { should eq 1 }
```

### have_data_disks

Returns a boolean denoting if any data disks are attached to the machine

```ruby
it { should have_data_disks }
```

### have_managed_disks

Returns a boolean stating if the machine has Managed Disks for data disks.

```ruby
it { should have_managed_disks }
```

**The next set of attributes require the `where` operation to be used on the describe.**

The following code shows an example of how to use the where clause.

```ruby
describe azure_virtual_machine_data_disk(group_name: 'Inspec-Azure', name: 'Windows-Internal-VM').where(number: 1)
end
```

### disk

The zero based index of the disk attached to the machine.

Typically used in the `where` clause

### number

The '1' based index of the disk attached to the machine.

Typically used in the `where` clause as showm above.

### name

Returns a string of the name of the disk.

### size

Returns an integer of size of this disk in GB.

### lun

The disk number as reported by Azure. This is a zero based index value.

### caching

String stating the caching that has been set on the disk.

### create_option

How the disk was created. Typically for data disks this will be the string value 'Empty'.

### is_managed_disk?

Boolean stating if the disk is a managed disk or not. If it is not a managed disk then it is one that is stored in a Storage Account.

### vhd_uri

If this _not_ a managed disk then the `vhd_uri` will be the full URI to the disk in the storage account.

### storage_account_name

If this is _not_ a managed disk this will be the storage account name in which the disk is stored.

This derived from the `vhd_uri`.  

### storage_account_type

If this is a managed disk this is the storage account type, e.g. `Standard_LRS`

### id

If this is a managed disk then this is the fully qualified id to the disk in Azure.

### subscription_id

If this is a managed disk, this will return the subscription id of where the disk is stored.

This is derived from the `id`.

### resource_group

If this is a managed disk, this returns the resource group in which the disk is stored.

This is derived from the `id`.

## Examples

The following examples show to use this InSpec audit resource.

Please refer to the following integration tests for more in depth examples:

 - [Linux Internal Data Disks](../../test/integration/verify/controls/virtual_machine_linux_external_vm_datadisk.rb)
 - [Windows Internal Data Disk](../../test/integration/verify/controls/virtual_machine_windows_internal_vm_datadisk.rb)
 
### Check that the first data disk is of the correct size
```ruby
describe azure_virtual_machine_data_disk(group_name: 'Inspec-Azure', name: 'Linux-Internal-VM').where(number: 1) do
  its('size') { should cmp >= 15 }
end
```