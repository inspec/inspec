+++
title = "azurerm_aks_cluster resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_aks_cluster"
    identifier = "inspec/resources/azure/azurerm_aks_cluster.md azurerm_aks_cluster resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_aks_cluster` InSpec audit resource to test properties of an Azure AKS Cluster.

## Azure REST API version

This resource interacts with version `2018-03-31` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/aks/managedclusters/get).

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

An `azurerm_aks_cluster` resource block identifies an AKS Cluster by name and Resource Group.

    describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
      ...
    end

## Examples

### Test that an example Resource Group has the specified AKS Cluster

    describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
      it { should exist }
    end

### Test that a specified AKS cluster was successfully provisioned

    describe azurerm_network_security_group(resource_group: 'example', name: 'ClusterName') do
      its('properties.provisioningState') { should cmp 'Succeeded' }
    end

### Test that a specified AKS cluster the correct number of nodes in pool

    describe azurerm_network_security_group(resource_group: 'example', name: 'ClusterName') do
      its('properties.agentPoolProfiles.first.count') { should cmp 5 }
    end

## Parameters

- `name`
- `resource_group`

## Parameter Examples

The Resource Group as well as the AKS Cluster name.

    describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
      it { should exist }
    end

## Attributes

All of the attributes are avialable via dot notation. This is an example of the currently available attributes.

```
control 'azurerm_aks_cluster' do
  describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
    it { should exist }
    its('properties.provisioningState') { should cmp 'Succeeded' }
    its('properties.kubernetesVersion') { should cmp '1.11.3' }
    its('properties.dnsPrefix') { should cmp 'ClusterName' }
    its('properties.fqdn') { should cmp 'ClusterName' }
    its('properties.agentPoolProfiles.first.name') { should cmp 'agentpool' }
    its('properties.agentPoolProfiles.first.count') { should cmp 3 }
    its('properties.agentPoolProfiles.first.vmSize') { should cmp 'Standard_DS2_V2' }
    its('properties.agentPoolProfiles.first.storageProfile') { should cmp 'ManagedDisks' }
    its('properties.agentPoolProfiles.first.maxPods') { should cmp 110 }
    its('properties.agentPoolProfiles.first.osType') { should cmp 'Linux' }
  end
end
```

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

    # If we expect 'ClusterName' to always exist
    describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
      it { should exist }
    end

    # If we expect 'ClusterName' to never exist
    describe azurerm_aks_cluster(resource_group: 'example', name: 'ClusterName') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
