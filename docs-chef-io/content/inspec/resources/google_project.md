+++
title = "google_project resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project"
    identifier = "inspec/resources/gcp/google_project.md google_project resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project` is used to test a Google Project resource

## Examples

```ruby
describe google_project(project: 'chef-gcp-inspec') do
  it { should exist }
  its('project_id') { should cmp 'chef-gcp-inspec' }
  its('lifecycle_state') { should cmp 'ACTIVE' }
end
```

### Test that a GCP project has the expected project number

    describe google_project(project: 'chef-inspec-gcp') do
      its('project_number') { should eq 12345678 }
    end

### Test that a GCP project has the expected lifecycle state e.g. "ACTIVE"

    describe google_project(project: 'chef-inspec-gcp') do
      its('lifecycle_state') { should eq "ACTIVE" }
    end

### Validate that a GCP project has some arbitrary label with expected content (for example defined by regexp )

    describe google_project(project: 'chef-inspec-gcp').label_value_by_key('season') do
      it {should match '^(winter|spring|summer|autumn)$' }
    end

## Properties

Properties that can be accessed from the `google_project` resource:

`number`
: Number uniquely identifying the project.

`lifecycle_state`
: The Project lifecycle state.

  Possible values:

  - LIFECYCLE_STATE_UNSPECIFIED
  - ACTIVE
  - DELETE_REQUESTED
  - DELETE_IN_PROGRESS


`name`
: The user-assigned display name of the Project. It must be 4 to 30 characters. Allowed characters are: lowercase and uppercase letters, numbers, hyphen, single-quote, double-quote, space, and exclamation point.

`create_time`
: Time of creation

`labels`
: The labels associated with this Project. Label keys must be between 1 and 63 characters long and must conform to the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`. Label values must be between 0 and 63 characters long and must conform to the regular expression `([a-z]([-a-z0-9]*[a-z0-9])?)?`. No more than 256 labels can be associated with a given resource. Clients should store labels in a representation such as JSON that does not depend on specific characters being disallowed

`parent`
: A parent organization

  `type`
  : Must be organization.

  `id`
  : Id of the organization

`project_id`
: The unique, user-assigned ID of the Project. It must be 6 to 30 lowercase letters, digits, or hyphens. It must start with a letter. Trailing hyphens are prohibited.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
