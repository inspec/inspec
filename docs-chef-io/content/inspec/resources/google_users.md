+++
title = "google_users resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_users"
    identifier = "inspec/resources/gcp/google_users.md google_users resource"
    parent = "inspec/resources/gcp"
+++

Use the `google_users` InSpec audit resource to test properties of all, or a filtered group of, GCP users.

## Syntax

A `google_users` resource block collects GCP users for the specified customer. As documented [here](https://developers.google.com/admin-sdk/directory/v1/reference/users/list), this defaults to the `my_customer` alias to represent your account's `customerId`.

    describe google_users(customer: 'my_customer') do
      it { should exist }
    end

The `domain` argument can optionally be provided to get fields from only one domain. Either the customer or the domain parameter must be provided.

    describe google_users(domain: 'my_domain.com') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_user`.

    google_users(customer: 'my_customer').user_ids.each do |user_id|
      describe google_user(user_key: user_id) do
        it { should exist }
        it { should_not be_suspended }
      end
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of users available for the project

    describe google_users(customer: 'my_customer') do
      its('count') { should be <= 100}
    end

### Test that an expected user is available for the project

    describe google_users(customer: 'my_customer') do
      its('user_names') { should include "Monsieur Happy" }
    end

### Test that a subset of all users with name matching "Batman" exists

    google_users(customer: 'my_customer').where(user_full_name: /Batman/).user_ids.each do |user_id|
      describe google_user(user_key: user_id) do
        it { should exist }
      end
    end

## Filter Criteria

This resource supports the following filter criteria: `user_id`; `user_full_name` and `user_email`. Any of these may be used with `where`, as a block or as a method.

## Properties

- `user_ids` - an array of google_user identifier integers
- `user_full_names` - an array of google_user full name strings
- `user_emails`- an array of google_user primary email address strings

## GCP Permissions

Ensure the G Suite Admin SDK [Directory API](https://developers.google.com/admin-sdk/directory/) is enabled and you have sufficient privileges to list users.
