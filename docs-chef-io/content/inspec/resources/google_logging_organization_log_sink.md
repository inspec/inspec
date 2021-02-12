+++
title = "google_logging_organization_log_sink resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_logging_organization_log_sink"
    identifier = "inspec/resources/gcp/google_logging_organization_log_sink.md google_logging_organization_log_sink resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_logging_organization_log_sink` is used to test a Google OrganizationLogSink resource

## Examples

```ruby
describe google_logging_organization_log_sink(organization: '190694428152', name: 'inspec-gcp-org-sink') do
  it { should exist }
  its('filter') { should cmp 'resource.type = gce_instance' }
end

describe google_logging_organization_log_sink(organization: '190694428152', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_logging_organization_log_sink` resource:

`organization`
: Id of the organization that this sink belongs to.

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
