---
title: About the google_project_alert_policies Resource
platform: gcp
---

# google\_compute\_alert\_policies

Use the `google_project_alert_policies` InSpec audit resource to test properties of all, or a filtered group of, GCP project alert policies.

<br>

## Syntax

A `google_project_alert_policies` resource block collects GCP project alert policies by project then tests that group.

    describe google_project_alert_policies(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_project_alert_policy`.

    google_project_alert_policies(project: 'chef-inspec-gcp').policy_names.each do |policy_name|
      describe google_project_alert_policy(policy: policy_name) do
        it { should exist }
        it { should be_enabled }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of project alert policies available for the project

    describe google_project_alert_policies(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected policy name is available for the project

    describe google_project_alert_policies(project: 'chef-inspec-gcp') do
      its('policy_names') { should include 'projects/spaterson-project/alertPolicies/9271751234503117449' }
    end

### Test whether any expected policy display name is available for the project

    describe google_project_alert_policies(project: 'chef-inspec-gcp') do
      its('policy_display_names') { should_not include 'banned policy' }
    end

### Ensure no existing policies are inactive

    describe google_project_alert_policies(project: 'chef-inspec-gcp') do
      its('policy_enabled_states') { should_not include false }
    end
    
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `policy_name`; `policy_display_name`; `policy_filter_list` and `policy_enabled_state`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `policy_names` - an array of google_project_alert_policy name strings
*  `policy_display_names` - an array of google_project_alert_policy display name strings
*  `policy_enabled_states`- an array of google_project_alert_policy enabled status booleans
*  `policy_filter_lists`- an array of google_project_alert_policy_condition filter string arrays

<br>


## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/api/logging.googleapis.com/) is enabled for the project.