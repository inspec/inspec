+++
title = "timezone resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "timezone"
    identifier = "inspec/resources/os/timezone.md timezone resource"
    parent = "inspec/resources/os"
+++

Use the `timezone` Chef InSpec audit resource to test timezone configurations of the system.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `timezone` resource fetches the timezone configurations of the system and compares the output with the test:

    describe timezone do
      its('property') { should eq 'expected value' }
    end

where

- `'property'` is one of `identifier` , `abbreviation` and `time_offset`
- `'expected value'` tests the output of the command run on the system versus the expected output stated in the test

For example:

    describe timezone do
      its('identifier') { should eq 'Asia/Kolkata' }
      its('abbreviation') { should eq 'IST' }
      its('time_offset') { should eq '+0530' }
    end

## Properties

### identifier

The `identifier` property returns the location identifier of the timezone.

An example of checking the **identifier** for India Time :

    its('identifier') { should eq 'Asia/Kolkata }

### abbreviation

The `abbreviation` property returns the abbreviated representation of the timezone.

An example of checking the **abbreviation** of India Time :

    its('abbreviation') { should eq 'IST' }

### time_offset

The `time_offset` property returns the identifier of a time offset from UTC (Coordinated Universal Time).

An example of checking the **time_offset** of India Time:

    its('time_offset') { should eq '+0530' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).