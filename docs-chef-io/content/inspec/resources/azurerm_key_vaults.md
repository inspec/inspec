+++
title = "azurerm_key_vaults resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_key_vaults"
    identifier = "inspec/resources/azure/azurerm_key_vaults.md azurerm_key_vaults resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_key_vaults` InSpec audit resource to test properties and configuration of Azure Key Vaults.

## Azure REST API version

This resource interacts with version `2016-10-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/keyvault/vaults/listbyresourcegroup).

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

An `azurerm_key_vaults` resource block returns all Azure Key Vaults within a Resource Group.

    describe azurerm_key_vaults(resource_group: 'my-rg') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check Key Vaults are present

    describe azurerm_key_vaults(resource_group: 'my-rg') do
      it            { should exist }
      its('names')  { should include 'vault-101' }
    end

## Filter Criteria

### names

Filters the results to include only those vaults which match the given
name. This is a string value.

    describe azurerm_key_vaults(resource_group: 'my-rg').where{ name.eql?('vault-101') } do
      it { should exist }
    end

### location

Filters the results to include only those vaults which reside in a given location. This is a string value.

    describe azurerm_key_vaults(resource_group: 'my-rg').where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `location`
- `type`
- `tags`
- `properties`

### ids

Azure resource ID.

### names

Key Vault name, e.g. `vault-101`.

    its('names') { should include 'vault-101' }

### locations

Resource location, e.g. `eastus`.

    its('locations') { should_not include 'eastus' }

### type

The type of Resource, typically `Microsoft.KeyVault/vaults`.

### tag

Resource tags applied to the Key Vault.

### properties

A collection of additional configuration properties related to the Key Vault, e.g. `vaultUri`.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_key_vaults(resource_group: 'my-rg') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
