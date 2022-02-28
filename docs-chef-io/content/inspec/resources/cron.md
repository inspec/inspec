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

Use the `cron` Chef InSpec audit resource to test the crontab entries for a particular user on the system. This resource also can be used as an alias to `crontab` resource.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

## Parameters

### `user` _(optional)_

This parameter can be specified to test cron entries for a particular user. By default, it refers to the current user.

## Properties

### table

The `table` property checks whether specific cron entry matches the given regex.

    its(:table) { should match /regex/ }

## Syntax

A `cron` resource block declares a user (which defaults to the current user)

    describe cron do
      its(:table) { should match /regex/ }
    end

    describe cron(user: "foo") do
     it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test to ensure crontab has a particular cron entry for current user.

    describe cron do
      it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

### Test to ensure myuser's crontab has a particular cron entry.

    describe cron('myuser') do
      it { should have_entry "5 * * * * /some/scheduled/task.sh" }
    end

### Test to verify if crontab has entries which runs every 5 minutes.

    describe cron do
      its(:table) { should match /^5/ }
    end


## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

    it { should have_entry("5 * * * * /some/scheduled/task.sh") }
