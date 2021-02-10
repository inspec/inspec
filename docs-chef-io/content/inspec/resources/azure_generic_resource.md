+++
title = "azure_generic_resource resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azure_generic_resource"
    identifier = "inspec/resources/azure/azure_generic_resource.md azure_generic_resource"
    parent = "inspec/resources/azure"
+++

{{< warning >}}

This resource is deprecated and should not be used. It will be removed in Chef InSpec 5.0. Instead of using any of the demonstration Azure resources included with Chef InSpec, use the [`inspec-azure`](https://github.com/inspec/inspec-azure) resource pack, which offers rich functionality and specific resources to fit many common use cases.

{{< /warning >}}

Use the `azure_generic_resource` Chef InSpec audit resource to test any valid Azure Resource. This is very useful if you need to test something that we do not yet have a specific Chef InSpec resource for.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v2.0.16 of InSpec.

## Syntax

    describe azure_generic_resource(group_name: 'MyResourceGroup', name: 'MyResource') do
      its('property') { should eq 'value' }
    end

where:

- `MyResourceGroup` is the name of the resource group that contains the Azure Resource to be validated
- `MyResource` is the name of the resource that needs to be checked
- `property` This generic resource dynamically creates the properties on the fly based on the type of resource that has been targeted.
- `value` is the expected output from the chosen property

## Parameters

- `group_name`
- `name`
- `apiversion`
- `type`

The options that can be passed to the resource are as follows.

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

### `apiversion`

The API Version to use when querying the resource. Defaults to the latest version for the resource.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM', apiversion: '2.0') do
        ...
    end

### `type`

Use this parameter to define the type of resources to test.

    describe azure_virtual_machine_data_disk(group_name: 'InSpec-Azure', name: 'Windows-Internal-VM', apiversion: '2.0', type: 'Microsoft.Compute/virtualMachines') do
        ...
    end

These options can also be set using the environment variables:

- `AZURE_RESOURCE_GROUP_NAME`
- `AZURE_RESOURCE_NAME`
- `AZURE_RESOURCE_TYPE`
- `AZURE_RESOURCE_API_VERSION`

When the options have been set as well as the environment variables, the environment variables take priority.

### Parameter Example

    describe azure_generic_resource(group_name: 'Inspec-Azure', name: 'Linux-Internal-VM', apiversion: '2.0') do
      its('location') { should eq 'westeurope' }
    end

## Properties

The properties that can be tested are entirely dependent on the Azure Resource that is under scrutiny. That means the properties vary. The best way to see what is available please use the [Azure Resources Portal](https://resources.azure.com) to select the resource you are interested in and see what can be tested.

This resource allows you to test _any_ valid Azure Resource. The trade off for this is that the language to check each item is not as natural as it would be for a native Chef InSpec resource.

## Property Examples

The following examples show how to use some of the Chef InSpec audit properties:

### Tests the virtual machine's location

    its('location') { should cmp 'westeurope' }

### Tests for the presence of a specified address prefix

    its('properties.addressSpace.addressPrefixes') { should include '10.1.1.0/24' }

### Tests that virtual machine was created from the correct disk

    its('properties.creationData.createOption') { should eq 'FromImage' }

### Tests that the image is Ubuntu

    its('properties.creationData.imageReference.id') { should match 'Canonical' }
    its('properties.creationData.imageReference.id') { should match 'UbuntuServer' }
    its('properties.creationData.imageReference.id') { should match '16.04.0-LTS' }

### Tests the disk size

    its('properties.diskSizeGB') { should be > 25 }

### Tests the disk state

    its('properties.diskState') { should cmp 'Attached' }

### Tests that there are no custom DNS settings

    its('properties.dnsSettings.dnsServers.count') { should eq 0 }
    its('properties.dnsSettings.appliedDnsServers.count') { should eq 0 }

### Tests that the NIC is connected to the correct machine

    its('properties.virtualMachine.id') { should match 'Linux-External-VM' }

### Tests that the blob and file services are enabled

    its('properties.encryption.services.blob.enabled') { should be true }
    its('properties.encryption.services.file.enabled') { should be true }
    its('properties.encryption.keySource') { should cmp 'Microsoft.Storage' }

### Test the hardware profile

    its('properties.hardwareProfile.vmSize') { should cmp 'Standard_DS2_v2' }

### Test the network interfaces

    its('properties.networkProfile.networkInterfaces.count') { should eq 1 }

### Test the authentication and OS type

    its('properties.osProfile.computerName') { should eq 'linux-external-1' }
    its('properties.osProfile.adminUsername') { should eq 'azure' }
    its('properties.osProfile.linuxConfiguration.disablePasswordAuthentication') { should be true }

### Test that the tags are properly set

    it { should have_tags }
    its('tag_count') { should be 1 }
    its('tags') { should include 'Description' }
    its('Description_tag') { should match 'Externally facing' }

## Matchers

This Chef InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

## References

Please see the integration tests for in depth examples of how this resource can be used.

[Chef InSpec Integration Tests for Azure Generic Resources](https://github.com/chef/inspec/tree/master/test/integration/azure/verify/controls)
