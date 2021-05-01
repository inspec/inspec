---
title: About the azurerm_monitor_activity_log_alerts Resource
platform: azure
---

# azurerm\_monitor\_activity\_log\_alerts

Use the `azurerm_monitor_activity_log_alerts` InSpec audit resource to verify that an
Activity Log Alert exists.

<br />

## Azure REST API version

This resource interacts with version `2017-04-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/monitor/activitylogalerts/listbysubscriptionid).

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

An `azurerm_monitor_activity_log_alerts` resource block identifies Activity Log Alerts by
name.

    describe azurerm_monitor_activity_log_alerts do
      ...
    end

<br />

## Examples

### Test that an example resource has an Activity Log Alert

    describe azurerm_monitor_activity_log_alerts do
      its('names') { should include('ExampleLogAlert') }
    end

<br />

## Attributes

  - `names`

### names

The name of the Activity Log Alert

    its('names') { should include('ExampleLogAlert') }

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](https://www.inspec.io/docs/reference/matchers/).

### exists

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'ExampleLogAlert' to exist
    describe azurerm_monitor_activity_log_alerts do
      it { should exist }
    end

    # If we do not expect 'ExampleLogAlert' to exist
    describe azurerm_monitor_activity_log_alerts do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
