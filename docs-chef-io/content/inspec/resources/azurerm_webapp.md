+++
title = "azurerm_webapp resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_webapp"
    identifier = "inspec/resources/azure/azurerm_webapp.md azurerm_webapp resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_webapp` InSpec audit resource to test properties of an Azure Webapp.

## Azure REST API version

This resource interacts with version `2016-08-01` of the Azure Management API.
For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/appservice/webapps/get).

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

## Syntax

An `azurerm_webapp` resource block identifies an AppService Webapp by name and Resource Group.

    describe azurerm_appservice_webapp(resource_group: 'example', name: 'webapp name') do
      ...
    end

## Examples

### Test and Verify That Resource Group Has Specified Webapp

Test that an example Resource Group has the specified Webapp and verify it's
authentication settings are enabled. Verify HTTP 2.0 is enabled.

    describe azurerm_webapp(resource_group: 'example', name: 'webapp_name') do
      it { should exist }
      its('auth_settings.properties') { should have_attributes(enabled: false) }
      its('configuration.properties') { should have_attributes(http20Enabled: true) }
    end

### Test Webapp to Ensure It's Using the Latest Supported Version Of .Net

    describe azurerm_webapp(resource_group: resource_group, name: wa_name) do
      it { should be_using_latest('aspnet') }
    end

### Test Webapp to Ensure It's Using the Latest Supported Version of Python

    describe azurerm_webapp(resource_group: resource_group, name: wa_name) do
      it { should be_using_latest('python') }
    end

## Parameters

- `name`
- `resource_group`

## Parameter Examples

The Resource Group as well as the Webapp name.

    describe azurerm_webapp(resource_group: 'example', name: 'webapp_name') do
      it { should exist }
    end

    describe azurerm_webapp(resource_group: 'example', name: 'webapp_name').auth_settings do
      its('properties') { should have_attributes(enabled: true) }
    end

## Attributes

- `id`
- `name`
- `location`
- `properties`
- `identity`
- `auth_settings`
- `configuration`

All of the attributes are avialable via dot notation. This is an example of the currently available attributes.

```
control 'azurerm_webapp' do
  describe azurerm_webapp(resource_group: 'example', name: 'webapp_name') do
    it                                  { should exist }
    its('properties.enabled')           { should cmp true }
    its('properties.clientCertEnabled') { should cmp true }
    its('properties.enabledHostNames')  { should cmp 'webapp_name.azurewebsites.net' }
    its('properties.httpsOnly')         { should cmp true }
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

### using_latest?(stack)

Asserts whether the deployed Azure WebApp is using the latest supported version of the given language/stack.
Supported stacks (i.e. python, java, php, node) can be found in the `properties`
section of WebApp Configuration [documentation](https://docs.microsoft.com/en-us/rest/api/appservice/webapps/getconfiguration#siteconfigresource).

```
it { should be_using_latest('php') }
it { should be_using_latest('java') }
it { should be_using_latest('python') }
it { should be_using_latest('aspnet') }
it { should be_using_latest('dotnetcore') }
```

### exists

The control will pass if the resource returns a result. Use `should_not` if you expect
zero matches.

    # If we expect 'webapp_name' to have a Managed Service Identity
    describe azurerm_webapp(resource_group: 'example', name: 'webapp_name') do
      it { should have_identity }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
