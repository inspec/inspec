+++
title = "azurerm_cosmosdb_database_account resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_cosmosdb_database_account"
    identifier = "inspec/resources/azure/azurerm_cosmosdb_database_account.md azurerm_cosmosdb_database_account resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_cosmosdb_database_account` InSpec audit resource to test properties and configuration of
an Azure CosmosDb Database Account within a Resource Group.

## Azure REST API version

This resource interacts with version `2015-04-08` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/cosmos-db-resource-provider/databaseaccounts/get).

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

This resource first became available in 1.11.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` and `cosmosdb_database_account` must be given as a parameter.

    describe azurerm_cosmosdb_database_account(resource_group: 'my-rg', cosmosdb_database_account 'my-cosmos-db') do
      it { should exist }
    end

## Examples

If an CosmosDb Database Account is referenced with a valid `Resource Group` and `CosmosDb Database Account`

    describe azurerm_cosmosdb_database_account(resource_group: 'my-rg', cosmosdb_database_account 'my-cosmos-db') do
      it { should exist }
    end

If an CosmosDb Database Account is referenced with an invalid `Resource Group` and `CosmosDb Database Account`

    describe azurerm_cosmosdb_database_account(resource_group: 'my-rg', cosmosdb_database_account 'fake-cosmos-db') do
      it { should not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the CosmosDb Database Account belongs.
- `cosmosdb_database_account` - The unique name of the CosmosDb Database Account.

## Attributes

- `id`
- `name`
- `location`
- `type`
- `kind`
- `tags`
- `properties`

### id

Azure resource ID.

### name

CosmosDb Database Account name, e.g. `my-cosmosdb-account`.

### location

Resource location, e.g. `eastus`.

### type

The type of Resource, typically `Microsoft.DocumentDB/databaseAccounts`.

### kind

Indicates the type of database account, e.g. `GlobalDocumentDB`, `MongoDB`

### tags

Resource tags applied to the ComsosDb Account.

### properties

A collection of additional configuration properties related to the CosmosDb Database Account, e.g. `Capability, ConsistencyPolicy, DatabaseAccountKind`.

For a full list of properties please take a look at the [Azure documentation](https://docs.microsoft.com/en-us/rest/api/cosmos-db-resource-provider/databaseaccounts/get#definitions)

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

describe azurerm_cosmosdb_database_account(resource_group: 'my-rg', cosmosdb_database_account 'my-cosmos-db') do
it { should exist }
end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
