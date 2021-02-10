+++
title = "google_project_alert_policy_condition resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_alert_policy_condition"
    identifier = "inspec/resources/gcp/google_project_alert_policy_condition.md google_project_alert_policy_condition resource"
    parent = "inspec/resources/gcp"
+++

Use the `google_project_alert_policy_condition` InSpec audit resource to test properties of a single GCP project alert policy condition.

## Syntax

A `google_project_alert_policy_condition` resource block declares the tests for a single GCP project alert policy condition by name and filter.

    describe google_project_alert_policy_condition(name: 'projects/spaterson-project/alertPolicies/9271751234503117449', filter 'project=\"spaterson-project\"') do
      it { should exist }
    end

## Examples

The following examples show how to use this InSpec audit resource.

### Test that a GCP project alert policy condition has a particular threshold value

    describe google_project_alert_policy_condition(name: 'projects/spaterson-project/alertPolicies/9271751234503117449', filter 'project=\"spaterson-project\"') do
      its('condition_threshold_value'){ should eq 0.001 }
    end

### Test that a GCP project alert policy condition has a particular aggregation alignment period

    describe google_project_alert_policy_condition(name: 'projects/spaterson-project/alertPolicies/9271751234503117449', filter 'project=\"spaterson-project\"') do
      its('aggregation_alignment_period'){ should eq '60s' }
    end

## Properties

- `condition_threshold_value`, `aggregation_alignment_period`, `aggregation_per_series_aligner`, `aggregation_cross_series_reducer`

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.
