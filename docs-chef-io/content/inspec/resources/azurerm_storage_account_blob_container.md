+++
title = "azurerm_storage_account_blob_container resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_storage_account_blob_container"
    identifier = "inspec/resources/azure/azurerm_storage_account_blob_container.md azurerm_storage_account_blob_container resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_storage_account_blob_container` InSpec audit resource to test properties related to a
Blob Container in an Azure Storage Account.

## Azure REST API version

This resource interacts with version `2018-07-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/storagerp/blobcontainers/blobcontainers_get).

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

An `azurerm_storage_account_blob_container` block returns the requested Blob Container within an Azure Storage Account.

The `resource_group`, `storage_account_name` and `blob_container_name` must be given as
parameters.

    describe azurerm_storage_account_blob_container(resource_group: 'rg', storage_account_name: 'production',
                                                    blob_container_name: 'logs') do
        ...
        ...
    end

## Examples

### Ensure that the Blob Container exists

      describe azurerm_storage_account_blob_container(resource_group: 'rg', storage_account_name: 'default',
                                                      blob_container_name: 'logs') do
        it          { should exist }
        its('name') { should eq('logs') }
      end

### Ensure that the Blob Container is private

    describe azurerm_storage_account_blob_container(resource_group: 'rg', storage_account_name: 'production',
                                                    blob_container_name: 'logs') do
      its('properties') { should have_attributes(publicAccess: 'None') }
    end

## Parameters

- `resource_group`
- `storage_account_name`
- `blob_container_name`

## Attributes

- `id`
- `name`
- `etag`
- `properties`
- `type`

### id

Fully qualified resource ID for the resource, e.g.

    /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{resourceType}/{resourceName}

### name

The name of the resource

### etag

Resource Etag, e.g.

    \"0x8D592D74CC20EBA\"

### properties

Additional properties relating to the Blob Container, e.g.

      its('properties') { should have_attributes(publicAccess: 'None') }

### type

The resource type, e.g.

    Microsoft.Storage/storageAccounts/blobServices/containers

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

      describe azurerm_storage_account_blob_container(resource_group: 'rg', storage_account_name: 'production',
                                                      blob_container_name: 'logs') do
        it { should exist }
      end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
