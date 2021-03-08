+++
title = "google_resourcemanager_folder resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_resourcemanager_folder"
    identifier = "inspec/resources/gcp/google_resourcemanager_folder.md google_resourcemanager_folder resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_resourcemanager_folder` is used to test a Google Folder resource

## Examples

```ruby
describe.one do
  google_resourcemanager_folders(parent: 'organizations/12345').names.each do |name|
    describe google_resourcemanager_folder(name: name) do
      it { should exist }
      its('display_name') { should eq 'inspec-gcp-folder' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_resourcemanager_folder` resource:

`name`
: The resource name of the Folder. Its format is folders/{folder_id}, for example: "folders/1234".

`lifecycle_state`
: The lifecycle state of the folder. Updates to the lifecycleState must be performed via folders.delete and folders.undelete.

  Possible values:

  - LIFECYCLE_STATE_UNSPECIFIED
  - ACTIVE
  - DELETE_REQUESTED

`create_time`
: Time of creation

`parent`
: The Folder’s parent's resource name. Updates to the folder's parent must be performed via folders.move.

`display_name`
: The folder’s display name. A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters. This is captured by the regular expression: `[\p{L}\p{N}]([\p{L}\p{N}_- ]{0,28}[\p{L}\p{N}])?`.

## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
