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

## Properties

### gid

The `gid` property tests the group identifier:

    its('gid') { should eq 1234 }

where `1234` represents the user identifier.
The `gid` option is only available on Linux and will return `nil` for Windows os.

### group

The `group` property tests the group to which the user belongs:

    its('group') { should eq 'root' }

where `root` represents the group.
The `group` option is only available on Linux and will return `nil` for Windows os.

### groups

The `groups` property tests two (or more) groups to which the user belongs:

    its('groups') { should eq ['root', 'other'] }

### home

The `home` property tests the home directory path for the user:

    its('home') { should eq '/root' }

### maxdays

The `maxdays` property tests the maximum number of days between password changes:

    its('maxdays') { should eq 99 }

where `99` represents the maximum number of days.

### maximum_days_between_password_change
The `maximum_days_between_password_change` property is equivalent to `maxdays`.

    its('maximum_days_between_password_change') { should eq 99 }

where `99` represents the maximum number of days.

### mindays

The `mindays` property tests the minimum number of days between password changes:

    its('mindays') { should eq 0 }

where `0` represents the maximum number of days.

### minimum_days_between_password_change
The `minimum_days_between_password_change` property is equivalent to `mindays`.

    its('minimum_days_between_password_change') { should eq 0 }

where `0` represents the maximum number of days.


### shell

The `shell` property tests the path to the default shell for the user:

    its('shell') { should eq '/bin/bash' }

### uid

The `uid` property tests the user identifier:

    its('uid') { should eq 1234 }

where `1234` represents the user identifier.

### warndays

The `warndays` property tests the number of days a user is warned before a password must be changed:

    its('warndays') { should eq 5 }

where `5` represents the number of days a user is warned.

### passwordage

The `passwordage` property tests the number of days a user changed its password:

    its('passwordage') { should_be <= 365 }

where `365` represents the number of days since the last password change.

### maxbadpasswords

The `maxbadpasswords` property tests the count of max badpassword settings for a specific user.

    its('maxbadpasswords') { should eq 7 }

where `7` is the count of maximum bad password attempts.

### badpasswordattempts

The `badpasswordattempts` property tests the count of bad password attempts for a user.

    its('badpasswordattempts') { should eq 0 }

where `0` is the count of bad passwords for a user.
On Linux based operating systems it relies on `lastb` and for Windows it uses information stored for the user object.
These settings will be reset to `0` depending on your operating system configuration.

### lastlogin

The `lastlogin` property tests the last login date for a specific user.

    its('lastlogin') { should eq nil }

The `nil` value means this user has never logged in.

### encrypted_password
The `encrypted_password` property allows tests against the hashed password stored in shadow file on unix systems with `getent` utility.

    its('encrypted_password') { should eq "!" }

The `!` value means the user will not be able to login to the system using password authentication.

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

### have_home_directory
The `have_home_directory` matcher tests if the given path is the home directory path. This is similar to `home` property.

    it { should have_home_directory '/home/ubuntu' }

### have_login_shell
The `have_login_shell` matcher tests if the given path to shell is the default shell for the user. This is similar to `shell` property.

    it { should have_login_shell '/bin/bash' }

### have_uid
The `have_uid` matcher tests if the given user identifier is true. This is similar to `uid` property.

    it { should have_uid 1234 }

where `1234` represents the user identifier.

### belong_to_primary_group
The `belong_to_primary_group` matcher tests if the given group is the primary group for the user. This is similar to `group` property.

    it { should belong_to_primary_group 'ubuntu' }

### belong_to_group
The `belong_to_group` matcher tests if the given group is a valid group for the user. This can be either primary or any other group the user is a part of.

    it { should belong_to_group 'sudo' }

### have_authorized_keys
The `have_authorized_keys` matcher tests if the given key is a valid key as part of the `authorized_keys` file.

    it { should have_authorized_key 'ssh-ed25519 50m3r4nd0m57r1ng mockkey' }
