+++
title = "azurerm_security_center_policies resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_security_center_policies"
    identifier = "inspec/resources/azure/azurerm_security_center_policies.md azurerm_security_center_policies resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_security_center_policies` InSpec audit resource to test
properties of some or all Azure Security Center Policies.

Security Center Policies are defined for each Resource Group. A Security Center Policy
called `default` also exists for every subscription.

## Azure REST API version

This resource interacts with version `2015-06-01-Preview` of the Azure
Management API. For more information see the [official Azure documentation](<https://docs.microsoft.com/en-us/previous-versions/azure/reference/mt704061(v%3dazure.100)>).

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

An `azurerm_security_center_policies` resource block uses an optional filter to
select a group of Security Center Policies and confirm that the expected groups
exist.

    describe azurerm_security_center_policies do
      ...
    end

## Examples

### Check for a Security Center Policy

    describe azurerm_security_center_policies do
      its('names') { should include 'default' }
    end

### Assert default Security Center Policy exists

    describe azurerm_security_center_policies.where(name: 'default')
      it { should exist }
    end

## Filter Criteria

- `names`

### names

Filters the results to include only those Security Center Policies that match the given
name. This is a string value.

    # default should always exist
    describe azurerm_security_center_policies.where(name: 'default')
      it { should exist }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](/inspec/matchers/).

### exists

The control will pass if the filter returns at least one result. Use `should_not` if you
expect zero matches.

    # default should always exist
    describe azurerm_security_center_policies.where(name: 'default')
      it { should exist }
    end

    # this security center policy should not exist
    describe azurerm_security_center_policies.where(name: 'DoesNotExist')
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
