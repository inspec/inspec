+++
title = "azurerm_virtual_machines resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_virtual_machines"
    identifier = "inspec/resources/azure/azurerm_virtual_machines.md azurerm_virtual_machines resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_virtual_machines` InSpec audit resource to test properties related to
virtual machines for a resource group.

## Azure REST API version

This resource interacts with version `2017-12-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/compute/virtualmachines/list).

At the moment, there doesn't appear to be a way to select the version of the
Azure API docs. If you notice a newer version being referenced in the official
documentation please open an issue or submit a pull request using the updated
version.

## Availability

### Installation

This resource is available in the `inspec-azure` [resource
pack](/inspec/glossary/#resource-pack). To use it, add the
following to your `inspec.yml` in your top-level profile:

    depends:
      - name: inspec-azure
        git: https://github.com/inspec/inspec-azure.git

You'll also need to setup your Azure credentials; see the resource pack
[README](https://github.com/inspec/inspec-azure#inspec-for-azure).

### Version

This resource first became available in 1.0.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` must be given as a parameter.

    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup') do
      ...
    end

## Examples

    # Exists if any virtual machines exist in the resource group
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup') do
      it { should exist }
    end

    # Filters based on platform
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup').where(platform: 'windows') do
      it { should exist }
    end

## Parameters

- `resource_group`

### Parameter Examples

#### resource_group (required)

    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup') do
      ...
    end

## Filter Criteria

- `platform`
- `name`
- `os_disk`

### platform

Filters the results to only include those that match the given platform. Valid choices are
`linux` and `windows`.

    # Insist that you have at least one windows virtual machine
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup').where(platform: 'windows') do
      it { should exist }
    end

### name

Filters the result to only those that match the given name.

    # Insist that you have at least one virtual machine that starts with 'MyVm'
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup').where { name.start_with?('WindowsVm') } do
      it { should exist }
    end

## Attributes

- `os_disks`
- `data_disks`
- `vm_names`

### os_disks

Gives a list of OS disk names for all the virtual machines in the resource group.

    its('os_disks.sort') { should eq ['MyDisk1', 'MyDisk2'] }

### data_disks

Gives a list of data disks for all the virtual machines in the resource group.

    its('os_disks.sort') { should eq [['MyDisk1'], ['MyDisk2']] }

Note that it returns an array of arrays. You may flatten them for testing:

    its('os_disks.flatten.sort') { should eq ['MyDisk1', 'MyDisk2'] }

### vm_names

Gives a list of all the virtual machine names in the resource group.

    its('vm_names') { should include('MyVm1', 'MyVm2') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

    # Should not exist if no virtual machines are in the resource group
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup') do
      it { should_not exist }
    end

    # Should exist if the filter returns a single virtual machine
    describe azurerm_virtual_machines(resource_group: 'MyResourceGroup').where(platform: 'windows') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
