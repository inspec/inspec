+++
title = "inetd_conf resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "inetd_conf"
    identifier = "inspec/resources/os/inetd_conf.md inetd_conf resource"
    parent = "inspec/resources/os"
+++

Use the `inetd_conf` Chef InSpec audit resource to test if a service is listed in the `inetd.conf` file on Linux and Unix platforms. inetd---the Internet service daemon---listens on dedicated ports, and then loads the appropriate program based on a request. The `inetd.conf` file is typically located at `/etc/inetd.conf` and contains a list of Internet services associated to the ports on which that service will listen. Only enabled services may handle a request; only services that are required by the system should be enabled.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

An `inetd_conf` resource block declares the list of services that are enabled in the `inetd.conf` file:

    describe inetd_conf('path') do
      its('service_name') { should eq 'value' }
    end

where

- `'service_name'` is a service listed in the `inetd.conf` file
- `('path')` is the non-default path to the `inetd.conf` file
- `should eq 'value'` is the value that is expected

## Properties

This resource supports any of the properties listed as services in the `inetd.conf` file. You may want to ensure that specific services do not listen via `inetd.conf`.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Basic tests for inetd_conf services:

    its('shell') { should eq nil }

or:

    its('netstat') { should eq nil }

or:

    its('systat') { should eq nil }

For example:

    describe inetd_conf do
      its('shell') { should eq nil }
      its('login') { should eq nil }
      its('exec') { should eq nil }
    end

### Verify that FTP is disabled

The contents if the `inetd.conf` file contain the following:

    #ftp      stream   tcp   nowait   root   /usr/sbin/tcpd   in.ftpd -l -a
    #telnet   stream   tcp   nowait   root   /usr/sbin/tcpd   in.telnetd

and the following test is defined:

    describe inetd_conf do
      its('ftp') { should eq nil }
      its('telnet') { should eq nil }
    end

Because both the `ftp` and `telnet` Internet services are commented out (`#`), both services are disabled. Consequently, both tests will return `true`. However, if the `inetd.conf` file is set as follows:

    ftp       stream   tcp   nowait   root   /usr/sbin/tcpd   in.ftpd -l -a
    #telnet   stream   tcp   nowait   root   /usr/sbin/tcpd   in.telnetd

then the same test will return `false` for `ftp` and the entire test will fail.

### Test if telnet is installed

    describe package('telnetd') do
      it { should_not be_installed }
    end

    describe inetd_conf do
      its('telnet') { should eq nil }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
