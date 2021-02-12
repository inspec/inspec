+++
title = "google_logging_project_sink resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_logging_project_sink"
    identifier = "inspec/resources/gcp/google_logging_project_sink.md google_logging_project_sink resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_logging_project_sink` is used to test a Google ProjectSink resource

## Examples

```ruby
describe google_logging_project_sink(project: 'chef-gcp-inspec', name: 'inspec-gcp-org-sink') do
  it { should exist }
  its('filter') { should cmp 'resource.type = gce_instance AND severity = DEBUG' }
end

describe google_logging_project_sink(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP project logging sink destination is correct

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('destination') { should eq 'storage.googleapis.com/gcp-inspec-logging-bucket' }
    end

### Test that a GCP project logging sink filter is correct

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('filter') { should eq "resource.type = gce_instance AND resource.labels.instance_id = \"12345678910123123\"" }
    end

### Test a GCP project logging sink output version format

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('output_version_format') { should eq "V2" }
    end

### Test a GCP project logging sink writer identity is as expected

    describe google_logging_project_sink(project: 'chef-inspec-gcp',  sink: 'sink-name-abcd') do
      its('writer_identity') { should eq "serviceAccount:my-logging-service-account.iam.gserviceaccount.com" }
    end

## Properties

Properties that can be accessed from the `google_logging_project_sink` resource:

`project`
: Id of the project that this sink belongs to.

`name`
: Name of the log sink.

`filter`
: An advanced logs filter. The only exported log entries are those that are in the resource owning the sink and that match the filter.

`destination`
: The export destination.

`writer_identity`
: An IAM identity—a service account or group—under which Logging writes the exported log entries to the sink's destination. This field is set by sinks.create and sinks.update based on the value of uniqueWriterIdentity in those methods.

`include_children`
: If the field is false, the default, only the logs owned by the sink's parent resource are available for export. If the field is true, then logs from all the projects, folders, and billing accounts contained in the sink's parent resource are also available for export. Whether a particular log entry from the children is exported depends on the sink's filter expression.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
