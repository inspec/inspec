+++
title = "azurerm_iothub_event_hub_consumer_group resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_iothub_event_hub_consumer_group"
    identifier = "inspec/resources/azure/azurerm_iothub_event_hub_consumer_group.md azurerm_iothub_event_hub_consumer_group resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_iothub_event_hub_consumer_group` InSpec audit resource to test
properties and configuration of an Azure IoT Hub Event Hub Consumer Group within
a Resource Group.

## Azure REST API version

This resource interacts with version `2018-04-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/iothub/iothubresource/geteventhubconsumergroup).

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

The `resource_group`, `resource_name`, `event_hub_endpoint` and `consumer_group` must be given as a parameter.

    describe azurerm_iothub_event_hub_consumer_group(resource_group: 'my-rg', resource_name 'my-iot-hub', event_hub_endpoint: 'myeventhub', consumer_group: 'my-consumer-group') do
      it { should exist }
    end

## Examples

If an IoT Hub Event Hub Consumer Group is referenced with a valid `Resource Group`, `Resource Name`, `Event Hub Endpoint` and `Consumer Group`

    describe azurerm_iothub_event_hub_consumer_group(resource_group: 'my-rg', resource_name 'my-iot-hub', event_hub_endpoint: 'myeventhub', consumer_group: 'my-consumer-group') do
      it { should exist }
    end

If an IoT Hub Event Hub Consumer Group is referenced with an invalid `Resource Group`, `Resource Name`, `Event Hub Endpoint` or `Consumer Group`

    describe azurerm_iothub_event_hub_consumer_group(resource_group: 'invalid-rg', resource_name: 'invalid-resource', event_hub_endpoint: 'invalideventhub', consumer_group: 'invalid-consumer-group') do
      it { should_not exist }
    end

## Parameters

- `resource_group` - The resource Group to which the IoT Hub belongs.
- `resource_name` - The unique name of the IoT Hub.
- `event_hub_endpoint` - The unique name of the IoT Hub Endpoint
- `consumer_group` - The unique name of the IoI Hub Endpoint consumer group

## Attributes

- `id`
- `name`
- `type`
- `etag`
- `properties`

### id

Azure resource ID.

### name

The Event Hub-compatible consumer group identifier, e.g. `my-consumer-group`.

### type

The type of Resource, typically `Microsoft.Devices/IotHubs/EventHubEndpoints/ConsumerGroups`.

### properties

A collection of additional configuration properties related to the IoT Hub Consumer Group, e.g. `created`.

### etag

The etag applied to the IoT Hub Consumer Group.

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

    describe azurerm_iothub_event_hub_consumer_group(resource_group: 'my-rg', resource_name 'my-iot-hub', event_hub_endpoint: 'myeventhub', consumer_group: 'my-consumer-group') do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
