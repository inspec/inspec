+++
title = "etc_hosts_allow resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "etc_hosts_allow"
    identifier = "inspec/resources/os/etc_hosts_allow.md etc_hosts_allow resource"
    parent = "inspec/resources/os"
+++

Use the `etc_hosts_allow` Chef InSpec audit resource to test rules defined for accepting daemon and client traffic in the `'/etc/hosts.allow'` file.

## Availability

### Install

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

### Version

This resource first became available in v1.39.1 of InSpec.

## Syntax

An etc/hosts.allow rule specifies one or more daemons mapped to one or more clients, with zero or more options for accepting traffic when found.

Use the where clause to match a property to one or more rules in the `hosts.allow` file.

    describe etc_hosts_allow.where { daemon == 'value' } do
      its ('client_list') { should include ['values'] }
      its ('options') { should include ['values'] }p
    end

Use the optional constructor parameter to give an alternative path to `hosts.allow` file.

    describe etc_hosts_allow(hosts_path).where { daemon == 'value' } do
      its ('client_list') { should include ['values'] }
      its ('options') { should include ['values'] }
    end

where

- `daemon` is a filter that will be allowed to pass traffic in.
- `client_list`, `options` are the valid resource properties that test the list of clients who will be allowed to pass traffic in, and a list of tasks that are to be done with the rule when traffic is found respectively.

## Properties

### daemon

The `daemon` property returns a string containing the daemon that is allowed in the rule.

    describe etc_hosts_allow.where { client_list == ['127.0.1.154',  '[:fff:fAb0::]'] } do
      its('daemon') { should eq ['vsftpd', 'sshd'] }
    end

### client_list

The `client_list` property returns a 2d string array where each entry contains the clients specified for the rule.

    describe etc_hosts_allow.where { daemon == 'sshd' } do
      its('client_list') { should include ['192.168.0.0/16', '[abcd::0000:1234]'] }
    end

### options

The `options` property returns a 2d string array where each entry contains any options specified for the rule.

    describe etc_hosts_allow.where { daemon == 'sshd' } do
      its('options') { should include ['deny', 'echo "REJECTED"'] }
    end

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}
