---
title: About the etc_hosts_allow Resource
platform: linux
---

# etc\_hosts\_allow

Use the `etc_hosts_allow` Chef InSpec audit resource to test rules defined for accepting daemon and client traffic in the `'/etc/hosts.allow'` file.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.39.1 of InSpec.

## Syntax

An etc/hosts.allow rule specifies one or more daemons mapped to one or more clients, with zero or more options to for accepting traffic when found.

Use the where clause to match a property to one or more rules in the hosts.allow file.

    describe etc_hosts_allow.where { daemon == 'value' } do
      its ('client_list') { should include ['values'] }
      its ('options') { should include ['values'] }
    end

Use the optional constructor parameter to give an alternative path to hosts.allow

    describe etc_hosts_allow(hosts_path).where { daemon == 'value' } do
      its ('client_list') { should include ['values'] }
      its ('options') { should include ['values'] }
    end

where

* `daemon` is a daemon that will be allowed to pass traffic in.
* `client_list` is a list of clients will be allowed to pass traffic in.
* `options` is a list of tasks that to be done with the rule when traffic is found.

<br>

## Properties

    'daemon', 'client_list', 'options'

<br>

## Property Examples

### daemon

`daemon` returns a string containing the daemon that is allowed in the rule.

    describe etc_hosts_allow.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] } do
      its('daemon') { should eq ['vsftpd', 'sshd'] }
    end

### client_list

`client_list` returns a 2d string array where each entry contains the clients specified for the rule.

    describe etc_hosts_allow.where { daemon == 'sshd' } do
      its('client_list') { should include ['192.168.0.0/16', '[abcd::0000:1234]'] }
    end

### options

`options` returns a 2d string array where each entry contains any options specified for the rule.

    describe etc_hosts_allow.where { daemon == 'sshd' } do
      its('options') { should include ['deny', 'echo "REJECTED"'] }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
