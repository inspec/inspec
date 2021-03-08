+++
title = "parse_config_file resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "parse_config_file"
    identifier = "inspec/resources/os/parse_config_file.md parse_config_file resource"
    parent = "inspec/resources/os"
+++

Use the `parse_config_file` Chef InSpec audit resource to test arbitrary configuration files. It works in the same way as `parse_config`. Instead of using a command output, this resource works with files.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `parse_config_file` Chef InSpec audit resource block declares the location of the configuration file to be tested, and then which settings in that file are to be tested.

    describe parse_config_file('/path/to/file', { data_config_option: value } ) do
      its('setting') { should eq 1 }
    end

or:

    options = {
      assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: true
    }

    describe parse_config_file('path/to/file', options) do
      its('setting') { should eq 1 }
    end

where each test

- Must declare the location of the configuration file to be tested
- Must declare one (or more) settings to be tested
- May run a command to `stdout`, and then run the test against that output
- May use options to define how configuration data is to be parsed

### Option Names Containing Periods

A possible behavior may occur when attempting to access option names containing periods with `its()`. There are two ways to work around it:

* Access the option by using the `params` attribute of the returned resource object
* Since 4.24.5, `its` can be used by passing the option name in a single-element array. See the `parse config file` examples.

## Options

This resource supports multiple options to parse configuration data. Use the options in an `options` block stated outside of (and immediately before) the actual test. For example:

    options = {
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: true
      }
    describe parse_config_file('path/to/file',  options) do
      its('setting') { should eq 1 }
    end

### assignment_regex

Use `assignment_regex` to test a key value using a regular expression:

    'key = value'

may be tested using the following regular expression, which determines assignment from key to value:

    assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/

### comment_char

Use `comment_char` to test for comments in a configuration file:

    comment_char: '#'

### key_values

Use `key_values` to test how many values a key contains:

    key = a b c

contains three values. To test that value to ensure it only contains one, use:

    key_values: 1

### multiple_values

Use `multiple_values` if the source file uses the same key multiple times. All values will be aggregated in an array:

    # # file structure:
    # key = a
    # key = b
    # key2 = c
    params['key'] = ['a', 'b']
    params['key2'] = ['c']

To use plain key value mapping, use `multiple_values: false`:

    # # file structure:
    # key = a
    # key = b
    # key2 = c
    params['key'] = 'b'
    params['key2'] = 'c'

### standalone_comments

Use `standalone_comments` to parse comments as a line, otherwise inline comments are allowed:

    'key = value # comment'
    params['key'] = 'value # comment'

Use `standalone_comments: false`, to parse the following:

    'key = value # comment'
    params['key'] = 'value'

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test A Configuration Setting

    describe parse_config_file('/path/to/file.conf') do
     its('PARAM_X') { should eq 'Y' }
    end

### Use Options And Then Test A Configuration Setting

    describe parse_config_file('/path/to/file.conf', { multiple_values: true }) do
     its('PARAM_X') { should include 'Y' }
    end

### Test A File With An INI File Structure

`yum.conf` is one example of an INI file structure type.

    describe parse_config_file('/path/to/yum.conf') do
     its('main') { should include('gpgcheck' => '1') }
    end

### Test A Configuration Setting Containing Periods

    describe parse_config_file('/etc/sysctl.conf') do
     its(['kernel.domainname']) { should eq 'example.com' }
    end
