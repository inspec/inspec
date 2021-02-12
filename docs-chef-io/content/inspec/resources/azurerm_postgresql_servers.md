+++
title = "azurerm_postgresql_servers resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_postgresql_servers"
    identifier = "inspec/resources/azure/azurerm_postgresql_servers.md azurerm_postgresql_servers resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_postgresql_servers` InSpec audit resource to test properties and configuration of multiple Azure PostgreSQL Servers.

## Azure REST API version

This resource interacts with version `2017-12-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/postgresql/servers/list).

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

An `azurerm_postgresql_servers` resource block returns all Azure PostgreSQL Servers, either within a Resource Group (if provided), or within an entire Subscription.

    describe azurerm_postgresql_servers do
      ...
    end

or

    describe azurerm_postgresql_servers(resource_group: 'my-rg') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check SQL Servers are present

    describe azurerm_postgresql_servers do
      it            { should exist }
      its('names')  { should include 'my-server-name' }
    end

## Filter Criteria

### names

Filters the results to include only those servers which match the given name. This is a string value.

    describe azurerm_postgresql_servers.where{ name.eql?('production-server-5') } do
      it { should exist }
    end

### location

Filters the results to include only those servers which reside in a given location. This is a string value.

    describe azurerm_postgresql_servers.where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `sku`
- `location`
- `properties`
- `type`

### ids

Azure resource ID.

### names

SQL Server name, e.g. `my-sql-server`.

    its('names') { should include 'my-sql-database' }

### sku

SKU of the server. This is billing information related properties of a server.

### locations

Resource location, e.g. `eastus`.

    its('locations') { should_not include 'eastus' }

### properties

A collection of additional configuration properties related to the PostgreSQL Server, e.g. `administratorLogin`.

### type

The type of Resource, typically `Microsoft.DBforPostgreSQL/servers`.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_postgresql_servers do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
