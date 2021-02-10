+++
title = "azurerm_management_group resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_management_group"
    identifier = "inspec/resources/azure/azurerm_management_group.md azurerm_management_group resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_management_group` InSpec audit resource to test properties related to a
management group.

## Azure REST API version

This resource interacts with version `2018-03-01-preview` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/rest/api/resources/managementgroups/get).

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

The `group_id` must be given as a parameter.

    describe azurerm_management_group(group_id: 'MyGroupId') do
      ...
    end

Optionally, you may use the `expand`, `recurse` and/or `filter` parameters.

    describe azurerm_management_group(group_id: 'MyGroupId', expand: 'children', recurse: true) do
      ...
    end

    describe azurerm_management_group(group_id: 'MyGroupId', expand: 'children', recurse: true, filter: 'children.childType ne Subscription') do
      ...
    end

## Examples

describe azurerm_management_group(group_id: '20000000-0000-0000-0000-000000000000', expand: 'children', recurse: true) do
it { should exist }
its('id') { should eq '/providers/Microsoft.Management/managementGroups/20000000-0000-0000-0000-000000000000' }
its('type') { should eq '/providers/Microsoft.Management/managementGroups' }
its('name') { should eq '20000000-0000-0000-0000-000000000000' }
its('display_name') { should eq 'Management Group Display Name One' }
its('tenant_id') { should eq '56700000-0000-0000-0000-000000000000' }
its('parent_name') { should eq '10000000-0000-0000-0000-000000000000' }
its('parent_id') { should eq '/providers/Microsoft.Management/managementGroups/10000000-0000-0000-0000-000000000000' }
its('parent_display_name') { should eq 'Tenant Root Group' }
its('children_display_names') { should include('Management Group Display Name Child') }
its('children_ids') { should include('/providers/Microsoft.Management/managementGroups/40000000-0000-0000-0000-000000000000') }
its('children_names') { should include('40000000-0000-0000-0000-000000000000') }
its('children_types') { should include('/providers/Microsoft.Management/managementGroups') }
end

describe azurerm_management_group(group_id: '40000000-0000-0000-0000-000000000000', expand: 'children', recurse: true) do
it { should exist }
its('id') { should eq '/providers/Microsoft.Management/managementGroups/40000000-0000-0000-0000-000000000000' }
its('type') { should eq '/providers/Microsoft.Management/managementGroups' }
its('name') { should eq '40000000-0000-0000-0000-000000000000' }
its('display_name') { should eq 'Management Group Display Name Child' }
its('tenant_id') { should eq '56700000-0000-0000-0000-000000000000' }
its('parent_name') { should eq '20000000-0000-0000-0000-000000000000' }
its('parent_id') { should eq '/providers/Microsoft.Management/managementGroups/20000000-0000-0000-0000-000000000000' }
its('parent_display_name') { should eq 'Management Group Display Name One' }
its('children_display_names') { should eq [] }
its('children_ids') { should eq [] }
its('children_names') { should eq [] }
its('children_types') { should eq [] }
end

## Parameters

- `group_id`
- `expand`
- `recurse`
- `filter`

## Parameter Examples

### group_id (required)

Defines the group id of the management group that you wish
to test.

    describe azurerm_management_group(group_id: 'MyGroupId') do
      ...
    end

### expand (optional)

Query string parameter allows clients to request inclusion of children
so that you can test them.

    describe azurerm_management_group(group_id: 'MyGroupId', expand: 'children') do
      ...
    end

### recurse (optional)

Setting this to true allows clients to request inclusion of entire hierarchy in
the response payload. Note that `expand: 'children'` must be passed up if
`recurse` is set to `true`.

    describe azurerm_management_group(group_id: 'MyGroupId', expand: 'children', recurse: true) do
      ...
    end

### filter (optional)

A filter which allows the exclusion of subscriptions from results (i.e. `filter: 'children.childType ne Subscription'`)

    describe azurerm_management_group(group_id: 'MyGroupId', expand: 'children', recurse: true, filter: 'children.childType ne Subscription') do
      ...
    end

## Attributes

- `id`
- `type`
- `name`
- `tenant_id`
- `parent_name`
- `parent_id`
- `parent_display_name`
- `children_display_names`
- `children_ids`
- `children_names`
- `children_roles`
- `children_types`

### id

The management group id.

    its('id') { should eq('/providers/Microsoft.Management/managementGroups/MyGroupId') }

id will be in
format:

    '/providers/Microsoft.Management/managementGroups/<GROUP_ID>'

### type

The management group type.

    its('type') { should eq('/providers/Microsoft.Management/managementGroups') }

### name

The management group name.

    its('name') { should eq('MyGroupName') }

### tenant_id

The management groups tenant id.

    its('tenant_id') { should eq('00000000-0000-0000-0000-000000000000') }

### parent_name

The management group parent name.

    its('parent_name') { should eq('MyGroupsParentName') }

### parent_id

The management group parent id

    its('parent_id') { should eq('/providers/Microsoft.Management/managementGroups/MyGroupsParentId') }

parent_id will be in
format:

    '/providers/Microsoft.Management/managementGroups/<GROUP_ID>'

### parent_display_name

The management groups parent display name

    its('parent_display_name') { should eq('My Groups Parent Display Name!') }

### children_display_names

The management group children display names.

    its('children_display_names') { should include('I am a child of the group!') }

### children_ids

The management group children ids.

    its('children_ids') { should include('/providers/Microsoft.Management/managementGroups/a-child-name') }

### children_names

The management group children names.

    its('children_names') { should include('a-child-name') }

### children_roles

The management group children roles.

    its('children_roles') { should include('/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635') }

### children_types

The management group

    its('children_types') { should include('') }

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

    # If a management group is found it will exist
    describe azurerm_management_group(groupd_id: 'MyGroupId') do
      it { should exist }
    end

    # management groups that aren't found will not exist
    describe azurerm_management_group(groupd_id: 'DoesNotExist') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the Tenant Root Group or the specific management group(s) you wish to test.
