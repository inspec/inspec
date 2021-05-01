---
title: About the google_service_account_keys Resource
platform: gcp
---

# google\_service\_account_keys

Use the `google_service_account_keys` InSpec audit resource to test properties of all, or a filtered group of, GCP service account keys.

<br>

## Syntax

A `google_service_account_keys` resource block collects GCP service account keys by project then tests that group.

    describe google_service_account_keys(service_account: 'projects/sample-project/serviceAccounts/sample-account@sample-project.iam.gserviceaccount.com') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_service_account_key`.

    google_service_account_keys(service_account: 'projects/sample-project/serviceAccounts/sample-account@sample-project.iam.gserviceaccount.com').key_names.each do |sa_key_name|
      describe google_service_account_key(name: sa_key_name) do
        it { should exist }
        its('key_algorithm') { should eq "KEY_ALG_RSA_2048" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of keys for the service account

    describe google_service_account_keys(service_account: 'projects/sample-project/serviceAccounts/sample-account@sample-project.iam.gserviceaccount.com') do
      its('count') { should be <= 1000}
    end
    
### Test that a service account with expected name is available

    describe google_service_account_keys(service_account: 'projects/sample-project/serviceAccounts/sample-account@sample-project.iam.gserviceaccount.com') do
      its('key_names'){ should include "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" }
    end

<br>

## Filter Criteria

This resource supports the following filter criteria: `key_name`; `valid_after_time` and `valid_before_time`.  Any of these may be used with `where`, as a block or as a method.

## Properties

*  `key_names` - an array of google_service_account_key name strings
*  `valid_after_times` - an array of google_service_account_key Time objects
*  `valid_before_times` - an array of google_service_account_key Time objects

<br>


## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the project.