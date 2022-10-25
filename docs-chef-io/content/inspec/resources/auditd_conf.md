+++
title = "auditd_conf resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "auditd_conf"
    identifier = "inspec/resources/os/auditd_conf.md auditd_conf resource"
    parent = "inspec/resources/os"
+++

Use the `auditd_conf` Chef InSpec audit resource to test the configuration settings for the audit daemon. This file is typically located under `/etc/audit/auditd.conf'` on Unix and Linux platforms.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `auditd_conf` resource block declares configuration settings that should be tested:

    describe auditd_conf('path') do
      its('keyword') { should cmp 'value' }
    end

where

- `'keyword'` is a configuration setting defined in the `auditd.conf` configuration file
- `('path')` is the non-default path to the `auditd.conf` configuration file
- `{ should cmp 'value' }` is the value that is expected

## Properties

This matcher will match any property listed in the `auditd.conf` configuration file. Property names and expected values are case-insensitive:

- `admin_space_left`, `admin_space_left_action`, `action_mail_acct`, `conf_path`, `content`, `disk_error_action`, `disk_full_action`, `flush`, `freq`, `log_file`, `log_format`, `max_log_file`, `max_log_file_action`, `num_logs`, `params`, `space_left`, `space_left_action`

## Property Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the auditd.conf file

    describe auditd_conf do
      its('log_file') { should cmp '/full/path/to/file' }
      its('log_format') { should cmp 'raw' }
      its('flush') { should cmp 'none' }
      its('freq') { should cmp 1 }
      its('num_logs') { should cmp 0 }
      its('max_log_file') { should cmp 6 }
      its('max_log_file_action') { should cmp 'email' }
      its('space_left') { should cmp 2 }
      its('action_mail_acct') { should cmp 'root' }
      its('space_left_action') { should cmp 'email' }
      its('admin_space_left') { should cmp 1 }
      its('admin_space_left_action') { should cmp 'halt' }
      its('disk_full_action') { should cmp 'halt' }
      its('disk_error_action') { should cmp 'halt' }
    end

    describe file(auditd_conf.conf_path) do
      its('group') { should cmp 'root' }
    end
  
## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### `cmp`

The `cmp` matcher compares values across types.

    its('freq') { should cmp 1 }
