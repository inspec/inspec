---
title: About the google_cloudbuild_triggers resource
platform: gcp
---

## Syntax
A `google_cloudbuild_triggers` is used to test a Google Trigger resource

## Examples
```
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

See [google_cloudbuild_trigger.md](google_cloudbuild_trigger.md) for more detailed information
  * `ids`: an array of `google_cloudbuild_trigger` id
  * `descriptions`: an array of `google_cloudbuild_trigger` description
  * `disableds`: an array of `google_cloudbuild_trigger` disabled
  * `create_times`: an array of `google_cloudbuild_trigger` create_time
  * `substitutions`: an array of `google_cloudbuild_trigger` substitutions
  * `filenames`: an array of `google_cloudbuild_trigger` filename
  * `ignored_files`: an array of `google_cloudbuild_trigger` ignored_files
  * `included_files`: an array of `google_cloudbuild_trigger` included_files
  * `trigger_templates`: an array of `google_cloudbuild_trigger` trigger_template
  * `builds`: an array of `google_cloudbuild_trigger` build

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
