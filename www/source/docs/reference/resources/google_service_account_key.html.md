---
title: About the google_service_account_key Resource
platform: gcp
---

# google\_service\_account

Use the `google_service_account_key` InSpec audit resource to test properties of a GCP project IAM service account key.

<br>s

## Syntax

A `google_service_account_key` resource block declares the tests for a single GCP project IAM service account key by fully qualified name.

    describe google_service_account_key(name: "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" ) do
      it { should exist }
      its('name'){ should eq "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project IAM service account key has the expected key algorithm

    describe google_service_account_key(name: "projects/sample-project/serviceAccounts/test-sa@sample-project.iam.gserviceaccount.com/keys/c6bd986da9fac6d71178db41d1741cbe751a5080" ) do
      its('key_algorithm') { should eq "KEY_ALG_RSA_2048" }
    end

<br>

## Properties

*  `key_algorithm`, `name`, `valid_after_time`, `valid_after_time_date`, `valid_before_time`, `valid_before_time_date`

<br>


## GCP Permissions

Ensure the [Identity and Access Management (IAM) API](https://console.cloud.google.com/apis/library/iam.googleapis.com/) is enabled for the project.