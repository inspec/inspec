+++
title = "azurerm_sql_database resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_sql_database"
    identifier = "inspec/resources/azure/azurerm_sql_database.md azurerm_sql_database resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_sql_database` InSpec audit resource to test properties and configuration of
an Azure SQL Database on a SQL Server.

## Azure REST API version

This resource interacts with version `2017-10-01-preview` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/sql/databases/get).

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

This resource first became available in 1.2.0 of the inspec-azure resource pack.

## Syntax

The `resource_group`, `server_name` and `database_name` must be given as a parameter.

    describe azurerm_sql_database(resource_group: 'inspec-rg', server_name: 'customer_server', database_name: 'order-db') do
      it { should exist }
    end

## Examples

If a SQL Database is referenced with a valid `Resource Group`, `Server Name` and `Database name`

    describe azurerm_sql_database(resource_group: 'inspec-rg', server_name: 'customer_server', database_name: 'order-db') do
      it            { should exist }
      its('name')   { should be 'order-db'}
    end

If a SQL Database is referenced with an invalid `Resource Group`, `Server Name` or `Database Name`

    describe azurerm_sql_database(resource_group: 'inspec-rg', server_name: 'customer_server', database_name: 'invalid-db-name') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the SQL Server belongs.
- `server_name` - The unique name of the SQL Server.
- `database_name` - The unique name of the SQL Database.

## Attributes

- `id`
- `name`
- `kind`
- `location`
- `type`
- `sku`
- `properties`

### id

Azure resource ID.

### name

SQL Server name, e.g. `customer-database`.

### kind

Kind of sql database. This is metadata used for the Azure portal experience.

### location

Resource location, e.g. `eastus`.

### type

The type of Resource, typically `Microsoft.Sql/servers/databases`.

### sku

The name and tier of the SKU.

### properties

A collection of additional configuration properties related to the SQL Database, e.g. `collation`.

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

    describe azurerm_sql_database(resource_group: 'my-rg', server_name: 'server-name-1', database_name: 'customer-db') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
