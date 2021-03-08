+++
title = "google_organization resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_organization"
    identifier = "inspec/resources/gcp/google_organization.md google_organization resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_organization` is used to test a Google Organization resource

## Examples

```ruby

describe google_organization(name: "organizations/123456") do
  its('name') { should eq "organizations/123456" }
  its('lifecycle_state') { should cmp 'ACTIVE' }
end
```

### Test that a GCP organization has the expected name

    describe google_organization(name: 'organizations/1234') do
      its('name') { should eq 'organizations/1234' }
    end

### Test that a GCP organization has the expected lifecycle state e.g. "ACTIVE"

    describe google_organization(display_name: 'google.com') do
      its('lifecycle_state') { should eq "ACTIVE" }
    end

## Properties

Properties that can be accessed from the `google_organization` resource:

`name`
: The resource name of the organization. This is the organization's relative path in the API. Its format is "organizations/[organizationId]". For example, "organizations/1234".

`display_name`
: A human-readable string that refers to the Organization in the GCP Console UI. This string is set by the server and cannot be changed. The string will be set to the primary domain (for example, "google.com") of the G Suite customer that owns the organization.

`lifecycle_state`
: The lifecycle state of the folder. Updates to the lifecycleState must be performed via folders.delete and folders.undelete.

  Possible values:

  - LIFECYCLE_STATE_UNSPECIFIED
  - ACTIVE
  - DELETE_REQUESTED

`creation_time`
: Timestamp when the Organization was created. Assigned by the server.

`owner`
: The entity that owns the Organization

  `directory_customer_id`
  : The G Suite customer id used in the Directory API

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
