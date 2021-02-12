+++
title = "azurerm_ad_users resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_ad_users"
    identifier = "inspec/resources/azure/azurerm_ad_users.md azurerm_ad_users resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_ad_users` InSpec audit resource to test properties of
some or all Azure Active Directory users within a Tenant.

## Azure REST API version

This resource interacts with version `1.6` of the Azure Graph API. For more
information see the [official Azure documentation](https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/users-operations#GetUsers).

I don't see a way to select the version of the API in the Azure documents. If
you notice a newer version being referenced in the official documentation
please open an issue or submit a pull request using the updated version.

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

This resource first became available in 1.1.0 of the inspec-azure resource pack.

## Syntax

An `azurerm_ad_users` resource block returns all Azure Active Directory user accounts for the
contained within the configured Tenant and then tests that group group of users.

    describe azurerm_ad_users do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check Users are present

    describe azurerm_ad_users do
      it { should exist }
    end

### Ensure there are no Guest accounts active

    describe azurerm_ad_users.guest_accounts
      it { should_not exist }
    end

## Filter Criteria

- `names`

### names

Filters the results to include only those Users that match the given
name. This is a string value.

    describe azurerm_ad_users.where{ displayName.eql?('Joe Bloggs') } do
      it { should exist }
    end

## Properties

- `object_ids`
- `display_names`
- `mails`
- `user_types`

### object_ids

The azureIds property provides a list of all User's Azure IDs.

    its('azure_ids') { should include '44211066-f292-4546-8ced-2ab0e0911f44' }

### display_names

The displayNames property provides a list of all the User display names.

    its('display_names') { should include 'Azure Admin Account' }

### mails

The mails property provides a list of all the User email addresses, where present.

    its('mails') { should include 'admin@example.com' }

### user_types

The userTypes property provides a list of all User Types for all users.

    its('user_types') { should include 'Member' }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_ad_users do
      it { should exist }
    end

## Azure Permissions

The Client/Active Directory Application you have configured Inspec Azure to use (`AZURE_CLIENT_ID`) must
have permissions to read User data from the Azure Graph RBAC API.

Please refer to the [Microsoft Documentation](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications#updating-an-application)
for information on how to grant these permissions to your application.

Note: An Azure Admin must grant your application these permissions.
