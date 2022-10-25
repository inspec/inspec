+++
title = "ini resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "ini"
    identifier = "inspec/resources/os/ini.md ini resource"
    parent = "inspec/resources/os"
+++

Use the `ini` Chef InSpec audit resource to test settings in an INI file.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `ini` resource block declares the configuration settings to be tested:

    describe ini('path') do
      its('setting_name') { should eq 'value' }
    end

where

- `'setting_name'` is a setting key defined in the INI file
- `('path')` is the path to the INI file
- `{ should eq 'value' }` is the value that is expected

For example:

    describe ini('path/to/ini_file.ini') do
      its('port') { should eq '143' }
      its('server') { should eq '192.0.2.62' }
    end

Settings inside of sections, such as the following:

    [section_name]
    setting_name = 123

... can be retrieved by prefixing the setting_name with the section.

    its('section_name.setting_name') { should cmp 123 }

In the event a section or setting name has a period in it, the alternate syntax can be used:

    its(['section.with.a.dot.in.it', 'setting.name.with.dots']) { should cmp 'lots-of-dots' }

## Properties

This resource supports any of the settings listed in an INI file as properties.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test SMTP settings in a PHP INI file

For example, a PHP INI file located at contains the following settings:

    [mail function]
    SMTP = smtp.gmail.com
    smtp_port = 465

and can be tested like this:

    describe ini('/etc/php5/apache2/php.ini') do
      its('mail function.smtp_port') { should eq('465') }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
