+++
title = "azurerm_mysql_databases resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_mysql_databases"
    identifier = "inspec/resources/azure/azurerm_mysql_databases.md azurerm_mysql_databases resource"
    parent = "inspec/resources/azure"
+++

{{< inspec/azurerm_deprecated resource="azure_mysql_databases" >}}

Use the `azurerm_mysql_databases` InSpec audit resource to test properties and configuration of Azure MySQL Databases.

## Azure REST API version

This resource interacts with version `2017-12-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/mysql/flexibleserver/databases/list-by-server).

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

This resource first became available in 1.6.0 of the inspec-azure resource pack.

## Syntax

An `azurerm_mysql_databases` resource block returns all MySQL Databases on a MySQL Server, within a resource group.

    describe azurerm_mysql_databases(resource_group: ..., server_name: ...) do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check MySQL Databases are present

    describe azurerm_mysql_databases(resource_group: 'resource-group-1', server_name: 'production') do
      it            { should exist }
      its('names')  { should include 'my-database-name' }
    end

## Filter Criteria

- `azure_mysql_databases` resources are filterable on all available properties. Below are some examples.

### names

Filters the results to include only those databases that match the given
name. This is a string value.

    describe azurerm_mysql_databases(resource_group: 'rg', server_name: 'server').where{ name.eql?('production-database') } do
      it { should exist }
    end

### location

Filters the results to include only those resource groups that reside in a given location. This is a string value.

    describe azurerm_mysql_databases(resource_group: 'rg', server_name: 'server').where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `type`
- `properties`

### ids

Azure resource ID.

### names

SQL Database name, e.g. `my-sql-database`.

    its('names') { should include 'my-sql-database' }

### type

The type of Resource, typically `Microsoft.Sql/servers/databases`.

### properties

A collection of additional configuration properties related to the MySQL Database, e.g. `collation`.

## Matchers

{{% inspec/inspec_matchers_link %}}

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_mysql_databases do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
