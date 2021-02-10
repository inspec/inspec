+++
title = "azurerm_resource_groups resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_resource_groups"
    identifier = "inspec/resources/azure/azurerm_resource_groups.md azurerm_resource_groups resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_resource_groups` InSpec audit resource to test properties of
some or all Azure Resource Groups

A Resource Group is a grouping of Azure resources. This allows you to issue a common
command on a group of resources.

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure Management API.
For more information see the [official Azure
documentation](https://docs.microsoft.com/en-us/rest/api/resources/resourcegroups/list).

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

An `azurerm_resource_groups` resource block uses an optional filter to select a
group of Resource Groups and then tests that group.

    describe azurerm_resource_groups do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check for a Resource Group

    describe azurerm_resource_groups do
      its('names') { should include 'MyResourceGroup' }
    end

### Insist that your resource group exists

    describe azurerm_resource_groups.where(name: 'MyResourceGroup')
      it { should exist }
    end

### Use names to get all Virtual Machines in Azure

    azurerm_resource_groups.names.each do |resource_group|
      describe azurerm_virtual_machines(resource_group: resource_group, name: 'MyVmName') do
        its('monitoring_agent_installed') { should be true }
      end
    end

## Filter Criteria

- `names`

### names

Filters the results to include only those resource groups that match the given name. This
is a string value.

    describe azurerm_resource_groups.where { name.start_with?('InSpec') } do
      it { should exist }
    end

## Attributes

- `ids`
- `names`
- `tags`

### names

The ids property provides a list of all the Resource Group ids.

    its('ids') { should include 'MyResourceGroupID' }

The names property provides a list of all the Resource Group names.

    its('names') { should include 'MyResourceGroup' }

The tags property provides a list of all the Resource Group tags.

    its('tags') { should include '{MyResourceGroupTag=""}' }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use `should_not` if you
expect zero matches.

    describe azurerm_resource_groups do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
