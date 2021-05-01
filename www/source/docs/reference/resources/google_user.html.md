---
title: About the google_user Resource
platform: gcp
---

# google\_user

Use the `google_user` InSpec audit resource to test properties of a single GCP user.

<br>

## Syntax

A `google_user` resource block declares the tests for a single GCP user by principal email address or immutable ID.

    describe google_user(user_key: 'principal_email_address@domain.com') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP user with specified ID exists

    describe google_user(user_key: '110491234567894702010') do
      it { should exist }
    end

### Test that a GCP user has expected full name 

    describe google_user(user_key: '110491234567894702010') do
      its('name.full_name') { should eq "Bill S. Preston Esq." }
    end
    
### Test that a GCP user has MFA enabled

    describe google_user(user_key: 'theodore_ted_logan@excellentadventure.com') do
      it { should have_mfa_enabled }
    end
    
### Test that a GCP user is suspended or not

    describe google_user(user_key: 'theodore_ted_logan@excellentadventure.com') do
      it { should_not be_suspended }
    end
        
<br>

## Properties

*  `agreed_to_terms`, `archived`, `change_password_at_next_login`, `creation_time`, `customer_id`, `emails`, `etag`, `id`, `include_in_global_address_list`, `ip_whitelisted`, `is_admin`, `is_delegated_admin`, `is_enforced_in2_sv`, `is_enrolled_in2_sv`, `is_mailbox_setup`, `kind`, `last_login_time`, `name`, `non_editable_aliases`, `org_unit_path`, `primary_email`, `suspended`

<br>


## GCP Permissions

Ensure the G Suite Admin SDK [Directory API](https://developers.google.com/admin-sdk/directory/) is enabled and you have sufficient privileges to list users.