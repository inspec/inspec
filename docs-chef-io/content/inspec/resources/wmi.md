+++
title = "wmi resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "wmi"
    identifier = "inspec/resources/os/wmi.md wmi resource"
    parent = "inspec/resources/os"
+++

Use the `wmi` Chef InSpec audit resource to test WMI settings on the Windows platform.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `wmi` resource block tests WMI settings on the Windows platform:

    describe wmi({
      class: 'class_name',
      namespace: 'path\\to\\setting',
      filter: 'filter',
      query: 'query'
    }) do
      its('setting_name') { should eq '' }
    end

where

- `class`, `namespace`, `filter`, and `query` comprise a Ruby Hash of the WMI object
- `('class')` is the WMI class to which the setting belongs, such as `win32_service`
- `('namespace')` is path to that object, such as `root\\cimv2`
- Use `('filter')` fine-tune the information defined by the WMI class, such as to find a specific service (`filter: "name like '%winrm%'")`, to find a specific setting (`filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'`), and so on
- Use `('query')` to run a query that returns data to be tested, such as `"SELECT Setting FROM RSOP_SecuritySettingBoolean WHERE KeyName='LSAAnonymousNameLookup' AND Precedence=1"`
- `('setting_name')` is a setting in the WMI object to be tested, and then `should eq ''` is the expected value for that setting

For example, both of the following tests will verify if WinRM is present on the target node. The first tests if WinRM belongs to the list of services running under the `win32_service` class:

    describe wmi({class: 'win32_service'}) do
      its('DisplayName') { should include 'Windows Remote Management (WS-Management)'}
    end

and the second uses a filter in the Ruby Hash to first identify WinRM, and then perform additional tests:

    describe wmi({
      class: 'win32_service',
      filter: "name like '%winrm%'"
    }) do
      its('Status') { should cmp 'ok' }
      its('State') { should cmp 'Running' }
      its('ExitCode') { should cmp 0 }
      its('DisplayName') { should eq 'Windows Remote Management (WS-Management)'}
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a password expiration policy

    describe wmi({
      class: 'RSOP_SecuritySettingNumeric',
      namespace: 'root\\rsop\\computer',
      filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
    }) do
       its('Setting') { should eq 1 }
    end

### Test if an anonymous user can query the Local Security Authority (LSA)

    describe wmi({
      namespace: 'root\\rsop\\computer',
      query: "SELECT Setting FROM RSOP_SecuritySettingBoolean WHERE KeyName='LSAAnonymousNameLookup' AND Precedence=1"
    }) do
      its('Setting') { should eq false }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
