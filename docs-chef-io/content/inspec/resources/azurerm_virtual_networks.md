+++
title = "azurerm_virtual_networks resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_virtual_networks"
    identifier = "inspec/resources/azure/azurerm_virtual_networks.md azurerm_virtual_networks resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_virtual_networks` InSpec audit resource to test properties related to
virtual networks for a resource group.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/virtualnetworks/list).

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

This resource first became available in 1.1.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` must be given as a parameter.

    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup') do
      ...
    end

## Examples

    # Exists if any virtual networks exist in the resource group
    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup') do
      it { should exist }
    end

## Parameters

- `resource_group`

### Parameter Examples

### resource_group (required)

    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup') do
      ...
    end

### name

Filters the results to only those that match the given name.

    # Insist that MyVnetName exists
    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup')
      .where(name: 'MyVnetName') do
      it              { should exist }
    end

    # Insist that you have at least one virtual network that starts with 'prefix'
    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup').where { name.start_with?('prefix') } do
      it { should exist }
    end

## Attributes

- `names`

### names

Gives a list of all the virtual network names in the resource group.

    its('names') { should include('VnetName1', 'VnetName2') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

    # Should not exist if no virtual networks are in the resource group
    describe azurerm_virtual_networks(resource_group: 'MyResourceGroup') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
