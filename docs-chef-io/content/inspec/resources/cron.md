+++
title = "cron resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "cron"
    identifier = "inspec/resources/os/cron.md cron resource"
    parent = "inspec/resources/os"
+++

Use the `cron` Chef InSpec audit resource to test the Crontab entries of a particular user on the system. You can also use this resource as an alias to the `crontab` resource.

## Availability

### Installation

This resource is distributed with Chef InSpec.

## Parameters

### `user`

_(optional)_ This parameter tests the cron entries of a particular user. By default, it refers to the current user.

## Properties

### Table

The `table` property checks whether a particular cron entry matches the specific regex.

    its(:table) { should match /regex/ }

## Syntax

A `cron` resource block declares a user (which defaults to the current user).

    describe cron do
      its(:table) { should match /regex/ }
    end

    describe cron(user: "USER") do
     it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

## Examples

The following examples show how to use this audit resource.

### Test to ensure crontab has a particular cron entry for the current user

    describe cron do
      it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

### Test to ensure a user's crontab has a particular cron entry

    describe cron('MY_USER') do
      it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

### Test to verify if crontab has entries that run every 5 minutes

    describe cron do
      its(:table) { should match /^5/ }
    end

## Matchers

For a full list of the available matchers, please visit our [matchers page](/inspec/matchers/).

    it { should have_entry("5 * * * * /some/scheduled/task.sh") }
