+++
title = "azurerm_network_interface resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_network_interface"
    identifier = "inspec/resources/azure/azurerm_network_interface.md azurerm_network_interface resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_network_interface` InSpec audit resource to test properties and configuration of Azure Network Interface.

## Azure REST API version

This resource interacts with version `2018-11-01` of the Azure Management API. For more
information see the [Official Azure Documentation](<https://docs.microsoft.com/en-us/rest/api/virtualnetwork/networkinterface(preview)/get>).

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

The `resource_group` and `name` must be given as a parameter.

    describe azurerm_network_interface(resource_group: 'inspec-resource-group-9',name: 'example-nic-name') do
      it { should exist }
    end

## Examples

If a Network Interface is referenced with a valid `Resource Group` and `Name`

    describe azurerm_network_interface(resource_group: 'my-rg', name: 'name-nic') do
      it { should exist }
    end

If a Network Interface is referenced with an invalid `Resource Group` or `Name`

    describe azurerm_network_interface(resource_group: 'invalid-rg', name: 'i-dont-exist') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the Network Interface belongs.
- `name` - The unique name of the Network interface.

## Attributes

- `id`
- `name`
- `location`
- `properties`
- `tags`
- `type`
- `private_ip`
- `public_ip`

### id

Azure resource ID.

### name

Network interface name, e.g. `vm-nic`.

### location

Resource location, e.g. `eastus`.

### properties

A collection of additional configuration properties related to the Network interface, e.g. `ipConfigurations`.

### tags

Resource tags applied to the Network Interface.

### type

The type of Resource, typically `Microsoft.Network/networkInterfaces`.

### private_ip

The Network interface private IP.

### public_ip

The Network interface public IP.

### Other Attributes

There are additional attributes that may be accessed that we have not
documented. Please take a look at the [Azure documentation](#azure-rest-api-version).
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
page](/inspec/matchers/).

### exists

    describe azurerm_network_interface(resource_group: 'my-rg', name: 'nic-name-1') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
