+++
title = "crontab resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "crontab"
    identifier = "inspec/resources/os/crontab.md crontab resource"
    parent = "inspec/resources/os"
+++

Use the `crontab` Chef InSpec audit resource to test the crontab entries for a particular user on the system. It recognizes special time strings (@yearly, @weekly, etc).

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.15.0 of InSpec.

## Syntax

A `crontab` resource block declares a user (which defaults to the current user) and the details to be tested, such as the schedule elements for each crontab entry or the exact commands themselves:

    describe crontab do
      its('commands') { should include '/some/scheduled/task.sh' }
    end

{{< note >}}

The `include` matcher in this context specifies the entire list of commands that the crontab should include and not a particular substring that should be included by a command. The `include` matcher always matches a complete command invocation, including options and arguments.

{{< /note >}}

The path to the system crontab can also be supplied via:

    describe crontab(path: '/etc/cron.d/some_crontab') do
      its('commands') { should include '/path/to/some/script' }
    end

Note that only the path or the user (and not both) should be supplied as arguments to the resource.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test that root's crontab has a particular command

    describe crontab('root') do
      its('commands') { should include '/path/to/some/script -option arg' }
    end

### Test that username's crontab entry for command '/home/username/build.sh' runs every minute

    describe crontab('username').commands('/home/username/build.sh') do
      its('hours') { should cmp '*' }
      its('minutes') { should cmp '*' }
    end

### Test that the logged-in user's crontab has no tasks set to run on every hour and every minute

```ruby
describe crontab.where({'hour' => '*', 'minute' => '*'}) do
  its('entries.length') { should cmp '0' }
end
```

### Test that the logged-in user's crontab contains a single command that matches a pattern

```ruby
describe crontab.where { command =~ /a partial command string/ } do
  its('entries.length') { should cmp 1 }
end
```

### Test a special time string (i.e., @yearly /root/annual_report.sh)

    describe crontab.commands('/root/annual_report.sh') do
      its('hours') { should cmp '0' }
      its('minutes') { should cmp '0' }
      its('days') { should cmp '1' }
      its('months') { should cmp '1' }
    end

### Test @reboot case

    describe crontab.commands('/root/reboot.sh') do
      its('hours') { should cmp '-1' }
      its('minutes') { should cmp '-1' }
    end

## Property Examples

### Test a special time string

    describe crontab do
      its('minutes') { should cmp '0' }
      its('hours') { should cmp '0' }
      its('days') { should cmp '1' }
      its('weekdays') { should cmp '1' }
      its('user') { should include 'username'}
      its('commands') { should include '/some/scheduled/task.sh' }
    end

Chef InSpec will automatically interpret crontab-supported special time strings. For example, a crontab entry set to run `@yearly` can be tested as if the entry was manually configured to run on January 1, 12 AM.

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
