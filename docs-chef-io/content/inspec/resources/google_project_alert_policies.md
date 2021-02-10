+++
title = "google_project_alert_policies resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_alert_policies"
    identifier = "inspec/resources/gcp/google_project_alert_policies.md google_project_alert_policies resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project_alert_policies` is used to test a Google AlertPolicy resource

## Examples

```ruby
describe google_project_alert_policies(project: 'chef-gcp-inspec') do
  it { should exist }
  its('policy_display_names') { should include 'Display'}
  its('combiners') { should include 'OR'}
end
```

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

## Properties

Properties that can be accessed from the `google_project_alert_policies` resource:

See the [google_project_alert_policy](/inspec/resources/google_project_alert_policy/#properties) resource for more information.

`policy_names`
: an array of `google_project_alert_policy` name

`policy_display_names`
: an array of `google_project_alert_policy` display_name

`combiners`
: an array of `google_project_alert_policy` combiner

`creation_records`
: an array of `google_project_alert_policy` creation_record

`policy_enabled_states`
: an array of `google_project_alert_policy` enabled

`conditions`
: an array of `google_project_alert_policy` conditions

`notification_channels`
: an array of `google_project_alert_policy` notification_channels

`user_labels`
: an array of `google_project_alert_policy` user_labels

`documentations`
: an array of `google_project_alert_policy` documentation

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Monitoring API](https://console.cloud.google.com/apis/library/monitoring.googleapis.com/) is enabled for the current project.
