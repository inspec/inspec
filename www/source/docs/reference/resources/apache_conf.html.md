---
title: About the apache_conf Resource
platform: linux
---

# apache_conf

Use the `apache_conf` Chef InSpec audit resource to test the configuration settings for Apache. This file is typically located under `/etc/apache2` on the Debian and Ubuntu platforms and under `/etc/httpd` on the Fedora, CentOS, RedHat Enterprise Linux, and ArchLinux platforms. The configuration settings may vary significantly from platform to platform.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `apache_conf` Chef InSpec audit resource block declares configuration settings that should be tested:

    describe apache_conf('path') do
      its('setting_name') { should eq 'value' }
    end

where

* `'setting_name'` is a configuration setting defined in the Apache configuration file
* `('path')` is the non-default path to the Apache configuration file
* `{ should eq 'value' }` is the value that is expected

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test for blocking .htaccess files on CentOS

    describe apache_conf do
      its('AllowOverride') { should cmp 'None' }
    end

### Test ports for SSL

    describe apache_conf do
      its('Listen') { should cmp '443' }
    end

### Test multiple ports are listening

    describe apache_conf do
      its('Listen') { should =~ [ '80', '443' ] }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
This Chef InSpec audit resource matches any service that is listed in the Apache configuration file:

    its('PidFile') { should_not eq '/var/run/httpd.pid' }

or:

    its('Timeout') { should cmp '300' }

For example:

    describe apache_conf do
      its('MaxClients') { should cmp '100' }
      its('Listen') { should cmp '443' }
    end
