+++
title = "google_sourcerepo_repository resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_sourcerepo_repository"
    identifier = "inspec/resources/gcp/google_sourcerepo_repository.md google_sourcerepo_repository resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_sourcerepo_repository` is used to test a Google Repository resource

## Examples

```ruby
describe google_sourcerepo_repository(project: 'chef-gcp-inspec', name: 'inspec-gcp-repository') do
  it { should exist }
end

describe google_sourcerepo_repository(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_sourcerepo_repository` resource:

`name`
: Resource name of the repository, of the form projects/{{project}}/repos/{{repo}}. The repo name may contain slashes. E.g., projects/myproject/repos/name/with/slash

`url`
: URL to clone the repository from Google Cloud Source Repositories.

`size`
: The disk usage of the repo, in bytes.

`pubsub_configs`
: How this repository publishes a change in the repository through Cloud Pub/Sub. Keyed by the topic names.

## GCP Permissions

Ensure the [Cloud Source Repositories API](https://console.cloud.google.com/apis/library/sourcerepo.googleapis.com/) is enabled for the current project.
