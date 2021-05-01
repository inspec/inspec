---
title: About the azurerm_network_watchers Resource
platform: azure
---

# azurerm\_network\_watchers

Use the `azurerm_network_watchers` InSpec audit resource to verify that a Network Watcher
exists.

<br />

## Azure REST API version

This resource interacts with version `2018-02-01` of the Azure Management API.
For more information see the [official Azure
documentation](https://docs.microsoft.com/en-us/rest/api/network-watcher/networkwatchers/list).

At the moment, there doesn't appear to be a way to select the version of the
Azure API docs. If you notice a newer version being referenced in the official
documentation please open an issue or submit a pull request using the updated
version.

## Availability

### Installation

This resource is available in the `inspec-azure` [resource
pack](https://www.inspec.io/docs/reference/glossary/#resource-pack). To use it, add the
following to your `inspec.yml` in your top-level profile:

    depends:
      inspec-azure:
        git: https://github.com/inspec/inspec-azure.git

You'll also need to setup your Azure credentials; see the resource pack
[README](https://github.com/inspec/inspec-azure#inspec-for-azure).

## Syntax

An `azurerm_network_watchers` resource block identifies Network Watchers by Resource
Group.

    describe azurerm_network_watchers(resource_group: 'example_group') do
      ...
    end

<br />

## Examples

### Test that an example Resource Group has the named Network Watcher

    describe azurerm_network_watchers(resource_group: 'example_group') do
      its('names') { should include('ExampleNetworkWatcher') }
    end

<br />

## Attributes

  - `names`

### names

The name of the Network Watcher

    its('names') { should include('ExampleNetworkWatcher') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](https://www.inspec.io/docs/reference/matchers/).

### exists

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'ExampleGroup' Resource Group to have Network Watchers
    describe azurerm_network_watchers(resource_group: 'ExampleGroup') do
      it { should exist }
    end

    # If we expect 'MissingExampleGroup' Resource Group to not have Network Watchers
    describe azurerm_network_watchers(resource_group: 'MissingExampleGroup') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
