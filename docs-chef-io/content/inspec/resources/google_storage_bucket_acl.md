+++
title = "google_storage_bucket_acl resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_bucket_acl"
    identifier = "inspec/resources/gcp/google_storage_bucket_acl.md google_storage_bucket_acl resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_storage_bucket_acl` is used to test a Google BucketACL resource

## Examples

```ruby
describe google_storage_bucket_acl(bucket: 'storage-bucket-name', entity: user-email) do
  it { should exist }
  its('role') { should cmp "OWNER" }

  its('bucket') { should eq 'storage-bucket-name' }
  its('email') { should include entity-email.com }
end

describe google_storage_bucket_acl(bucket: 'storage-bucket-name', entity: "allUsers") do
  it { should_not exist }
end
```

### Test that a GCP storage bucket ACL exists

     describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      it { should exist }
    end

### Test that a GCP storage bucket ACL has the expected role (READER, WRITER or OWNER)

    describe google_storage_bucket_acl(bucket: 'bucket-buvsjjcndqz',  entity: 'user-object-viewer@spaterson-project.iam.gserviceaccount.com') do
      its('role') { should eq 'OWNER' }
    end

## Properties

Properties that can be accessed from the `google_storage_bucket_acl` resource:

`domain`
: The domain associated with the entity.

`email`
: The email address associated with the entity.

`entity`
: The entity holding the permission, in one of the following forms: user-userId user-email group-groupId group-email domain-domain project-team-projectId allUsers allAuthenticatedUsers Examples: The user liz@example.com would be user-liz@example.com. The group example@googlegroups.com would be group-example@googlegroups.com. To refer to all members of the Google Apps for Business domain example.com, the entity would be domain-example.com.

`entity_id`
: The ID for the entity

`id`
: The ID of the access-control entry.

`project_team`
: The project team associated with the entity

  `project_number`
  : The project team associated with the entity

  `team`
  : The team.

    Possible values:
    - editors
    - owners
    - viewers

`role`
: The access permission for the entity.

  Possible values:

  - OWNER
  - READER
  - WRITER

## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
