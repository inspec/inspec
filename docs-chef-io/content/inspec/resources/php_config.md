+++
title = "php_config resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "php_config"
    identifier = "inspec/resources/os/php_config.md php_config resource"
    parent = "inspec/resources/os"
+++

Use the `php_config` Chef InSpec audit resource to test the PHP configuration parameters from the default `php.ini` file or a custom *php* file.

## Availability

### Installation

The Chef InSpec distributes This resource.

## Syntax

A `php_config` Chef InSpec audit resource allows to test PHP configuration parameters from the default `php.ini` or a custom *php* file. The custom configuration file path is provided in a hash format with `ini` as the key and path as the value.

```ruby
    describe php_config("config_param") do
      its("value") { should eq "VALUE" }
    end

    describe php_config("config_param", { "ini" => "path_to_ini_file" }) do
      its("value") { should eq "VALUE"  }
    end
```

> where
>
> - `config_param` is a valid parameter of php configuration.
> - `value` is a property of this resource.
> - `some_value` is the value of the specified `config_param`.
> - `path_to_ini_file` is the path for custom php configuration file.

## Properties

The property of this resource is `value`.

### value

The value property fetches the provided configuration parameter value from the default `php.ini` file or a custom `php` file.

```ruby
    its("value") { should eq "VALUE"  }
```

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Fetch the configuration parameter value from the default configuration file

```ruby
    describe php_config("default_mimetype") do
      its("value") { should eq "text/html" }
    end
```

### Fetch the configuration parameter value from a custom configuration file

```ruby
    describe php_config("default_mimetype", { "ini" => "/etc/php/7.4/cli/php.ini" }) do
      its("value") { should eq "text/html" }
    end
```
