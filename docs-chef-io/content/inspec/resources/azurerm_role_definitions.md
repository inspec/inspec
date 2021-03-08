+++
title = "azurerm_role_definitions resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_role_definitions"
    identifier = "inspec/resources/azure/azurerm_role_definitions.md azurerm_role_definitions resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_role_definitions` InSpec audit resource to test properties of
some or all Azure Role Definitions.

## Azure REST API version

This resource interacts with version `2015-07-01` of the Azure Graph API. For more
information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/authorization/roledefinitions/list#roledefinition).

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

This resource first became available in 1.3.7 of the inspec-azure resource pack.

## Syntax

An `azurerm_role_definitions` resource block returns all Role definitions within a subscription and allows testing of them.

    describe azurerm_role_definitions do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check a role has the correct permissions are present

describe azurerm_role_definitions.where{name.eql?('Custom-Admin')} do
its ('properties.first.permissions.first') { should have_attributes(actions: ['*']) }
end

### Check a role does not have certain permissions

    describe azurerm_role_definitions do
      its ('properties.first.permissions.first')  { should have_attributes(notActions: [
          'Microsoft.Authorization/*/Delete',
          'Microsoft.Authorization/*/Write',
          'Microsoft.Authorization/elevateAccess/Action',
          'Microsoft.Blueprint/blueprintAssignments/write',
          'Microsoft.Blueprint/blueprintAssignments/delete'
      ]) }
    end

## Filter Criteria

### names

Filters the results to include only those resource groups that match the given
name. This is a string value.

    describe azurerm_role_definitions.where{name.eql?('Custom-Admin') } do
      it { should exist }
    end

## Properties

- `ids`
- `names`
- `properties`

### ids

The Object IDs of the Roles.

### names

The names of the Roles. For a built-in role this will be an Azure generated UUID. For a CustomRole this will be the name you specified on creation.

### properties

Additional properties available for the Roles. May be accessed with dot notation in controls.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_role_definitions do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
