+++
title = "azurerm_key_vault_key resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_key_vault_key"
    identifier = "inspec/resources/azure/azurerm_key_vault_key.md azurerm_key_vault_key resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_key_vault_key` InSpec audit resource to test properties and configuration of
an Azure Key within a Vault.

## Azure REST API version

This resource interacts with version `2016-10-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/keyvault/getkey/getkey).

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

This resource first became available in 1.3.0 of the inspec-azure resource pack.

## Syntax

The `vault_name` and `key_name` must be given as a parameter.

You may also specify a `key_version` - if no version is specified, the most recent version of the key will be used.

    describe azurerm_key_vault_key('vault-101', 'secret-key') do
      its('key.kid')            { should_not be_nil }
      its('attributes.enabled') { should eq true }
    end

## Examples

If a Key Vault Key is referenced with a valid `Vault Name`, `Key Name` and `Key Version`

    describe azurerm_key_vault_key('vault-101', 'secret-key', '7df9bf2c3b4347bab213ebe233f0e350') do
        it                        { should exist }
        its('key.kid')            { should_not be_nil }
        its('attributes.enabled') { should eq true }
    end

If a Key Vault Key is referenced with an invalid `Vault Name` or `Key Name`

    describe azurerm_key_vault_key('vault-101', 'incorrect-key') do
        it { should_not exist }
    end

## Parameters

- `vault_name` - The name of the Key Vault.
- `key_name` - The name of the Key.
- `key_version` (Optional) - The version of a Key, e.g. `7df9bf2c3b4347bab213ebe233f0e350`.

## Attributes

- `attributes`
- `key`
- `managed`
- `tags`

### attributes

The key management attributes.

### key

The JSON web key.

### managed

True if the key's lifetime is managed by key vault. If this is a key backing a certificate, then managed will be true.

### tags

Resource tags applied to the Key.

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

    describe azurerm_key_vault_key('vault-101', 'secret-key') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
Your Azure Key Vault should also have this Service Principal listed in it's Access Policy with both `keys/get` and `keys/list` permissions.
