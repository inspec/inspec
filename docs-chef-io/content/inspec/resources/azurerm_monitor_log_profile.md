+++
title = "azurerm_monitor_log_profile resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_monitor_log_profile"
    identifier = "inspec/resources/azure/azurerm_monitor_log_profile.md azurerm_monitor_log_profile resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_monitor_log_profile` InSpec audit resource to test properties
of an Azure Monitor Log Profile.

## Azure REST API version

This resource interacts with version `2016-03-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/monitor/logprofiles/get).

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

## Syntax

An `azurerm_monitor_log_profile` resource block identifies a Log Profile by name.

    describe azurerm_monitor_log_profile(name: 'default') do
      ...
    end

## Examples

### Test that a Log Profile exists

    describe azurerm_monitor_log_profile(name: 'default') do
      it { should exist }
    end

### Test that Log Profile retention is enabled

    describe azurerm_monitor_log_profile(name: 'default') do
      its('retention_enabled') { should be true }
    end

## Parameters

- `name`

## Parameter Examples

The name of the Log Profile.

    describe azurerm_monitor_log_profile(name: 'default') do
      it { should exist }
    end

## Attributes

- `retention_enabled`
- `retention_days`

### retention_enabled

Determine if retention is enabled

    its('retention_enabled') { should be true }

### retention_days

Determine number of days retention is enabled for

    its('retention_days')    { should eq(365) }

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

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    #  If we expect 'default' to exist
    describe azurerm_monitor_log_profile(name: 'default') do
      it { should exist }
    end

    # If we expect 'default' to not exist
    describe azurerm_monitor_log_profile(name: 'default') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
