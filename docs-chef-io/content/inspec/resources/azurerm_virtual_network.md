+++
title = "azurerm_virtual_network resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_virtual_network"
    identifier = "inspec/resources/azure/azurerm_virtual_network.md azurerm_virtual_network resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_virtual_network` InSpec audit resource to test properties related to a
virtual network.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/virtualnetworks/get).

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

The `resource_group` and virtual network `name` must be given as
parameters.

    describe azurerm_virtual_network(resource_group: 'MyResourceGroup', name: 'MyVnetName') do
      ...
    end

## Examples

### Ensure That the Virtual Network Exists in the East US Region

    describe azurerm_virtual_network(resource_group: resource_group, name: 'MyVnetName') do
      it               { should exist }
      its('location')  { should eq 'East US' }
    end

### Ensure That the Virtual Network's Dns Servers Are Configured as Expected

    describe azurerm_virtual_network(resource_group: resource_group, name: 'MyVnetName') do
        its('dns_servers') { should eq ["192.168.0.6"] }
    end

### Ensure That the Virtual Network's Address Space Is Configured as Expected

    describe azurerm_virtual_network(resource_group: resource_group, name: 'MyVnetName') do
        its('address_space') { should eq ["192.168.0.0/24"] }
    end

## Parameters

- `resource_group`
- `name`

## Parameter Examples

### resource_group (required)

Defines the resource group that the virtual network that you wish to test resides in.

    describe azurerm_virtual_network(resource_group: 'MyResourceGroup', name: 'MyVnetName') do
      ...
    end

### name (required)

Defines the name of the virtual network that you wish to test.

    describe azurerm_virtual_network(resource_group: 'MyResourceGroup', name: 'MyVnetName') do
      ...
    end

## Attributes

- `id`
- `name`
- `location`
- `tags`
- `type`
- `subnets`
- `address_space`
- `dns_servers`
- `vnet_peerings`
- `enable_ddos_protection`
- `enable_vm_protection`

### id

The virtual network's id.

    its('id') { should eq(id) }

Id will be in
format:

    '/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/Inspec-Azure-mmclane/providers/Microsoft.Network/virtualNetworks/MyVnetName'

### name

The virtual network's name.

    its('name') { should eq('MyVnetName') }

### location

The virtual network's location.

    its('location') { should eq('East US') }

### type

The virtual network's resource type.

    its('type') { should eq 'Microsoft.Network/virtualNetworks' }

### tags

The virtual network's tags.

    its('tags') { should eq({ 'key' => 'value' }) }

### subnets

The list of subnet names that are attached to this virtual network.

    its('subnets') { should eq ["MySubnetName"] }

### address_space

The list of address spaces used by the virtual network.

    its('address_space') { should eq ["x.x.x.x/x"] }

### dns_servers

The list of DNS servers configured for the virtual network. The virtual network returns these IP addresses
when virtual machines makes a DHCP request.

    its('dns_servers') { should eq ["x.x.x.x", "x.x.x.x"] }

### vnet_peerings

A mapping of names and the virtual network ids of the virtual network peerings.

    its('vnet_peerings') { should eq "MyVnetPeeringConnection"=>"PeeringConnectionID"}

### enable_ddos_protection

Boolean value showing if Azure DDoS standard protection is enabled on the virtual network.

    its('enable_ddos_protection') { should eq true }

### enable_vm_protection

Boolean value showing if the virtual network has VM protection enabled.

    its('enable_vm_protection') { should eq false }

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

    # If a virtual network is found it will exist
    describe azurerm_virtual_network(resource_group: 'MyResourceGroup', name: 'MyVnetName') do
      it { should exist }
    end

    # virtual networks that aren't found will not exist
    describe azurerm_virtual_network(resource_group: 'MyResourceGroup', name: 'DoesNotExist') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
