---
title: About the google_project_alert_policy Resource
platform: gcp
---

# google\_project\_alert\_policy

Use the `google_project_alert_policy` InSpec audit resource to test properties of a single GCP project alert policy.

<br>

## Syntax

A `google_project_alert_policy` resource block declares the tests for a single GCP project alert policy by name.

    describe google_project_alert_policy(policy: 'projects/spaterson-project/alertPolicies/9271751234503117449') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP alert policy is enabled 

    describe google_project_alert_policy(policy: 'projects/spaterson-project/alertPolicies/9271751234503117449') do
      it { should be_enabled }
    end

### Test that a GCP compute alert policy display name is correct

    describe google_project_alert_policy(policy: 'projects/spaterson-project/alertPolicies/9271751234503117449') do
      its('display_name') { should eq 'policy name' }
    end

<br>

## Properties

*  `combiner`, `conditions`, `creation_record`, `display_name`, `enabled`, `mutation_record`, `name`

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.
