+++
title = "azurerm_network_security_group resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_network_security_group"
    identifier = "inspec/resources/azure/azurerm_network_security_group.md azurerm_network_security_group resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_network_security_group` InSpec audit resource to test properties of an
Azure Network Security Group.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/networksecuritygroups/get).

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

## Syntax

An `azurerm_network_security_group` resource block identifies a Network Security Group by
name and Resource
Group.

    describe azurerm_network_security_group(resource_group: 'example', name: 'GroupName') do
      ...
    end

## Examples

### Test that an example Resource Group has the specified Network Security Group

    describe azurerm_network_security_group(resource_group: 'example', name: 'GroupName') do
      it { should exist }
    end

### Test that an example Resource Group has a Network Security Group that allows SSH from the internet

    describe azurerm_network_security_group(resource_group: 'example', name: 'GroupName') do
      it { should allow_ssh_from_internet }
    end

## Parameters

- `name`
- `resource_group`

## Parameter Examples

The Resource Group as well as the Network Security Group
name.

    describe azurerm_network_security_group(resource_group: 'example', name: 'GroupName') do
      it { should allow_rdp_from_internet }
    end

## Attributes

- `security_rules`
- `default_security_rules`
- `allow_ssh_from_internet`
- `allow_rdp_from_internet`
- `properties`

### security_rules

The security_rules property contains the set of Security Rules.

    its('security_rules') { should_not be_empty }

### default_security_rules

The default_security_rules property contains the set of Default Security Rules.

    its('default_security_rules') { should_not be_empty }

### allow_ssh_from_internet

The allow_ssh_from_internet property contains a boolean value determined by analysing
the Security Rules and Default Security Rules for unrestricted SSH access.

    it { should_not allow_ssh_from_internet }

### allow_rdp_from_internet

The allow_rdp_from_internet property contains a boolean value determined by analysing
the Security Rules and Default Security Rules for unrestricted RDP access.

    it { should_not allow_rdp_from_internet }

### allow\port_from_internet

The allow_port_from_internet property contains a boolean value determined by analysing
the Security Rules and Default Security Rules for unrestricted access to a specified port.

    it { should_not allow_port_from_internet('443') }

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

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'GroupName' to always exist
    describe azurerm_network_security_group(resource_group: 'example', name: 'GroupName') do
      it { should exist }
    end

    # If we expect 'EmptyGroupName' to never exist
    describe azurerm_network_security_group(resource_group: 'example', name: 'EmptyGroupName') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
