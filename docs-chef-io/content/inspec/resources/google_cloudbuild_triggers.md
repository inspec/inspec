+++
title = "google_cloudbuild_triggers resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_cloudbuild_triggers"
    identifier = "inspec/resources/gcp/google_cloudbuild_triggers.md google_cloudbuild_triggers resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_cloudbuild_triggers` is used to test a Google Trigger resource

## Examples

```ruby
describe google_cloudbuild_triggers(project: 'chef-gcp-inspec') do
  its('count') { should eq 1 }
end

google_cloudbuild_triggers(project: 'chef-gcp-inspec').ids.each do |id|
  describe google_cloudbuild_trigger(project: 'chef-gcp-inspec', id: id) do
    its('filename') { should eq 'cloudbuild.yaml' }
    its('trigger_template.branch_name') { should eq 'trigger-branch' }
    its('trigger_template.repo_name') { should eq 'trigger-repo' }
    its('trigger_template.project_id') { should eq 'trigger-project' }
  end
end
```

## Properties

Properties that can be accessed from the `google_cloudbuild_triggers` resource:

See the [google_cloudbuild_trigger](/inspec/resources/google_cloudbuild_trigger/#properties) resource for more information.

`ids`
: an array of `google_cloudbuild_trigger` id

`names`
: an array of `google_cloudbuild_trigger` name

`descriptions`
: an array of `google_cloudbuild_trigger` description

`disableds`
: an array of `google_cloudbuild_trigger` disabled

`create_times`
: an array of `google_cloudbuild_trigger` create_time

`substitutions`
: an array of `google_cloudbuild_trigger` substitutions

`filenames`
: an array of `google_cloudbuild_trigger` filename

`ignored_files`
: an array of `google_cloudbuild_trigger` ignored_files

`included_files`
: an array of `google_cloudbuild_trigger` included_files

`trigger_templates`
: an array of `google_cloudbuild_trigger` trigger_template

`githubs`
: (Beta only) an array of `google_cloudbuild_trigger` github

`builds`
: an array of `google_cloudbuild_trigger` build

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Cloud Build API](https://console.cloud.google.com/apis/library/cloudbuild.googleapis.com/) is enabled for the current project.
