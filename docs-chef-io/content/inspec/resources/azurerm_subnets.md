+++
title = "azurerm_subnets resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_subnets"
    identifier = "inspec/resources/azure/azurerm_subnets.md azurerm_subnets resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm\_subnets` InSpec audit resource to test properties related to
subnets for a resource group.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/subnets/list).

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

This resource first became available in 1.2.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` and 'vnet' must be given as a parameter.

    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      ...
    end

## Examples

    # Exists if any subnetss exist for a given virtual network in the resource group
    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      it { should exist }
    end

## Parameters

- `resource_group`
- 'vnet'

### Parameter Examples

### resource_group (required)

Defines the resource group of the subnet that you wish to test resides in.

    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      ...
    end

### vnet (required)

Defines the virtual network that the subnet that you wish to test is a part of.

    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      ...
    end

### name

Filters the results to only those that match the given name.

    # Insist that MySubnet exists
    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      .where(name: 'MySubnet') do
      it { should exist }
    end

## Attributes

- `names`

### names

Gives a list of all the subnet names in the virtual network.

    its('names') { should include('SubnetName1', 'SubnetName2') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

    # Should not exist if no subnets are in the virtual network
    describe azurerm_subnets(resource_group: 'MyResourceGroup', vnet: 'MyVnetName') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
