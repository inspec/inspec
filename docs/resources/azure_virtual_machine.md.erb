---
title: About the azure_virtual_machine Resource
platform: azure
---

# azure\_virtual\_machine

Use the `azure_virtual_machine` Chef InSpec audit resource to ensure that a Virtual Machine has been provisioned correctly.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v2.0.16 of InSpec.

## Syntax

The name of the machine and the resource group are required as properties to the resource.

    describe azure_virtual_machine(group_name: 'MyResourceGroup', name: 'MyVM') do
      its('property') { should eq 'value' }
    end

where

* `MyVm` is the name of the virtual machine as seen in Azure; it is **not** the hostname of the machine
* `MyResourceGroup` is the name of the machine's resource group
* `property` is one of the resource properties
* `value` is the expected output from the matcher

## Examples

The following examples show to use this Chef InSpec audit resource.

### Check that the first data disk is of the correct size

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Linux-Internal-VM').where(number: 1) do
      its('size') { should cmp >= 15 }
    end

<br>

## Parameters

* `group_name`, `name`, `apiversion`

## Parameter Examples

The options that can be passed to the resource are as follows.

### group_name (required)

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

* `AZURE_RESOURCE_GROUP_NAME`
* `AZURE_RESOURCE_NAME`
* `AZURE_RESOURCE_API_VERSION`

When the options have been set as well as the environment variables, the environment variables take priority.

<br>

## Properties

* `type`, `location`, `name`, `publisher`, `offer`, `sku`, `os_type`, `os_disk_name`, `have_managed_osdisk`, `caching`, `create_option`, `disk_size_gb`, `have_data_disks`, `data_disk_count`  , `storage_account_type`, `vm_size`, `computer_name`, `admin_username`, `have_nics`, `nic_count`, `connected_nics`, `have_password_authentication`, `password_authentication?`, `have_custom_data`, `custom_data?`, `have_ssh_keys`, `ssh_keys?`, `ssh_key_count`, `ssh_keys`, `have_boot_diagnostics`, `boot_diagnostics_storage_uri`

<br>

## Property Examples

This Chef InSpec audit resource has the following properties that can be tested:

### type

The Azure Resource type. For a virtual machine this will always return `Microsoft.Compute/virtualMachines`

    its('type') { should cmp 'Microsoft.Compute/virtualMachines' }

### location

Where the machine is located

    its('location') { should eq 'westeurope' }

### name

Name of the Virtual Machine in Azure. Be aware that this is not the computer name or hostname, rather the name of the machine when seen in the Azure Portal.

    its('name') { should cmp 'InSpec-Azure' }

### publisher

The publisher of this machine's build image.

 `nil` if the machine was created from a custom image.

    its('publisher') { should cmp 'MicrosoftWindowsServer' }

### offer

The offer from the publisher of the build image.

`nil` if the machine was created from a custom image.

    its('offer') { should cmp 'WindowsServer' }

### sku

The item from the publisher that was used to create the image.

`nil` if the machine was created from a custom image.

    its('sku') { should cmp '2016-Datacenter' }

### os\_type

Test that returns the classification in Azure of the operating system type. Usually either `Linux` or `Windows`.

        its('os_type') { should cmp 'Windows' }

### os\_disk\_name

Return the name of the operating system disk attached to the machine.

    its('os_disk_name') { should cmp 'Windows-Internal-OSDisk-MD' }

### caching

Returns the type of caching that has been set on the operating system disk.

    its('caching') { should cmp 'ReadWrite' }

### create\_option

When the operating system disk is created, how it was created is set as a property. This property returns how the disk was created.

    its('create_option') { should cmp 'FromImage' }

### disk\_size\_gb

Returns the size of the operating system disk.

    its('disk_size_gb') { should be >= 30 }

### data\_disk\_count

Return the number of data disks that are attached to the machine

### storage\_account\_type

This provides the storage account type for a machine that is using managed disks for the operating system disk.

    its('storage_account_type') { should cmp 'Standard_LRS' }

### vm\_size

The size of the machine in Azure

    its('vm_size') { should eq 'Standard_DS2_v2' }

### computer\_name

The name of the machine. This is what was assigned to the machine during deployment and is what _should_ be returned by the `hostname` command.

    its('computer_name') { should cmp 'win-internal-1' }

### admin\_username

The admin username that was assigned to the machine

NOTE: Azure does not allow the use of `Administrator` as the admin username on a Windows machine

    its('admin_username') { should cmp 'azure' }

