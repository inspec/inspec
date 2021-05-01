---
title: About the azurerm_subnet Resource
platform: azure
---

# azurerm\_subnet

Use the `azurerm_subnet` InSpec audit resource to test properties related to a
subnet for a given virtual network.

<br />

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/subnets/get).

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

This resource first became available in 1.2.0 of the inspec-azure resource pack.

## Syntax

The `resource_group`, virtual network `vnet`, and subnet 'name' must be given as parameters.
Since subnet must be in the context of a virtual network, this parameter had to be included.

    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      ...
    end

<br />

## Examples
### Ensure that the subnet exists for a given virtual network.
    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      it { should exist }
    end

### Ensure that the subnets address prefix is configured as expected.
    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
        its('address_prefix') { should eq [192.168.0.0/24] }
    end

### Ensure that the subnet is attached to the right network security group.
    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
        its('nsg') { should eq 'NetworkSecurityGroupName'}
    end

<br />

## Parameters

  - `resource_group`, `vnet`, `name`

## Parameter Examples

### resource\_group (required)

Defines the resource group of the subnet that you wish to test resides in.

    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      ...
    end

### vnet (required)

Defines the virtual network that the subnet that you wish to test is a part of.

    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      ...
    end


### name (required)

Defines the name of the subnet that you wish to test.

    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      ...
    end

## Attributes

  - `id`
  - `name`
  - `type`
  - `address_prefix`
  - `nsg`

### id

The subnet's id.

    its('id') { should eq(id) }

Id will be in
    format:

    '/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/Inspec-Azure-mmclane/providers/Microsoft.Network/virtualNetworks/Inspec-VNet/subnets/Inspec-Subnet'

### name

The subnets's name.

    its('name') { should eq('MySubnetName') }

### type

The virtual network's resource type.

    its('type') { should eq 'Microsoft.Network/virtualNetworks/subnets' }

### address\_prefix

The address prefix for the subnet.

    its('address_prefix') { should eq "x.x.x.x/x" }

### nsg

The network security group attached to the subnet.

    its('nsg') { should eq 'MyNetworkSecurityGroupName' }

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

    # If a subnet is found it will exist
    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'MySubnetName') do
      it { should exist }
    end

    # subnets that aren't found will not exist
    describe azurerm_subnet(resource_group: 'MyResourceGroup', vnet: 'MyVnetName', name: 'DoesNotExist') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
