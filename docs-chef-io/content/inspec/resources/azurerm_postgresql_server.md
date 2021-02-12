+++
title = "azurerm_postgresql_server resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_postgresql_server"
    identifier = "inspec/resources/azure/azurerm_postgresql_server.md azurerm_postgresql_server resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_postgresql_server` InSpec audit resource to test properties and configuration of
an Azure PostgreSQL Server.

## Azure REST API version

This resource interacts with version `2017-12-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/postgresql/databases/get).

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

This resource first became available in 1.7.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` and `server_name` must be given as a parameter.

    describe azurerm_postgresql_server(resource_group: 'inspec-resource-group-9', server_name: 'example_server') do
      it { should exist }
    end

## Examples

If a PostgreSQL Server is referenced with a valid `Resource Group` and `Server Name`

    describe azurerm_postgresql_server(resource_group: 'my-rg', server_name: 'sql-server-1') do
      it { should exist }
    end

If a PostgreSQL Server is referenced with an invalid `Resource Group` or `Server Name`

    describe azurerm_postgresql_server(resource_group: 'invalid-rg', server_name: 'i-dont-exist') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the SQL Server belongs.
- `server_name` - The unique name of the SQL Server.

## Attributes

- `id`
- `name`
- `sku`
- `location`
- `properties`
- `type`

### id

Azure resource ID.

### name

Server name, e.g. `my-sql-server`.

### sku

SKU of server. This is billing information related properties of a server.

### location

Resource location, e.g. `eastus`.

### properties

A collection of additional configuration properties related to the PostgreSQL Server, e.g. `administratorLogin`.

### type

The type of Resource, typically `Microsoft.DBforPostgreSQL/servers`.

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

    describe azurerm_postgresql_server(resource_group: 'my-rg', server_name: 'server-name-1') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
