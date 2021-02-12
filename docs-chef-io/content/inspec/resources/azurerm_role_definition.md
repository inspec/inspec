+++
title = "azurerm_role_definition resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_role_definition"
    identifier = "inspec/resources/azure/azurerm_role_definition.md azurerm_role_definition resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_role_definition` InSpec audit resource to test properties of
an Azure Role Definition.

## Azure REST API version

This resource interacts with version `2015-07-01` of the Management API. For more
information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/authorization/roledefinitions/get#roledefinition).

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

The `name` of the Role must be given as a parameter. For built-in roles, such as `Owner` or `Contributor`, this role name takes the form of a UUID. For `CustomRole`'s which you have added to your subscription yourself, the Name field will be what you choose on creation of the Role.

    describe azurerm_role_definition(name: 'some-custom-role-name') do
      ...
    end

## Examples

Ensure a given role has a specific permission

    describe azurerm_role_definition(name: 'policy-reader-only')
      it { should exist }
        its('permissions_allowed') { should include 'Microsoft.Authorization/policyassignments/read'}
        its('permissions_allowed') { should_not include 'Microsoft.Authorization/policyassignments/write'}
        its('permissions_allowed') { should_not include '*'}
    end

## Attributes

- `id`
- `name`
- `role_name`
- `type`
- `role_type`
- `assignable_scopes`
- `permissions_allowed`
- `permissions_not_allowed`

### id

The object ID of the Role

### name

The name of the Role. For a built-in role this will be an Azure generated UUID. For a CustomRole this will be the name you specified on creation.

### role_name

The human readable name of the Role.

### type

The type of the object, e.g. `Microsoft.Authorization/roleDefinitions`

### role_type

`BuiltInRole` or `CustomRole`

### assignable_scopes

Role Assignable scopes.

### permissions_allowed

Provider permissions granted with this role.

### permissions_not_allowed

Provider permissions blocked with this role.

### Other Attributes

There are additional attributes that may be accessed that we have not
documented. Please take a look at the [Azure documentation](#azure-rest-api-version).
Any attribute in the response may be accessed with the key names separated by
dots (`.`). Given the example response in their documentation:

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

    describe azurerm_role_definition(name: 'some-role') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
