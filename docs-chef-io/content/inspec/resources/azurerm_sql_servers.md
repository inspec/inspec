+++
title = "azurerm_sql_servers resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_sql_servers"
    identifier = "inspec/resources/azure/azurerm_sql_servers.md azurerm_sql_servers resource"
    parent = "inspec/resources/azure"
+++

{{< inspec/azurerm_deprecated resource="azure_sql_servers" >}}

Use the `azurerm_sql_servers` InSpec audit resource to test properties and configuration of Azure SQL Servers.

## Azure REST API version

This resource interacts with version `2018-06-01-preview` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/sql/servers/list).

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

An `azurerm_sql_servers` resource block returns all Azure SQL Servers, either within a Resource Group (if provided), or within an entire Subscription.

    describe azurerm_sql_servers do
      ...
    end

or

    describe azurerm_sql_servers(resource_group: 'my-rg') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check SQL Servers are present

    describe azurerm_sql_servers do
      it            { should exist }
      its('names')  { should include 'my-server-name' }
    end

## Filter Criteria

### names

Filters the results to include only those servers which match the given name. This is a string value.

    describe azurerm_sql_servers.where{ name.eql?('production-server-5') } do
      it { should exist }
    end

### location

Filters the results to include only those servers which reside in a given location. This is a string value.

    describe azurerm_sql_servers.where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `kind`
- `location`
- `properties`
- `tags`
- `type`

### ids

Azure resource ID.

### names

SQL Server name, e.g. `my-sql-server`.

    its('names') { should include 'my-sql-database' }

### kinds

Kind of sql server. This is metadata used for the Azure portal experience.

### locations

Resource location, e.g. `eastus`.

    its('locations') { should_not include 'eastus' }

### properties

A collection of additional configuration properties related to the SQL Server, e.g. `administratorLogin`.

### tag

Resource tags applied to the SQL Server.

### type

The type of Resource, typically `Microsoft.Sql/servers`.

## Matchers

{{% inspec/inspec_matchers_link %}}

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_sql_servers do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
