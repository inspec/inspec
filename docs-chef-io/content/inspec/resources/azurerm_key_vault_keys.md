+++
title = "azurerm_key_vault_keys resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_key_vault_keys"
    identifier = "inspec/resources/azure/azurerm_key_vault_keys.md azurerm_key_vault_keys resource"
    parent = "inspec/resources/azure"
+++

{{< inspec/azurerm_deprecated resource="azure_key_vault_keys" >}}

Use the `azurerm_key_vault_keys` InSpec audit resource to test properties and
configuration of Azure Keys within Vaults.

## Azure REST API version

This resource interacts with version `2016-10-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/keyvault/getkeys/getkeys).

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

An `azurerm_key_vault_keys` resource block returns all Keys within a Vault.

    describe azurerm_key_vault_keys('my-vault') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check Keys within a Vault

    azurerm_key_vault_keys('my-vault').entries.each do |key|
       describe key do
         its('kid')                { should_not be nil }
         its('attributes.enabled') { should eq true }
       end
    end

## Filter Criteria

All fields described in [Attributes](#attributes) can be used to filter. Below is an example using `managed`.

### managed

Filters the results to include only those Keys which are not managed by the Vault. This is a boolean value.

    describe azurerm_key_vault_keys('my-vault').where{ managed.eql?(false) } do
      it { should_not exist }
    end

## Attributes

- `attributes`
- `kid`
- `managed`
- `tags`

### attributes

The key management attributes.

### kid

Key identifier.

### managed

True if the key's lifetime is managed by key vault. If this is a key backing a certificate, then managed will be true.

### tags

Resource tags applied to the Key.

## Matchers

{{% inspec/inspec_matchers_link %}}

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_key_vault_keys('my-vault') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
Your Azure Key Vault should also have this Service Principal listed in it's Access Policy with `keys/list` permissions.
