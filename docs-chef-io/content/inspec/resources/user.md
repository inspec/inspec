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

Use the `user` Chef InSpec audit resource to test user profiles of a single, known or expected local user, including the groups to which the user belongs, the frequency of password changes, and the directory paths to home and shell.

## Availability

### Installation

This resource is distributed with Chef InSpec.

### Version

This resource is available from InSpec version 1.0.0.

## Syntax

A `user` resource block declares a user name and then one (or more) matchers.

```ruby
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
```

> Where
>
> - `('root')` is the user to be tested.
> - `it { should exist }` tests if the user exists.
> - `gid`, `group`, `groups`, `home`, `maxdays`, `mindays`, `shell`, `uid`, `warndays`´, `passwordage`, `maxbadpasswords`, `badpasswordattempts`, and `lastlogin` are valid matchers for this resource.

## Properties

### gid

The `gid` property tests the group identifier.

```ruby
    its('gid') { should eq 1234 }
```

> Where `1234` represents the user identifier.

The `gid` option is only available on Linux and returns `nil` for Windows OS (Operating System).

### group

The `group` property tests the group to which the user belongs.

```ruby
    its('group') { should eq 'root' }
```

> where `root` represents the group.

The `group` option is only available on Linux and returns `nil` for Windows OS.

### groups

The `groups` property tests two (or more) groups to which the user belongs.

```ruby
    its('groups') { should eq ['root', 'other'] }
```

### home

The `home` property tests the home directory path for the user.

```ruby
    its('home') { should eq '/root' }
```

### maxdays

The `maxdays` property tests the maximum number of days between password changes.

```ruby
    its('maxdays') { should eq 99 }
```

> where `99` represents the maximum number of days.

### maximum_days_between_password_change

The `maximum_days_between_password_change` property is equivalent to `maxdays`. This property tests the maximum number of days between password changes.

```ruby
    its('maximum_days_between_password_change') { should eq 99 }
```

> where `99` represents the maximum number of days.

### mindays

The `mindays` property tests the minimum number of days between password changes.

```ruby
    its('mindays') { should eq 0 }
```

> where `0` represents the minimum number of days.

### minimum_days_between_password_change

The `minimum_days_between_password_change` property is equivalent to `mindays`.

```ruby
    its('minimum_days_between_password_change') { should eq 0 }
```

> where `0` represents the minimum number of days.

### shell

The `shell` property tests the path to the default shell for the user.

```ruby
    its('shell') { should eq '/bin/bash' }
```

### uid

The `uid` property tests the user identifier.

```ruby
    its('uid') { should eq 1234 }
```

> where `1234` represents the user identifier.

### warndays

The `warndays` property tests the number of days a user is warned before a password should be changed.

```ruby
    its('warndays') { should eq 5 }
```

> where `5` represents the number of days a user is warned.

### passwordage

The `passwordage` property tests the number of days a user changed the password.

```ruby
    its('passwordage') { should_be <= 365 }
```

> where `365` represents the number of days since the last password change.

### maxbadpasswords

The `maxbadpasswords` property tests the count of maximum number of incorrect password settings for a specific user.

```ruby
    its('maxbadpasswords') { should eq 7 }
```

> where `7` is the count of maximum incorrect password settings.

### badpasswordattempts

The `badpasswordattempts` property tests the count of incorrect password attempts for a user.

```ruby
    its('badpasswordattempts') { should eq 0 }
```

> where `0` is the count of incorrect passwords for a user.

These settings reset to `0` depending on your operating system configuration. For Linux-based operating systems, it relies on `lastb`, and for Windows OS, it uses information stored for the user object.

### lastlogin

The `lastlogin` property tests the last login date for a specific user.

```ruby
    its('lastlogin') { should eq nil }
```

The `nil` value means this user has never logged in.

### encrypted_password

The `encrypted_password` property allows tests against the hashed password stored in shadow files on Unix systems with `getent` utility.

```ruby
    its('encrypted_password') { should eq "!" }
```

> The `!` value means the user cannot log in to the system using password authentication.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Verify available users for the MySQL server

```ruby
    describe user('ROOT') do
      it { should exist }
      its('uid') { should eq 0 }
      its('groups') { should eq ['ROOT'] }
    end

    describe user('MYSQL') do
     it { should_not exist }
    end
```

### Test users on multiple platforms

The `nginx` user is typical `www-data`, but it's `nginx` on CentOS. The following example shows how to test for the `nginx` user with a single test but accounting for all platforms.

```ruby
    web_user = 'www-data'
    web_user = 'nginx' if os[:family] == 'centos'

    describe user(web_user) do
      it { should exist }
    end
```

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The `exist` matcher tests if the named user exists:

```ruby
    it { should exist }
```

### have_home_directory

The `have_home_directory` matcher tests if the given path is the home directory path. This matcher is similar to `home` property.

```ruby
    it { should have_home_directory '/home/ubuntu' }
```

### have_login_shell

The `have_login_shell` matcher tests if the given path to shell is the default shell for the user. This matcher is similar to `shell` property.

```ruby
    it { should have_login_shell '/bin/bash' }
```

### have_uid

The `have_uid` matcher tests if the given user identifier is *true*. This matcher is similar to `uid` property.

```ruby
    it { should have_uid 1234 }
```

> where `1234` represents the user identifier.

### belong_to_primary_group

The `belong_to_primary_group` matcher tests if the given group is the primary group for the user. This matcher is similar to `group` property.

```ruby
    it { should belong_to_primary_group 'ubuntu' }
```

### belong_to_group

The `belong_to_group` matcher tests if the given group is a valid group for the user. This group can be either primary or any other group.

```ruby
    it { should belong_to_group 'sudo' }
```

### have_authorized_keys

The `have_authorized_keys` matcher tests if the given key is valid as part of the `authorized_keys` file.

```ruby
    it { should have_authorized_key 'ssh-ed25519 50m3r4nd0m57r1ng mockkey' }
```
