---
title: About the azurerm_virtual_machine Resource
platform: azure
---

# azurerm\_virtual\_machine

Use the `azurerm_virtual_machine` InSpec audit resource to test properties related to a
virtual machine.

<br />

## Azure REST API version

This resource interacts with version `2017-12-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/compute/virtualmachines/get).

At the moment, there doesn't appear to be a way to select the version of the
Azure API docs. If you notice a newer version being referenced in the official
documentation please open an issue or submit a pull request using the updated
version.

## Availability

### Installation

This resource is available in the `inspec-azure` [resource
pack](https://www.inspec.io/docs/reference/glossary/#resource-pack). To use it, add the
following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-azure:
        git: https://github.com/inspec/inspec-azure.git

You'll also need to setup your Azure credentials; see the resource pack
[README](https://github.com/inspec/inspec-azure#inspec-for-azure).

### Version

This resource first became available in 1.0.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` and virtual machine `name` must be given as
    parameters.

    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      ...
    end

<br />

## Examples

### Ensure that the virtual machine has the expected data disks

    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      its('data_disks') { should include 'DataDisk1' }
      its('data_disks') { should include 'DataDisk2' }
    end

### Ensure that the virtual machine has the expected monitoring agent installed

    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      it { should have_monitoring_agent_installed }
    end

<br />

## Parameters

  - `resource_group`, `name`

## Parameter Examples

### resource\_group (required)

Defines the resource group that the virtual machine that you wish to test resides
    in.

    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      ...
    end

### name (required)

Defines the name of the virtual machine that you wish to
    test.

    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      ...
    end

## Attributes

  - `id`
  - `name`
  - `location`
  - `properties`
  - `resources`
  - `tags`
  - `type`
  - `zones`
  - `installed_extensions_types`
  - `installed_extensions_names`
  - `monitoring_agent_installed`
  - `os_disk_name`
  - `data_disk_names`

### id

The virtual machine's id.

    its('id') { should eq(id) }

Id will be in
    format:

    '/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyVirtualMachine'

### name

The virtual machine's name.

    its('name') { should eq('MyVmName') }

### location

The virtual machine's location.

    its('location') { should eq('East US') }

### tags

The virtual machine's tags.

    its('tags') { should eq({ 'key' => 'value' }) }

### type

The virtual machine's resource type.

    its('type') { should eq('Microsoft.Compute/virtualMachines') }

### zones

The virtual machine's availability zones.

    its('zones') should include('zone1', 'zone2')

### os\_disk\_name

The virtual machine's operating system disk name.

    its('os_disk_name') { should eq('OsDiskName') }

### data\_disk\_names

The virtual machine's data disk names.

    its('data_disk_names') { should include('DataDisk1') }

### installed\_extensions\_types

List of all installed extensions' types for the virtual machine.

    its('installed_extensions_types') { should eq(['ExtensionType']) }

### installed\_extensions\_names

List of all installed extensions' names for the virtual machine.

    its('installed_extensions_names') { should eq(['ExtensionName']) }

### Other Attributes

There are additional attributes that may be accessed that we have not
documented. Please take a look at the [Azure documentation](#-Azure-REST-API-version).
Any attribute in the response may be accessed with the key names separated by
dots (`.`).

The API may not always return keys that do not have any associated data. There
may be cases where the deeply nested property may not have the desired
attribute along your call chain. If you find yourself writing tests against
properties that may be nil, fork this resource pack and add an accessor to the
resource. Within that accessor you'll be able to guard against nil keys. Pull
requests are always welcome.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](https://www.inspec.io/docs/reference/matchers/).

### exists

    # If a virtual machine is found it will exist
    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      it { should exist }
    end

    # virtual machines that aren't found will not exist
    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'DoesNotExist') do
      it { should_not exist }
    end

### have\_only\_approved\_extensions

    # Check if a virtual machine has only approved extensions. If an extension
    # is used that's not in the list then the check will fail.
    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      it { should have_only_approved_extensions(['ApprovedExtension', 'OtherApprovedExtensions']) }
    end

### have\_monitoring\_agent\_installed

    # Will be true if the MicrosoftMonitoringAgent is installed (Windows only)
    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      it { should have_monitoring_agent_installed }
    end

### have\_endpoint\_protection\_installed

    # Will be true if any of the given extensions are installed.
    describe azurerm_virtual_machine(resource_group: 'MyResourceGroup', name: 'MyVmName') do
      it { should have_endpoint_protection_installed(['Extension1', 'Extension2']) }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
