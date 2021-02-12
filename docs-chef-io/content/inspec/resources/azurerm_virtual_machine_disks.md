+++
title = "azurerm_virtual_machine_disks resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_virtual_machine_disks"
    identifier = "inspec/resources/azure/azurerm_virtual_machine_disks.md azurerm_virtual_machine_disks resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_virtual_machine_disks` InSpec audit resource to test properties of
some or all Azure Disks within a subscription.

## Azure REST API version

This resource interacts with version `2019-03-01` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/compute/disks/list).

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

This resource first became available in 1.8.0 of the inspec-azure resource pack.

## Syntax

An `azurerm_virtual_machine_disks` resource block returns all Azure Disks in a subscription.

    describe azurerm_virtual_machine_disks do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check a Disk exists

    describe azurerm_virtual_machine_disks do
      it('names') { should include 'app-server-disk' }
    end

### Ensure there are no detached disks

    describe azurerm_virtual_machine_disks.where { attached == true } do
      it { should_not exist }
    end

## Filter Criteria

- `ids`
- `names`
- `properties`
- `tags`
- `locations`
- `attached`
- `resource_groups`

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_virtual_machine_disks.where { <filter> == <criteria> } do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
