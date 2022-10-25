+++
title = "registry_key resource"
draft = false
gh_repo = "inspec"
platform = "windows"

[menu]
  [menu.inspec]
    title = "registry_key"
    identifier = "inspec/resources/os/registry_key.md registry_key resource"
    parent = "inspec/resources/os"
+++

Use the `registry_key` Chef InSpec audit resource to test key values in the Windows registry.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `registry_key` resource block declares the item in the Windows registry, the path to a setting under that item, and then one (or more) name/value pairs to be tested.

Use a registry key name and path:

    describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
      its('Start') { should eq 2 }
    end

Use only a registry key path:

    describe registry_key('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
      its('Start') { should eq 2 }
    end

Or use a Ruby Hash:

    describe registry_key({
      name: 'Task Scheduler',
      hive: 'HKEY_LOCAL_MACHINE',
      key: '\SYSTEM\CurrentControlSet\services\Schedule'
    }) do
      its('Start') { should eq 2 }
    end

### Registry Key Path Separators

A Windows registry key can be used as a string in Ruby code, such as when a registry key is used as the name of a recipe. In Ruby, when a registry key is enclosed in a double-quoted string (`" "`), the same backslash character (`\`) that is used to define the registry key path separator is also used in Ruby to define an escape character. Therefore, the registry key path separators must be escaped when they are enclosed in a double-quoted string. For example, the following registry key:

    HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Themes

may be enclosed in a single-quoted string with a single backslash:

    'HKCU\SOFTWARE\path\to\key\Themes'

or may be enclosed in a double-quoted string with an extra backslash as an escape character:

    "HKCU\\SOFTWARE\\path\\to\\key\\Themes"

**Warning**: Please make sure that you use backslashes instead of forward slashes. Forward slashes will not work for registry keys.

    # The following will not work:
    # describe registry_key('HKLM/SOFTWARE/Microsoft/NET Framework Setup/NDP/v4/Full/1033') do
    #   its('Release') { should eq 378675 }
    # end
    # You should use:
    describe registry_key('HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\1033') do
      its('Release') { should eq 378675 }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the start time for the Schedule service

    describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\...\Schedule') do
      its('Start') { should eq 2 }
    end

where `'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule'` is the full path to the setting.

### Use a regular expression in responses

    describe registry_key({
      hive: 'HKEY_LOCAL_MACHINE',
      key: 'SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    }) do
      its('ProductName') { should match /^[a-zA-Z0-9\(\)\s]*2012\s[rR]2[a-zA-Z0-9\(\)\s]*$/ }
    end

## Properties

### user_permissions

The `user_permissions` property returns a hash containing a list of users or groups and their registry key permissions on Windows. For example:

    its('user_permissions') { should cmp { "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" } }

    its('user_permissions') { should include "NT AUTHORITY\\SYSTEM"=>"FullControl" }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### children

The `children` matcher return all of the child items of a registry key. A regular expression may be used to filter child items:

    describe registry_key('Key Name', '\path\to\key').children(regex)
      ...
    end

For example, to get all child items for a registry key:

    describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet').children do
      it { should_not eq [] }
    end

The following example shows how find a property that may exist against multiple registry keys, and then test that property for every registry key in which that property is located:

    describe registry_key({
      hive: 'HKEY_USERS'
    }).children(/^S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]{3,}\\Software\\Policies\\Microsoft\\Windows\\Installer/).each { |key|
        describe registry_key(key) do
          its('AlwaysInstallElevated') { should eq 'value' }
        end
      }

### exist

The `exist` matcher tests if the registry key is present:

    it { should exist }

### have_property

The `have_property` matcher tests if a property exists for a registry key:

    it { should have_property 'value' }

### have_property_value

The `have_property_value` matcher tests if a property value exists for a registry key:

    it { should have_property_value 'value' }

### have_value

The `have_value` matcher tests if a value exists for a registry key:

    it { should have_value 'value' }

### name

The `name` matcher tests the value for the specified registry setting:

    its('name') { should eq 'value' }

### be_inherited

`be_inherited` is a boolean matcher which returns `true` if a registry key has inheritance enabled, otherwise `false`. This matcher only works on Windows systems.

    registry_key('HKEY_USERS\S-1-5-20\Software\Policies\Microsoft\Windows\Control Panel\Desktop') do
      it { should be_inherited }
    end

**Warning**: Any name with a dot will not work as expected: <code>its('explorer.exe') { should eq 'test' }</code>. For details, see <a href="https://github.com/inspec/inspec/issues/1281">https://github.com/inspec/inspec/issues/1281</a>

    # instead of:
    # its('explorer.exe') { should eq 'test' }
    # either use have_property_value...
    it { should have_property_value('explorer.exe', :string, 'test') }

    # ...or provide the name in an array
    its(['explorer.exe']) { should eq 'test' }

The latter workaround may be preferable because upon failure, Chef InSpec will present the expected and actual values:

    inspec> describe registry_key('HKEY_USERS\S-1-5-20\Software\Policies\Microsoft\Windows\Control Panel\Desktop') do
    inspec>   its(["SCRNSAVE.EXE"]) { should eq "FlyingToasters.scr" }
    inspec> end

    Profile: inspec-shell
    Version: (not specified)

      Registry Key HKEY_USERS\S-1-5-20\Software\Policies\Microsoft\Windows\Control Panel\Desktop
         ×  ["SCRNSAVE.EXE"] should eq "FlyingToasters.scr"

         expected: "FlyingToasters.scr"
              got: "scrnsave.scr"

         (compared using ==)


    Test Summary: 0 successful, 1 failure, 0 skipped

`have_property_value` only presents a false assertion:

      Registry Key HKEY_USERS\S-1-5-20\Software\Policies\Microsoft\Windows\Control Panel\Desktop
         ×  should have property value "SCRNSAVE.EXE", "FlyingToasters.scr"
         expected #has_property_value?("SCRNSAVE.EXE", "FlyingToasters.scr") to return true, got false
