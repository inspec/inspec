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

## Syntax

A `timezone` resource block fetches the time zone configuration of a system and compares the output with the test:

    describe timezone do
      its('property') { should eq 'expected value' }
    end

where

- `'property'` is one of `identifier` , `name` and `time_offset`
- `'expected value'` tests the output of the command run on the system versus the expected output stated in the test

For example:

    describe timezone do
      its('identifier') { should eq 'Asia/Kolkata' }
      its('name') { should eq 'IST' }
      its('time_offset') { should eq '+0530' }
    end

## Properties

### identifier

The `identifier` property verifies the time zone name of a system.

An example of checking the **identifier** for the Asia/Kolkata time zone name:

    its('identifier') { should eq 'Asia/Kolkata' }

### name

The `name` property verifies the time zone of a system.

{{< note >}}

The `name` property accepts the time zone abbreviation on Linux systems and the full time zone name on Windows systems.

{{< /note >}}

An example of verifying that the time zone is set to IST on a Linux system:

    its('name') { should eq 'IST' }


{{< note >}}

Several time zones share the same time zone abbreviation. Use one of the other properties to verify a specific time zone with a common abbreviation.

{{< /note >}}

An example of verifying that the time zone is set to India Standard Time on a Windows system:

    its('name') { should eq 'India Standard Time' }

### time_offset

The `time_offset` property verifies the time offset of a system from UTC (Coordinated Universal Time).

An example of verifying that the **time_offset** is UTC+05:30:

    its('time_offset') { should eq '+0530' }

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).