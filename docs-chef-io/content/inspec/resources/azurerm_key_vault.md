+++
title = "azurerm_key_vault resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_key_vault"
    identifier = "inspec/resources/azure/azurerm_key_vault.md azurerm_key_vault resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_key_vault` InSpec audit resource to test properties and configuration of
an Azure Key Vault.

## Azure REST API version

This resource interacts with version `2016-10-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/keyvault/vaults/get).

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

The `resource_group` and `vault_name` must be given as a parameter.

    describe azurerm_key_vault(resource_group: 'inspec-resource-group', vault_name: 'vault-101') do
      it            { should exist }
      its('name')   { should eq('vault-101') }
    end

## Examples

If a Key Vault is referenced with a valid `Resource Group` and `Vault Name`

    describe azurerm_key_vault(resource_group: 'my-rg', vault_name: 'vault-101') do
      it { should exist }
    end

If a Key Vault is referenced with an invalid `Resource Group` or `Vault Name`

    describe azurerm_key_vault(resource_group: 'invalid-rg', vault_name: 'vault-null') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the Key Vault belongs.
- `vault_name` - The unique name of the Key Vault.

## Attributes

- `id`
- `name`
- `location`
- `type`
- `tags`
- `properties`

### id

Azure resource ID.

### name

Key Vault name, e.g. `vault-101`.

### location

Resource location, e.g. `eastus`.

### type

The type of Resource, typically `Microsoft.KeyVault/vaults`.

### tags

Resource tags applied to the Key Vault.

### properties

A collection of additional configuration properties related to the Key Vault, e.g. `vaultUri`.

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

    describe azurerm_key_vault(resource_group: 'my-rg', vault_name: 'vault-101') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
