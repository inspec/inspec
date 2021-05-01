---
title: About the azurerm_ad_user Resource
platform: azure
---

# azurerm\_ad\_user

Use the `azurerm_ad_user` InSpec audit resource to test properties of
an Azure Active Directory user within a Tenant.

<br />

## Azure REST API version

This resource interacts with version `1.6` of the Azure Graph API. For more
information see the [official Azure documentation](https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/users-operations#GetAUser).

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

### Version

This resource first became available in 1.1.0 of the inspec-azure resource pack.

## Syntax

The `user_id` must be given as a parameter.

    describe azurerm_ad_user(user_id: 'someUserId') do
      it { should exist }
    end

<br />

## Examples

If an Active Directory user account is referenced with a valid ID

    describe azurerm_ad_user(user_id: 'someValidId')
      it { should exist }
    end

If an Active Directory user account is referenced with an invalid ID

    describe azurerm_ad_user(user_id: 'someInvalidId')
      it { should_not exist }
    end

<br />

## Parameters

  - `user_id`

## Parameter Examples

    # user_id is a required parameter
    describe azurerm_ad_user(user_id: 'MyUserId') do
        ...
    end

## Attributes

  - `object_id`
  - `account_enabled`
  - `city`
  - `country`
  - `department`
  - `displayName`
  - `facsimile_telephone_number`
  - `given_name`
  - `job_title`
  - `mail`
  - `mail_nickname`
  - `mobile`
  - `password_policies`
  - `password_profile`
  - `postal_code`
  - `state`
  - `street_address`
  - `surname`
  - `telephone_number`
  - `usage_location`
  - `user_principal_name`
  - `user_type`

### object\_id

The user's object ID.

### account\_enabled

Whether the account is enabled.

### city

The user's city.

### country

The user's country.

### department

The user's department.

### displayName

The display name of the user.

### facsimile\_telephone\_number

the user's facsimile (fax) number.

### given\_name

the given name for the user.

### job\_title

the user's job title.

### mail

the primary email address of the user.

### mail\_nickname

The mail alias for the user.

### mobile

The user's mobile (cell) phone number.

### password\_policies

The password policies for the user.

### password\_profile

The password profile for the user.

### postal\_code

The user's postal (ZIP) code.

### state

The user's state.

### street\_address

The user's street address.

### surname

The user's surname (family name or last name).

### telephone\_number

The user's telephone number.

### usage\_location

A two letter country code (ISO standard 3166). Required for users that will be
assigned licenses due to legal requirement to check for availability of
services in countries. Examples include: "US", "JP", and "GB".

### user\_principal\_name

The principal name of the user.

### user\_type

A string value that can be used to classify user types in your directory, such as 'Member' and 'Guest'.

### Other Attributes

There are additional attributes that may be accessed that we have not
documented. Please take a look at the [Azure documentation](#-Azure-REST-API-version).
Any attribute in the response may be accessed with the key names separated by
dots (`.`). Given the example response in their documentation:

```
...
  "preferredLanguage": "en-US",
  "provisionedPlans": [
    {
      "capabilityStatus": "Enabled",
      "provisioningStatus": "Success",
      "service": "exchange"
    },
...
```

We may access `provisioningStatus` with:

```
its('provisionedPlants.first.provisioningStatus') { should eq "Success" }
```

The API may not always return keys that do not have any associated data. There
may be cases where the deeply nested property may not have the desired
attribute along your call chain. If you find yourself writing tests against
properties that may be nil, fork this resource pack and add an accessor to the
resource. Within that accessor you'll be able to guard against nil keys. Pull
requests are always welcome.

## Matchers

This InSpec audit resource has the following special matchers. For a full list of
available matchers, please visit our [Universal Matchers
page](https://www.inspec.io/docs/reference/matchers/).

### exists

    describe azurerm_ad_user(user_id: 'someUserId') do
      it { should exist }
    end

## Azure Permissions

The Client/Active Directory Application you have configured Inspec Azure to use (`AZURE_CLIENT_ID`) must
have permissions to read User data from the Azure Graph RBAC API.

Please refer to the [Microsoft Documentation](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications#updating-an-application)
for information on how to grant these permissions to your application.

<br />

Note: An Azure Admin must grant your application these permissions.
