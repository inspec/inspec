+++
title = "azurerm_network_security_groups resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_network_security_groups"
    identifier = "inspec/resources/azure/azurerm_network_security_groups.md azurerm_network_security_groups resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_network_security_groups` InSpec audit resource to enumerate Network
Security Groups.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/virtualnetwork/networksecuritygroups/list).

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

An `azurerm_network_security_groups` resource block identifies Network Security Groups by
Resource Group.

    describe azurerm_network_security_groups(resource_group: 'ExampleGroup') do
      ...
    end

## Examples

### Test that an example Resource Group has the named Network Security Group

    describe azurerm_network_security_groups(resource_group: 'ExampleGroup') do
      its('names') { should include('ExampleNetworkSecurityGroup') }
    end

## Attributes

- `names`

### names

The name of the Network Security Group

    its('names') { should include('ExampleNetworkSecurityGroup') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'ExampleGroup' Resource Group to have Network Security Groups
    describe azurerm_network_security_groups(resource_group: 'ExampleGroup') do
      it { should exist }
    end

    # If we expect 'EmptyExampleGroup' Resource Group to not have Network Security Groups
    describe azurerm_network_security_groups(resource_group: 'EmptyExampleGroup') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
