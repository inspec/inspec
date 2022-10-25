+++
title = "azurerm_event_hub_event_hub resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_event_hub_event_hub"
    identifier = "inspec/resources/azure/azurerm_event_hub_event_hub.md azurerm_event_hub_event_hub resource"
    parent = "inspec/resources/azure"
+++

{{< inspec/azurerm_deprecated resource="azure_event_hub_event_hub" >}}

Use the `azurerm_event_hub_event_hub` InSpec audit resource to test properties and configuration of
an Azure Event Hub Event Hub within a Resource Group.

## Azure REST API version

This resource interacts with version `2017-04-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/dotnet/api/eventhub?view=bts-2020).

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
      inspec-azure:
        git: https://github.com/inspec/inspec-azure.git

You'll also need to setup your Azure credentials; see the resource pack
[README](https://github.com/inspec/inspec-azure#inspec-for-azure).

### Version

This resource first became available in 1.11.0 of the inspec-azure resource pack.

## Syntax

The `resource_group`, `namespace_name` and `event_hub_name` must be given as a parameter.

    describe azurerm_event_hub_event_hub(resource_group: 'my-rg', namespace_name 'my-event-hub-ns', event_hub_name 'event-hub') do
      it { should exist }
    end

## Examples

If an Event Hub Event Hub is referenced with a valid `Resource Group`, `Namespace Name` and `Event Hub Name`

    describe azurerm_event_hub_event_hub(resource_group: 'my-rg', namespace_name: 'my-event-hub-ns', event_hub_name 'event-hub') do
      it { should exist }
    end

If a Event Hub Event Hub is referenced with an invalid `Resource Group`, `Namespace Name` and `Event Hub Name`

    describe azurerm_event_hub_event_hub(resource_group: 'invalid-rg', namespace_name: 'i-do-not-exist', event_hub_name 'i-do-not-exist') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the Event Hub Event Hub belongs.
- `namespace_name` - The unique name of the Event Hub Namespace.
- `event_hub_name` - The unique name of the Event Hub Name.

## Attributes

- `id`
- `name`
- `type`
- `properties`

### id

Azure resource ID.

### name

Event Hub name, e.g. `event-hub`.

### type

The type of Resource, typically `Microsoft.EventHub/Namespaces/EventHubs`.

### properties

A collection of additional configuration properties related to the Event Hub Event Hub, e.g. `messageRetentionInDays, partitionCount, status`.

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

{{% inspec/inspec_matchers_link %}}

### exists

    describe azurerm_event_hub_event_hub(resource_group: 'my-rg', namespace_name: 'my-event-hub-ns', event_hub_name: 'event-hub') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
