+++
title = "kernel_parameters resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "kernel_parameters"
    identifier = "inspec/resources/os/kernel_parameters.md kernel_parameters resource"
    parent = "inspec/resources/os"
+++

Use the `kernel_parameters` Chef InSpec audit resource to test multiple kernel parameters on Linux platforms.
These parameters are located under `/proc/cmdline`.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Syntax

A `kernel_parameters` resource block uses `where` to filter entries from the systems kernel parameters. If `where` is omitted, all entries are selected.

    describe kernel_parameters do
      its('parameters') { should include "name.of.parameter" }
      its('values') { should include 1 }
    end

    describe kernel_parameters.where(parameter: "name.of.parameter") do
      its('values') { should eq [1] }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test global forwarding setting using where query on kernel parameters

    describe kernel_parameters.where(parameter: "net.ipv4.conf.all.forwarding") do
      its('values') { should eq [1] }
    end

### Match a parameter using regex

    describe kernel_parameters.where(parameter: /^net./ ) do
      its('parameters') { should include 'net.ipv4.conf.all.forwarding' }
    end

## Properties

### parameters

The `parameters` property matches the kernel parameter:

its('parameters') { should include 'net.ipv4.conf.all.forwarding' }

### values

The `values` property tests the value of kernel parameter:

its('values') { should include [1] }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
