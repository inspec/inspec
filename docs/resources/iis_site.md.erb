---
title: About the iis_site Resource
platform: windows
---

# iis_site

Use the `iis_site` Chef InSpec audit resource to test the state of IIS on Windows Server 2012 (and later).

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `iis_site` resource block declares details about the named site:

    describe iis_site('site_name') do
      it { should exist }
      it { should be_running }
      it { should have_app_pool('app_pool_name') }
      it { should have_binding('binding_details') }
      it { should have_path('path_to_site') }
    end

where

* `'site_name'` is the name of the site, such as `'Default Web Site'`
* `('app_pool_name')` is the name of the application pool in which the site's root application is run, such as `'DefaultAppPool'`
* `('binding_details')` is a binding for the site, such as `'net.pipe *'`. A site may have multiple bindings; therefore, use a `have_binding` matcher for each site binding to be tested
* `('path_to_site')` is the path to the site, such as `'C:\\inetpub\\wwwroot'`

For example:

    describe iis_site('Default Web Site') do
      it { should exist }
      it { should be_running }
      it { should have_app_pool('DefaultAppPool') }
      it { should have_binding('https :443:www.contoso.com sslFlags=0') }
      it { should have_binding('net.pipe *') }
      it { should have_path('C:\\inetpub\\wwwroot') }
    end

<br>

## Properties

app\_pool, bindings, path, state

<br>

## Property Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a default IIS site

    describe iis_site('Default Web Site') do
      it { should exist }
      it { should be_running }
      it { should have_app_pool('DefaultAppPool') }
      it { should have_binding('http *:80:') }
      it { should have_path('%SystemDrive%\\inetpub\\wwwroot') }
    end

### Test if IIS service is running

    describe service('W3SVC') do
      it { should be_installed }
      it { should be_running }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### be_running

The `be_running` matcher tests if the site is running:

    it { should be_running }

### exist

The `exist` matcher tests if the site exists:

    it { should exist }

### have\_app\_pool

The `have_app_pool` matcher tests if the named application pool exists for the site:

    it { should have_app_pool('DefaultAppPool') }

For example, testing if a site's application pool inherits the settings of the parent application pool:

    it { should have_app_pool('/') }

### have_binding

The `have_binding` matcher tests if the specified binding exists for the site:

    it { should have_binding('http :80:*') }

or:

    it { should have_binding('net.pipe *') }

A site may have multiple bindings; use a `have_binding` matcher for each unique site binding to be tested.

##### Binding Attributes

The `have_binding` matcher can also test attributes that are defined for a site binding. For example, the `sslFlags` attribute defines if SSL is enabled, and (when enabled) what level of SSL is applied to the site.

Testing a site with SSL disabled:

    it { should have_binding('https :443:www.contoso.com sslFlags=0') }

Testing a site with SSL enabled:

    it { should have_binding('https :443:www.contoso.com sslFlags=Ssl') }

Testing a site with certificate mapping authentication enabled:

    it { should have_binding('https :443:www.contoso.com sslFlags=SslMapCert') }

Testing a site with 128-bit SSL enabled:

    it { should have_binding('https :443:www.contoso.com sslFlags=Ssl128') }

### have_path

The `have_path` matcher tests if the named path is defined for the site:

    it { should have_path('C:\\inetpub\\wwwroot') }
