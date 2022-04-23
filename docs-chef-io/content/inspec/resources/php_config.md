+++
title = "php_config resource"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "php_config"
    identifier = "inspec/resources/os/php_config.md php_config resource"
    parent = "inspec/resources/os"
+++

Use the `php_config` Chef InSpec audit resource to test PHP config parameters from the default php.ini file or a custom php configuration file.


## Availability

### Installation

This resource is distributed along with Chef InSpec itself.

## Syntax

A `php_config` Chef InSpec audit resource allows to test PHP config parameters from the default php.ini file or a custom php configuration file. The path for custom configuration file is given in a hash format with `ini` as the key and path as the value.

```ruby
    describe php_config("config_param") do
      its("value") { should eq "some_value" }
    end

    describe php_config("config_param", { "ini" => "path_to_ini_file" }) do
      its("value") { should eq "some_value"  }
    end
```
> where
> 
> - `config_param` is a valid parameter of php configuration
> - `value` is a property of this resource
> - `some_value` is the value of the given `config_param`
> - `path_to_ini_file` is the path for custom php configuration file

## Properties

- The property of this resource is `value`

### value

The value property fetches the value of the given config parameter from the default php.ini file or a custom php configuration file.

```ruby
    its("value") { should eq "some_value"  }
```

## Examples
The following examples show how to use this Chef InSpec audit resource.

### Fetch the value for a config parameter from the default configuration file

```ruby
    describe php_config("default_mimetype") do
      its("value") { should eq "text/html" }
    end
```

### Fetch the value for a config parameter from a custom configuration file

```ruby
    describe php_config("default_mimetype", { "ini" => "/etc/php/7.4/cli/php.ini" }) do
      its("value") { should eq "text/html" }
    end
```
