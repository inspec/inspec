+++
title = "azurerm_monitor_activity_log_alert resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_monitor_activity_log_alert"
    identifier = "inspec/resources/azure/azurerm_monitor_activity_log_alert.md azurerm_monitor_activity_log_alert resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_monitor_activity_log_alert` InSpec audit resource to test properties
of an Azure Monitor Activity Log Alert.

## Azure REST API version

This resource interacts with version `2017-04-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/monitor/activitylogalerts/get).

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

An `azurerm_monitor_activity_log_alert` resource block identifies an Activity Log Alert by
name and resource group.

    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
      ...
    end

## Examples

### Test that an example resource has an Activity Log Alert

    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
      it { should exist }
    end

### Test an example resource has an Activity Log Alert with the correct operation

    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
      its('operations') { should include 'Microsoft.Authorization/policyAssignments/write' }
    end

## Parameters

- `name`
- `resource_group`

## Parameter Examples

The resource group as well as the Activty Log Alert
name.

    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
      its('operations') { should include 'Microsoft.Authorization/policyAssignments/write' }
    end

## Attributes

For more information on these attributes see [Azure REST API documentation](https://docs.microsoft.com/en-us/rest/api/monitor/activitylogalerts/get#activitylogalertresource).

- `id`
- `name`
- `operations`
- `properties`
- `conditions`

### id

The Activity Log Alert's id.

    its('id') { should eq(id) }

### name

The Activity Log Alert's name.

    its('name') { should eq(name) }

### operations

The operations collection can be checked for the presence or absence of a given
operation string.

    its('operations') { should include 'Microsoft.Authorization/policyAssignments/write' }

### properties.actions

A list of actions that are executed when the condition is met.

### properties.description

Description of this alert.

    its('properties.description') { should eq 'Alert description' }

### properties.enabled

Indicates if this alert is enabled or not (`true`|`false`).

    its('properties.enabled') { should be_true }

### properties.scopes

List of resources this alert applies to. There must be at least one item in
this list.

    its('properties.scopes') { should include 'subscriptions/SUBSCRIPTION_ID' }

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

    # If we expect 'AlertName' to always exist
    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
      it { should exist }
    end

    # If we expect 'OtherAlertName' to never exist
    describe azurerm_monitor_activity_log_alert(resource_group: 'example', name: 'OtherAlertName') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
