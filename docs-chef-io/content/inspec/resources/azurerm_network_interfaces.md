+++
title = "azurerm_network_interfaces resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_network_interfaces"
    identifier = "inspec/resources/azure/azurerm_network_interfaces.md azurerm_network_interfaces resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_network_interfaces` InSpec audit resource to test properties and configuration of Azure Network interfaces.

## Azure REST API version

This resource interacts with version `2018-11-01` of the Azure Management API. For more
information see the [Official Azure Documentation](<https://docs.microsoft.com/en-us/rest/api/virtualnetwork/networkinterface(preview)/list>).

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
      inspec-azure:
        git: https://github.com/inspec/inspec-azure.git

You'll also need to setup your Azure credentials; see the resource pack
[README](https://github.com/inspec/inspec-azure#inspec-for-azure).

### Version

This resource first became available in 1.7.2 of the inspec-azure resource pack.

## Syntax

An `azurerm_network_interfaces` resource block returns all Azure Network Interfaces,
either within a Resource Group (if provided), or within an entire Subscription.

    describe azurerm_network_interfaces do
      ...
    end

or

    describe azurerm_network_interfaces(resource_group: 'my-rg') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check Network interfaces are present

    describe azurerm_network_interfaces do
      it            { should exist }
      its('names')  { should include 'my-network-interface-name' }
    end

## Filter Criteria

### names

Filters the results to include only those network interfaces which match the given name. This is a string value.

    describe azurerm_network_interfaces.where{ name.eql?('network-interface-5') } do
      it { should exist }
    end

### location

Filters the results to include only those servers which reside in a given location. This is a string value.

    describe azurerm_network_interfaces.where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `location`
- `properties`
- `tags`
- `type`

### ids

Azure resource ID.

### names

Network interface name, e.g. `nic-name`.

    its('names') { should include 'nic-name' }

### locations

Resource location, e.g. `eastus`.

    its('locations') { should_not include 'eastus' }

### properties

A collection of additional configuration properties related to the Network interface, e.g. `ipConfigurations`.

### tag

Resource tags applied to the Network interface.

### type

The type of Resource, typically `Microsoft.Network/networkInterfaces`.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_network_interfaces do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
