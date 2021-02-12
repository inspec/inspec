+++
title = "azurerm_virtual_machine_disk resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_virtual_machine_disk"
    identifier = "inspec/resources/azure/azurerm_virtual_machine_disk.md azurerm_virtual_machine_disk resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_virtual_machine_disk` InSpec audit resource to test properties related to
a virtual machine's disk. This resource will only support managed disks. If your disk is
not managed it will not `exist` to the matcher.

## Azure REST API version

This resource interacts with version `2017-03-30` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/compute/disks/get).

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

This resource first became available in 1.0.0 of the inspec-azure resource pack.

## Syntax

The `resource_group` and `name` must be given as parameters.

    describe azurerm_virtual_machine_disk(resource_group: 'MyResourceGroup', name: 'MyDiskName') do
      ...
    end

## Examples

    # If a disk is found it will exist
    describe azurerm_virtual_machine_disk(resource_group: 'MyResourceGroup', name: 'MyDiskName') do
      it { should exist }
    end

    # Check if encryption is enabled
    describe azurerm_virtual_machine_disk(resource_group: 'MyResourceGroup', name: 'MyDiskName') do
      its('encryption_enabled') { should be true }
    end

## Parameters

- `resource_group`, `name`

## Parameter Examples

    # resource_group and name are required parameters
    describe azurerm_virtual_machine_disk(resource_group: 'MyGroup', name: 'MyDiskName') do
      ...
    end

## Attributes

- `id`
- `name`
- `managedBy`
- `sku`
- `properties`
- `type`
- `location`
- `tags`
- `encryption_enabled`

### id

The disk's unique identifier.

    its('id') { should eq(id) }

Id will be in the
format:

    /subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk

### name

The disk's name.

    its('name') { should eq('MyDiskName') }

### managedBy

The resource managing the disk if it is attached to a virtual machine.

    its('managedBy') { should eq(ResourceId) }

ResourceId will be in the
format:

    /subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk

### sku

The disk's sku name (`Standard_LRS`|`StandardSSD_LRS`|`Premium_LRS`).

    its('sku.name') { should eq('Standard_LRS') }

### properties

The disk's properties. This is a hash of key/value pairs.

### type

The disk's type. Will always be `Microsoft.Compute/disks`.

    its('type') { should eq('Microsoft.Compute/disks') }

### location

The disk's location. Will be the region where the disk resides.

    its('location') { should eq('West US') }

### tags

The disk's tags. Will be a hash of key/value pairs.

    its('tags') { should eq({ 'department' => 'IT' })

### encryption_enabled

If the disk is encrypted or not (`true`|`false`).

    its('encryption_enabled') { should be true }

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

    describe azurerm_virtual_machine_disk(resource_group: 'MyResourceGroup', name: 'MyDiskName') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
