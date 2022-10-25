+++
title = "shadow resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "shadow"
    identifier = "inspec/resources/os/shadow.md shadow resource"
    parent = "inspec/resources/os"
+++

Use the `shadow` Chef InSpec audit resource to test the contents of `/etc/shadow`, which contains password details that are readable only by the `root` user. `shadow` is a [plural resource](/inspec/glossary/#plural_resource). Like all plural resources, it functions by performing searches across multiple entries in the shadow file.

The format for `/etc/shadow` includes:

- A username
- The hashed password for that user
- The last date a password was changed, as the number of days since Jan 1, 1970
- The minimum number of days a password must exist before it may be changed
- The maximum number of days after which a password must be changed
- The number of days a user is warned about an expiring password
- The number of days a user must be inactive before the user account is disabled
- The date on which a user account was disabled, as the number of days since Jan 1, 1970

These entries are defined as a colon-delimited row in the file, one row per user:

    username:Gb7crrO5CDF.:10063:0:99999:7:::

The `shadow` resource understands this format, allows you to search on the fields, and exposes the selected users' properties.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.0.0 of InSpec.

## Resource Parameters

The `shadow` resource takes one optional parameter: the path to the shadow file. If omitted, `/etc/shadow` is assumed.

    # Expect a file to exist at the default location and have 32 users
    describe shadow do
      its('count') { should eq 32 }
    end

    # Use a custom location
    describe shadow('/etc/my-custom-place/shadow') do
      its('count') { should eq 32 }
    end

## Examples

A `shadow` resource block uses `where` to filter entries from the shadow file. If `where` is omitted, all entries are selected.

    # Select all users. Among them, there should not be a user with the name 'forbidden_user'.
    describe shadow do
      its('users') { should_not include 'forbidden_user' }
    end

    # Ensure there is only one user named 'root' (Select all with name 'root', then count them).
    describe shadow.where(user: 'root') do
      its('count') { should eq 1 }
    end

Use `where` to match any of the supported [filter criteria](#filter_criteria). `where` has a method form for simple equality and a block form for more complex queries.

    # Method form, simple
    # Select just the root user (direct equality)
    describe shadow.where(user: 'root') do
      its ('count') { should eq 1 }
    end

    # Method form, with a regex
    # Select all users whose names begin with smb
    describe shadow.where(user: /^smb/) do
      its ('count') { should eq 2 }
    end

    # Block form
    # Select users whose passwords have expired
    describe shadow.where { expiry_date > 0 } do
      # This test directly asserts that there should be 0 such users
      its('count') { should eq 0 }
      # But if the count test fails, this test outputs the users that are causing the failure.
      its('users') { should be_empty }
    end

Use `where` with [expect syntax](/inspec/profiles/#should-vs-expect-syntax) to show all users (that aren't disabled or locked) without SHA512 hashed passwords.

    # Users with password fields that are not *, !, or don't begin with $6$
    bad_users = inspec.shadow.where { password !~ /^[*!]$|^\$6\$.*/ }.users

    describe 'Password hashes in /etc/shadow' do
      it 'should only contain SHA512 hashes' do
        message = "Users without SHA512 hashes: #{bad_users.join(', ')}"
        expect(bad_users).to be_empty, message
      end
    end

## Properties

As a [plural resource](/inspec/glossary/#plural_resource), all of `shadow`'s properties return lists (that is, Ruby Arrays). `include` and `be_empty` are two useful matchers when working with lists. You can also perform manipulation of the lists, such as calling `uniq`, `sort`, `count`, `first`, `last`, `min`, and `max`.

### users

A list of strings, representing the usernames matched by the filter.

    describe shadow
      its('users') { should include 'root' }
    end

### passwords

A list of strings, representing the encrypted password strings for entries matched by the `where` filter. Each string may not be an encrypted password, but rather a `*` or similar which indicates that direct logins are not allowed. Different operating systems use different flags here (such as `*LK*` to indicate the account is locked).

    # Use uniq to remove duplicates, then determine
    # if the only password left on the list is '*'
    describe shadow.where(user: /adm$/) do
      its('passwords.uniq.first') { should cmp '*' }
      its('passwords.uniq.count') { should eq 1 }
    end

### last_changes

A list of integers, indicating the number of days since Jan 1, 1970 since the password for each matching entry was changed.

    # Ensure all entries have changed their password in the last 90 days.  (Probably want a filter on that)
    describe shadow do
      its('last_changes.min') { should be < Date.today - 90 - Date.new(1970,1,1)   }
    end

### min_days

A list of integers reflecting the minimum number of days a password must exist, before it may be changed, for the users that matched the filter.

    # min_days seems crazy today; make sure it is zero for everyone
    describe shadow do
      its('min_days.uniq') { should eq [0] }
    end

### max_days

A list of integers reflecting the maximum number of days after which the password must be changed for each user matching the filter.

    # Make sure there is no policy allowing longer than 90 days
    describe shadow do
      its('max_days.max') { should be < 90 }
    end

### warn_days

A list of integers reflecting the number of days a user is warned about an expiring password for each user matching the filter.

    # Ensure everyone gets the same 7-day policy
    describe shadow do
      its('warn_days.uniq.count') { should eq 1 }
      its('warn_days.uniq.first') { should eq 7 }
    end

### inactive_days

A list of integers reflecting the number of days a user must be inactive before the user account is disabled for each user matching the filter.

    # Ensure everyone except admins has an stale policy of no more than 14 days
    describe shadow.where { user !~ /adm$/ } do
      its('inactive_days.max') { should be <= 14 }
    end

### expiry_dates

A list of integers reflecting the number of days since Jan 1, 1970 that a user account has been disabled, for each user matching the filter. Value is `nil` if the account has not expired.

    # No one should have an expired account.
    describe shadow do
      its('expiry_dates.compact') { should be_empty }
    end

### count

The `count` property tests the number of records that the filter matched.

    # Should probably only have one root user
    describe shadow.user('root') do
      its('count') { should eq 1 }
    end

## Filter Criteria

You may use any of these filter criteria with the `where` function. They are named after the columns in the shadow file. Each has a related list [property](#properties).

### user

The string username of a user. Always present. Not required to be unique.

    # Expect all users whose name ends in adm to have a disabled password via the '*' flag
    describe shadow.where(user: /adm$/) do
      its('password.uniq') { should eq ['*'] }
    end

### password

The encrypted password strings, or an account status string. Each string may not be an encrypted password, but rather a `*` or similar which indicates that direct logins are not allowed. Different operating systems use other flags here (such as `*LK*` to indicate the account is locked).

    # Find 'locked' accounts and ensure 'nobody' is on the list
    describe shadow.where(password: '*LK*') do
      its('users') { should include 'nobody' }
    end

### last_change

An integer reflecting the number of days since Jan 1, 1970 since the user's password was changed.

    # Find users who have not changed their password within 90 days
    describe shadow.where { last_change > Date.today - 90 - Date.new(1970,1,1) } do
      its('users') { should be_empty }
    end

### min_days

An integer reflecting the minimum number of days a user is required to wait before
changing their password again.

    # Find users who have a nonzero wait time
    describe shadow.where { min_days > 0 } do
      its('users') { should be_empty }
    end

### max_days

An integer reflecting the maximum number of days a user may go without changing their password.

    # All users should have a 30-day policy
    describe shadow.where { max_days != 30 } do
      its('users') { should be_empty }
    end

### warn_days

An integer reflecting the number of days before a password expiration that a user receives an alert.

    # All users should have a 7-day warning policy
    describe shadow.where { warn_days != 7 } do
      its('users') { should be_empty }
    end

### inactive_days

An integer reflecting the number of days that must pass before a user who has not logged in will be disabled.

    # Ensure everyone has a stale policy of no more than 14 days.
    describe shadow.where { inactive_days.nil? || inactive_days > 14 } do
      its('users') { should be_empty }
    end

### expiry_date

An integer reflecting the number of days since Jan 1, 1970 on which the user was disabled. The `expiry_date` criterion is `nil` for enabled users.

    # Ensure no one is disabled due to a old password
    describe shadow.where { !expiry_date.nil? } do
      its('users') { should be_empty }
    end

    # Ensure no one is disabled for more than 14 days
    describe shadow.where { !expiry_date.nil? && expiry_date - Date.new(1970,1,1) > 14} do
      its('users') { should be_empty }
    end

## Matchers

This resource has no resource-specific matchers.

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).
