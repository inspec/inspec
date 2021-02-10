+++
title = "azurerm_load_balancers resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_load_balancers"
    identifier = "inspec/resources/azure/azurerm_load_balancers.md azurerm_load_balancers resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_load_balancers` InSpec audit resource to test properties and configuration of Azure Load Balancers.

## Azure REST API version

This resource interacts with version `2018-11-01` of the Azure Management API. For more
information see the [Official Azure Documentation](https://docs.microsoft.com/en-us/rest/api/load-balancer/loadbalancers/list).

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

This resource first became available in 1.7.2 of the inspec-azure resource pack.

## Syntax

An `azurerm_load_balancers` resource block returns all Azure Load Balancers, either within a Resource Group (if provided), or within an entire Subscription.

    describe azurerm_load_balancer do
      ...
    end

or

    describe azurerm_load_balancers(resource_group: 'my-rg') do
      ...
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Check Load balancers are present

    describe azurerm_load_balancers do
      it            { should exist }
      its('names')  { should include 'my-lb' }
    end

## Filter Criteria

### names

Filters the results to include only those load balancers which match the given name. This is a string value.

    describe azurerm_load_balancers.where{ name.eql?('production-lb-5') } do
      it { should exist }
    end

### location

Filters the results to include only those load balancers which reside in a given location. This is a string value.

    describe azurerm_load_balancers.where{ location.eql?('eastus') } do
      it { should exist }
    end

## Attributes

- `id`
- `name`
- `sku`
- `location`
- `properties`
- `tags`
- `type`

### ids

Azure resource ID.

### names

Load balancer name, e.g. `my-lb`.

    its('names') { should include 'my-lb' }

### SKU

SKU of load balancer. This is metadata used for the Azure portal experience.

### locations

Resource location, e.g. `eastus`.

    its('locations') { should_not include 'eastus' }

### properties

A collection of additional configuration properties related to the Load Balancer, e.g. `loadBalancingRules`.

### tag

Resource tags applied to the Load balancer.

### type

The type of Resource, typically `Microsoft.Network/loadBalancers`.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers,
please visit our [Universal Matchers page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use
`should_not` if you expect zero matches.

    describe azurerm_load_balancers do
      it { should exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
