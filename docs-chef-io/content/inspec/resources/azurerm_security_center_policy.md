+++
title = "azurerm_security_center_policy resource"
draft = false
gh_repo = "inspec"
platform = "azure"

[menu]
  [menu.inspec]
    title = "azurerm_security_center_policy"
    identifier = "inspec/resources/azure/azurerm_security_center_policy.md azurerm_security_center_policy resource"
    parent = "inspec/resources/azure"
+++

Use the `azurerm_security_center_policy` InSpec audit resource to test properties
of the `default` Security Center Policy. Azure currently only supports looking
up the `default` policy via their Rest API. If you attempt to look up a
different Security Policy you will receive an error.

An Azure Security Center Policy defines a set of controls recommended for
resources within this subscription. These settings will generate alerts if
something is found to violate the recommendations. This resource allows you to
inspect what alerts you have configured for your account.

## Azure REST API Version

This resource interacts with version `2015-06-01-Preview` of the Azure
Management API. For more information see the [official Azure documentation](https://docs.microsoft.com/en-us/previous-versions/azure/reference/mt704062%28v%3dazure.100%29).

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

An `azurerm_security_center_policy` resource block identifies a Security Center
Policy by name. In the current Rest API you may only lookup a `default` policy.
If no policy is given the default one will be used.

    describe azurerm_security_center_policy(name: 'default') do
      ...
    end

## Examples

### Assert that the default Security Center Policy exists

    describe azurerm_security_center_policy(name: 'default') do
      it { should exist }
    end

### Assert that the default Security Center Policy has log collection enabled

    describe azurerm_security_center_policy(name: 'default') do
      its('log_collection') { should eq('On') }
    end

### A non default policy may not be searched

    describe azurerm_security_center_policy(name: 'NonDefaultPolicy') do
      it { should_not exist }
    end

## Parameters

- `name`

## Parameter Examples

The name of the Security Center Policy. It must be `default`. If no name is given then it
will search for the `default` Security Center Policy (Optional).

    describe azurerm_security_center_policy(name: 'default') do
      its('log_collection') { should eq('On') }
    end

## Attributes

- `id`
- `name`
- `log_collection`
- `patch`
- `baseline`
- `anti_malware`
- `disk_encryption`
- `network_security_groups`
- `web_application_firewall`
- `next_generation_firewall`
- `vulnerability_assessment`
- `storage_encryption`
- `just_in_time_network_access`
- `app_whitelisting`
- `sql_auditing`
- `sql_transparent_data_encryption`
- `notifications_enabled`,
- `send_security_email_to_admin`
- `contact_emails`
- `contact_phone`
- `pricing_tier`

### id

The id of the Security Center
Policy.

    its('id') { should eq('/subscriptions/<SUBSCRIPTION_ID>/providers/Microsoft.Security/policies/default') }

### name

The name of the Security Center Policy.

    its('name') { should eq('default') }

### log_collection

Log collection indicates if the monitoring agent will collect security data (`On`|`Off`).

    its('log_collection') { should eq('On') }

### pricing_tier

Cost/Feature Model under which the subscription is operating (`Standard`|`Free`).

    its('pricing_tier') { should eq('Standard') }

### patch

Patch indicates if system updates should be enabled for virtual machines (`On`|`Off`).

    its('patch') { should eq('On') }

### baseline

Baseline indicates if OS vulnerabilities recommendations for virtual machines are enabled
(`On`|`Off`).

    its('baseline') { should eq('On') }

### anti_malware

Anti-Malware indicates if endpoint protection recommendations for virtual machines are
enabled (`On`|`Off`).

    its('anti_malware') { should eq('On') }

### disk_encryption

Disk Encryption indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('disk_encryption') { should eq('On') }

### network_security_groups

Network security groups indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('network_security_groups') { should eq('On') }

### web_application_firewall

Web application firewall indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('web_application_firewall') { should eq('On') }

### next_generation_firewall

Next generation firewall indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('next_generation_firewall') { should eq('On') }

### vulnerability_assessment

Vulnerability assessment indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('vulnerability_assessment') { should eq('On') }

### storage_encryption

Storage Encryption indicates if new data in Azure Blobs and Files will be encrypted by default (`On`|`Off`).

    its('storage_encryption') { should eq('On') }

### just_in_time_network_access

Just in time network access indicates if recommendations for virtual machines are enabled
(`On`|`Off`).

    its('just_in_time_network_access') { should eq('On') }

### app_whitelisting

App whitelisting indicates if adaptive application controls are enabled (`On`|`Off`).

    its('app_whitelisting') { should eq('On') }

### sql_auditing

SQL auditing indicates if auditing and threat detection recommendations are enabled
(`On`|`Off`).

    its('sql_auditing') { should eq('On') }

### sql_transparent_data_encryption

SQL transparent data encryption indicates if recommendations are enabled (`On`|`Off`).

    its('sql_transparent_data_encryption') { should eq('On') }

### notifications_enabled

Notifications enabled indicates if security alerts are emailed to the security contact
(`true`|`false`).

    its('notifications_enabled') { should eq(true) }

### send_security_email_to_admin

Send security email to admin indicates if the subscription admin will receive security
alerts (`true`|`false`).

    its('send_security_email_to_admin') { should eq(true) }

### contact_emails

Contact emails contains a list of security email addresses.

    its('contact_emails') { should include('security@example.com') }

### contact_phone

Contact phone contains the security contact phone number.

    its('contact_phone') { should eq('1-111-111-1111') }

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

    # default should always exist
    describe azurerm_security_center_policy(name: 'default') do
      it { should exist }
    end

    # this security center policy should not exist
    describe azurerm_security_center_policy(name: 'DoesNotExist') do
      it { should_not exist }
    end

## Azure Permissions

Your [Service
Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal)
must be setup with a `contributor` role on the subscription you wish to test.
