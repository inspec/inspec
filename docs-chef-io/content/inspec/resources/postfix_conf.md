+++
title = "postfix_conf resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "postfix_conf"
    identifier = "inspec/resources/os/postfix_conf.md postfix_conf resource"
    parent = "inspec/resources/os"
+++

Use the `postfix_conf` Chef InSpec audit resource to test the main configuration of the Postfix Mail Transfer Agent.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

## Syntax

A `postfix_conf` resource block declares the configuration settings to be tested:

    describe postfix_conf do
      its('setting_name') { should cmp 'value' }
    end

where

- `'setting_name'` is a setting key defined in main.cf
- `{ should cmp 'value' }` is the value to be expected

When using `postfix_conf` with a custom configuration directory, the following syntax can be used:

    describe postfix_conf('path') do
      ...
    end

where

- `'path'` is the path to your Postfix configuration (ex. '/etc/my/postfix/path/main.cf')

## Properties

This resource supports any of the settings listed in the main.cf file as properties.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test basic Postfix configuration settings in the main.cf file

For example, the following Postfix configuration:

    /etc/postfix/main.cf:
    	myorigin = $myhostname
    	myhostname = host.local.domain
    	mynetworks = 127.0.0.0/8

can be tested like this:

    describe postfix_conf do
      its('myorigin') { should cmp '$myhostname' }
      its('myhostname') { should cmp 'host.local.domain' }
      its('mynetworks') { should cmp '127.0.0.0/8' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
