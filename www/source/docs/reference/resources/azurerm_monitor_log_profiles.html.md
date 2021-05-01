---
title: About the azurerm_monitor_log_profiles Resource
platform: azure
---

# azurerm\_monitor\_log\_profiles

Use the `azurerm_monitor_log_profiles` InSpec audit resource to verify that a Log Profile
exists.

<br />

## Azure REST API version

This resource interacts with version `2016-03-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/monitor/logprofiles/list).

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

An `azurerm_monitor_log_profiles` resource block identifies a Log Profile by name.

    describe azurerm_monitor_log_profiles do
      ...
    end

<br />

## Examples

### Test that an example resource has a Log Profile

    describe azurerm_monitor_log_profiles do
      its('names') { should include('ExampleProfile') }
    end

<br />

## Attributes

  - `names`

### names

The name of the Log Profile

    its('names') { should include('ExampleProfile') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](https://www.inspec.io/docs/reference/matchers/).

### exists

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'ExampleProfile' to exist
    describe azurerm_monitor_log_profiles do
      its('names') { should include('ExampleProfile') }
    end

    # If we expect 'ExampleProfile' to not exist
    describe azurerm_monitor_log_profiles do
      its('names') { should_not include('ExampleProfile') }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
