+++
title = "azurerm_storage_account_blob_containers resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_storage_account_blob_containers"
    identifier = "inspec/resources/azure/azurerm_storage_account_blob_containers.md azurerm_storage_account_blob_containers resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_storage_account_blob_containers` InSpec audit resource to test properties and configuration of Blob Containers within an Azure Storage Account.

## Azure REST API version

This resource interacts with version `2018-07-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/storagerp/blobcontainers/blobcontainers_list).

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

An `azurerm_storage_account_blob_containers` block returns all Blob Containers within a given Azure Storage Account.

The `resource_group` and `storage_account_name` must be given as parameters.

    describe azurerm_storage_account_blob_containers(resource_group: 'rg', storage_account_name: 'production') do
        ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Ensure that a Blob Container exists

    describe azurerm_storage_account_blob_containers(resource_group: 'rg', storage_account_name: 'sa') do
      its('names') { should include('my_blob_container') }
    end

## Filter Criteria

- `ids`
- `names`
- `etags`

### names

Filters the results to include only those containers which match the given name. This is a string value.

    describe azurerm_storage_account_blob_containers(resource_group: 'rg', storage_account_name: 'sa') do
      its('names') { should include('my_blob_container') }
    end

## Attributes

- `ids`
- `names`
- `etags`

### ids

Azure resource ID.

### names

Blob Container name, e.g. `my-blob-container`.

    its('names') { should include 'my-blob-container' }

### etags

The etag of the Resource, e.g. `\"0x8D592D74CC20EBA\"`.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_storage_account_blob_containers do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