### nic\_count

The number of network interface cards that have been attached to the machine

    its('nic_count') { should eq 1 }

### connected\_nics

This returns an array of the NIC ids that are connected to the machine. This means that it possible to check that the machine has the correct NIC(s) attached and thus on the correct subnet.

    its('connected_nics') { should include /Inspec-NIC-1/ }

Note the use of the regular expression here. This is because the NIC id is a long string that contains the subscription id, resource group, machine id as well as other things. By using the regular expression the NIC can be checked without breaking this string up. It also means that other tests can be performed.

An example of the id string is `/subscriptions/1e0b427a-d58b-494e-ae4f-ee558463ebbf/resourceGroups/Inspec-Azure/providers/Microsoft.Network/networkInterfaces/Inspec-NIC-1`

### password\_authentication?

Boolean to state of password authentication is enabled or not for the admin user.

    its('password_authentication?') { should be false }

This only applies to Linux machines and will always return `true` on Windows.

### custom\_data

Boolean to state if the machine has custom data or not

    its('custom_data') { should be true }

### ssh\_keys?

Boolean to state of the machine is accessible using SSH keys

    its('ssh_keys?') { should be true }

### ssh\_key\_count

Returns how many SSH keys have been applied to the machine.

This only applies to Linux machines and will always return `0` on Windows.

    its('ssh_key_count') { should eq '0' }

### ssh\_keys

Returns an array of the keys that are assigned to the machine. This is check if the correct keys are assigned.

Most SSH public keys have a signature at the end of them that can be tested. For example:

    its('ssh_keys') { should include /azure@inspec.local/ }

### boot\_diagnostics\_storage\_uri

If boot diagnostics are enabled for the machine they will be saved in a storage account. This method returns the URI for the storage account.

    its('boot_diagnostics_storage_uri') { should match 'ghjgjhgjg' }

<br>

## Matchers

There are a number of built in comparison operators that are available to test the result with an expected value.

For information on all that are available please refer to the [Chef InSpec Matchers Reference](https://www.inspec.io/docs/reference/matchers/) page.

### boot\_diagnostics?

Boolean test to see if boot diagnostics have been enabled on the machine

    it { should have_boot_diagnostics }

### have\_custom\_data

Returns a boolean stating if the machine has custom data assigned to it.

    it { should have_custom_data }

### have\_data\_disks

Denotes if the machine has data disks attached to it or not.

    it { should have_data_disks }

### have\_managed\_osdisk

Determine if the operating system disk is a Managed Disks or not.

This test can be used in the following way:

    it { should have_managed_osdisk }

### have\_nics

Returns a boolean to state if the machine has NICs connected or not.

This has can be used in the following way:

    it { should have_nics }

### have\_password\_authentication

Returns a boolean to denote if the machine is accessible using a password.

    it { should have_password_authentication }

### have\_ssh\_keys

Boolean to state if the machine has SSH keys assigned to it

    it { should have_ssh_keys }

For a Windows machine this will always be false.

<br>

## Tags

It is possible to test the tags that have been assigned to the resource. There are a number of properties that can be called to check that it has tags, that it has the correct number and that the correct ones are assigned.

### have\_tags

This is a simple test to see if the machine has tags assigned to it or not.

    it { should have_tags }

### tag\_count

Returns the number of tags that are assigned to the resource

    its ('tag_count') { should eq 2 }

### tags

It is possible to check if a specific tag has been set on the resource.

    its('tags') { should include 'Owner' }

### xxx\_tag

To get the value of the tag, a number of tests have been created from the tags that are set.

For example, if the following tag is set on a resource:

* owner: J.G. Jingleheimerschmidt

Then a test is available called `Owner_tag`.

    its('owner_tag') { should cmp 'J.G. Jingleheimerschmidt' }

Note: The tag name is case sensitive which makes the test case sensitive. E.g. `owner_tag` does not equal `Owner_tag`.

## References

* [Azure Ruby SDK - Resources](https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_resources)
* [Virtual Machine External VM](https://github.com/chef/inspec/blob/fc990346f2438690f0ac36a9f6606e61574a79b8/test/azure/verify/controls/virtual_machine_external_vm.rb)
* [Virtual Machine Internal VM](https://github.com/chef/inspec/blob/fc990346f2438690f0ac36a9f6606e61574a79b8/test/azure/verify/controls/virtual_machine_internal_vm.rb)
