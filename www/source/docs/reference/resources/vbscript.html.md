---
title: About the vbscript Resource
platform: windows
---

# vbscript

Use the `vbscript` Chef InSpec audit resource to test a VBScript on the Windows platform.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `vbscript` resource block tests the output of a VBScript on the Windows platform:

    describe vbscript('script contents') do
      its('stdout') { should eq 'output' }
    end

where

* `'script_name'` is the name of the VBScript to test
* `('output')` is the expected output of the VBScript

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test a VBScript

A VBScript file similar to:

    script = <<-EOH
      WScript.Echo "hello"
    EOH

may be tested for multiple lines:

    describe vbscript(script) do
      its('stdout') { should eq "hello\r\n" }
    end

and tested for whitespace removal from standard output:

    describe vbscript(script) do
      its('strip') { should eq "hello" }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
