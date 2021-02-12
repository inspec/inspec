+++
title = "windows_firewall resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "windows_firewall"
    identifier = "inspec/resources/os/windows_firewall.md windows_firewall resource"
    parent = "inspec/resources/os"
+++

Use the `windows_firewall` Chef InSpec audit resource to test if a firewall profile is correctly configured on a Windows system.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `windows_firewall` resource block specifies which profile to validate:

    describe windows_firewall('name') do
      it { should be_enabled }
    end

where

* `('name')` must specify the name of a firewall profile, such as `'Public'`, `'Private'` or `'Domain'`
* `be_enabled` is a valid matcher for this resource


## Examples

The following example shows how to use this Chef InSpec audit resource.

### Test if the firewall has the appropriate amount of rules and default Accept

    describe windows_firewall('Public') do
      it { should be_enabled }
      it { should have_default_inbound_allowed }
      its('num_rules') { should eq 219 }
    end

## Properties

The resource compiles the following list of firewall profile properties:

* `description`
* `default_inbound_action`
* `default_outbound_action`
* `allow_inbound_rules`
* `allow_local_firewall_rules`
* `allow_local_ipsec_rules`
* `allow_user_apps`
* `allow_user_ports`
* `allow_unicast_response_to_multicast`
* `notify_on_listen`
* `enable_stealth_mode_for_ipsec`
* `log_max_size_kilobytes`
* `log_allowed`
* `log_blocked`
* `log_ignored`
* `num_rules`

Each of these properties can be used in two distinct ways:

    its('default_inbound_action') { should cmp 'Allow' }

or via matcher:

    it { should have_default_inbound_action 'Allow' }

Shortcuts are defined for:

* `have_default_inbound_allow?`
* `have_default_outbound_allow?`

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_enabled

The `be_enabled` matcher tests if the Profile is enabled:

    it { should be_enabled }
