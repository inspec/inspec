+++
title = "azure_virtual_machine_data_disk resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azure_virtual_machine_data_disk"
    identifier = "inspec/resources/azure/azure_virtual_machine_data_disk.md azure_virtual_machine_data_disk resource"
    parent = "inspec/resources/azure"
+++

Use this resource to ensure that a specific data disk attached to a machine has been created properly.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v2.0.16 of InSpec.

## Syntax

The name of the resource group and machine are required to use this resource.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'MyVM') do
      its('property') { should eq 'value' }
    end

where:

- `MyVm` is the name of the virtual machine as seen in Azure. (It is **not** the hostname of the machine)
- `InSpec-Azure` is the name of the resource group that the machine is in.
- `property` is a resource property
- `value` is the expected output from the matcher

## Examples

The following examples show to use this Chef InSpec audit resource.

### Check that the first data disk is of the correct size

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Linux-Internal-VM').where(number: 1) do
      its('size') { should cmp >= 15 }
    end

## Resource Parameters

- `group_name`
- `name`
- `apiversion`

## Parameter Examples

The options that can be passed to the resource are as follows.

### `group_name` (required)

Use this parameter to define the Azure Resource Group to be tested.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure') do
        ...
    end

### name

Use this parameter to define the name of the Azure resource to test.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM') do
        ...
    end

### apiversion

The API Version to use when querying the resource. Defaults to the latest version for the resource.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM', apiversion: '2.0') do
        ...
    end

These options can also be set using the environment variables:

- `AZURE_RESOURCE_GROUP_NAME`
- `AZURE_RESOURCE_NAME`
- `AZURE_RESOURCE_API_VERSION`

When the options have been set as well as the environment variables, the environment variables take priority.

## Filter Criteria

- `number`
- `disk`

## Filter Examples

### disk

The zero based index of the disk attached to the machine.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM').where(disk: 0)
    end

### number

The '1' based index of the disk attached to the machine.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM').where(number: 1)
    end

## Properties

- `count`, `disk`, `number`, `name`, `size`, `lun`, `caching`, `create_option`, `is_managed_disk?`, `vhd_uri`, `storage_account_name`, `storage_account_type`, `id`, `subscription_id`, `resource_group`

## Property Examples

### count

Returns the number of data disks attached to the machine

    its('count') { should eq 1 }

### name

Returns a string of the name of the disk.

    its('name') { should cmp 'linux-external-datadisk-1' }

### size

Returns an integer of size of this disk in GB.

    its('size') { should cmp >= 15 }

### lun

The disk number as reported by Azure. Has a zero-based index value.

    its('lun') { should cmp 0 }

### caching

String stating the caching that has been set on the disk.

    its('caching') { should cmp 'none' }

### create_option

How the disk was created. Typically for data disks, this will be the string value 'Empty'.

    its('create_option') { should cmp 'Empty' }

### is_managed_disk?

Boolean stating if the disk is a managed disk or not. If it is not a managed disk then it is one that is stored in a Storage Account.

    its('is_managed_disk?') { should cmp 'false' }

### vhd_uri

If this is _not_ a managed disk, then the `vhd_uri` will be the full URI to the disk in the storage account.

    its('vhd_uri') { should cmp 'https://primary_storage.blob.core.windows.net/container_name/vm_name.vhd' }

### storage_account_name

If this is _not_ a managed disk this will be the storage account name in which the disk is stored.

This derived from the `vhd_uri`.

    its('storage_account_name') { should cmp 'primary_storage' }

### storage_account_type

If this is a managed disk this is the storage account type, e.g. `Standard_LRS`.

    its('storage_account_type') { should cmp 'Standard_LRS' }

### id

If this is a managed disk then this is the fully qualified id for the disk in Azure.

    its('id') { should cmp '/subscriptions/1234abcd-e567-890f-g123-456h78i9jkl0/resourceGroups/InSpec-Azure' }

### subscription_id

If this is a managed disk, this returns the subscription id of where the disk is stored.

This is derived from the `id`.

    its('subscription_id') { should cmp '1234abcd-e567-890f-g123-456h78i9jkl0' }

### resource_group

If this is a managed disk, this returns the resource group in which the disk is stored.

This is derived from the `id`.

    its('resource_group') { should cmp 'InSpec-Azure' }

## Matchers

This Chef InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

The following properties are applied to the virtual machine itself and not specific disks.

### have_data_disks

Returns a boolean denoting if any data disks are attached to the machine.

    it { should have_data_disks }

### have_managed_disks

Returns a boolean stating if the machine has Managed Disks for data disks.

    it { should have_managed_disks }

## References

- [Azure Ruby SDK - Compute](https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_compute)
- [Linux Internal Data Disks](https://github.com/chef/inspec/blob/master/test/azure/verify/controls/virtual_machine_linux_external_vm_datadisk.rb)
- [Windows Internal Data Disk](https://github.com/chef/inspec/blob/master/test/azure/verify/controls/virtual_machine_windows_internal_vm_datadisk.rb)
