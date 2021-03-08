+++
title = "user resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "user"
    identifier = "inspec/resources/os/user.md user resource"
    parent = "inspec/resources/os"
+++

Use the `user` Chef InSpec audit resource to test user profiles for a single, known/expected local user, including the groups to which that user belongs, the frequency of required password changes, and the directory paths to home and shell.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.0.0 of InSpec.

## Syntax

A `user` resource block declares a user name, and then one (or more) matchers:

    describe user('root') do
      it { should exist }
      its('uid') { should eq 1234 }
      its('gid') { should eq 1234 }
      its('group') { should eq 'root' }
      its('groups') { should eq ['root', 'other']}
      its('home') { should eq '/root' }
      its('shell') { should eq '/bin/bash' }
      its('mindays') { should eq 0 }
      its('maxdays') { should eq 90 }
      its('warndays') { should eq 8 }
      its('passwordage') { should eq 355 }
      its('maxbadpasswords') { should eq nil } // Only valid on Windows OS
      its('badpasswordattempts') { should eq 0 }
      its('lastlogin') { should eq nil } // Only valid on Windows OS
    end

where

- `('root')` is the user to be tested
- `it { should exist }` tests if the user exists
- `gid`, `group`, `groups`, `home`, `maxdays`, `mindays`, `shell`, `uid`, `warndays`´, `passwordage`, `maxbadpasswords`, `badpasswordattempts` and `lastlogin` are valid matchers for this resource

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Verify available users for the MySQL server

    describe user('root') do
      it { should exist }
      its('uid') { should eq 0 }
      its('groups') { should eq ['root'] }
    end

    describe user('mysql') do
     it { should_not exist }
    end

### Test users on multiple platforms

The `nginx` user is typically `www-data`, but on CentOS it's `nginx`. The following example shows how to test for the `nginx` user with a single test, but accounting for all platforms:

    web_user = 'www-data'
    web_user = 'nginx' if os[:family] == 'centos'

    describe user(web_user) do
      it { should exist }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the named user exists:

    it { should exist }

### gid

The `gid` matcher tests the group identifier:

    its('gid') { should eq 1234 }

where `1234` represents the user identifier.
The `gid` option is only available on Linux and will return `nil` for Windows os.

### group

The `group` matcher tests the group to which the user belongs:

    its('group') { should eq 'root' }

where `root` represents the group.
The `group` option is only available on Linux and will return `nil` for Windows os.

### groups

The `groups` matcher tests two (or more) groups to which the user belongs:

    its('groups') { should eq ['root', 'other'] }

### home

The `home` matcher tests the home directory path for the user:

    its('home') { should eq '/root' }

### maxdays

The `maxdays` matcher tests the maximum number of days between password changes:

    its('maxdays') { should eq 99 }

where `99` represents the maximum number of days.

### mindays

The `mindays` matcher tests the minimum number of days between password changes:

    its('mindays') { should eq 0 }

where `0` represents the maximum number of days.

### shell

The `shell` matcher tests the path to the default shell for the user:

    its('shell') { should eq '/bin/bash' }

### uid

The `uid` matcher tests the user identifier:

    its('uid') { should eq 1234 }

where `1234` represents the user identifier.

### warndays

The `warndays` matcher tests the number of days a user is warned before a password must be changed:

    its('warndays') { should eq 5 }

where `5` represents the number of days a user is warned.

### passwordage

The `passwordage` matcher tests the number of days a user changed its password:

    its('passwordage') { should_be <= 365 }

where `365` represents the number of days since the last password change.

### maxbadpasswords

The `maxbadpasswords` matcher tests the count of max badpassword settings for a specific user.

    its('maxbadpasswords') { should eq 7 }

where `7` is the count of maximum bad password attempts.

### badpasswordattempts

The `badpasswordattempts` matcher tests the count of bad password attempts for a user.

    its('badpasswordattempts') { should eq 0 }

where `0` is the count of bad passwords for a user.
On Linux based operating systems it relies on `lastb` and for Windows it uses information stored for the user object.
These settings will be resetted to `0` depending on your operating system configuration.

### lastlogin

The `lastlogin` matcher tests the last login date for a specific user.

    its('lastlogin') { should eq nil }

The `nil` value means this user has never logged in.
