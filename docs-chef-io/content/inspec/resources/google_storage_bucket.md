+++
title = "google_storage_bucket resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_storage_bucket"
    identifier = "inspec/resources/gcp/google_storage_bucket.md google_storage_bucket resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_storage_bucket` is used to test a Google Bucket resource

## Examples

```ruby
describe google_storage_bucket(name: bucket-name) do
  it { should exist }
  its('location') { should cmp 'europe-west2'.upcase }

  its('storage_class') { should eq "STANDARD" }
  its('labels') { should include("key" => "value") }
  its('retention_policy.retention_period') { should cmp 1000 }
end

describe google_storage_bucket(name: "nonexistent") do
  it { should_not exist }
end
```

### Test that a GCP storage bucket is in the expected location

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('location') { should eq "EUROPE-WEST2" }
    end

### Test that a GCP storage bucket has the expected project number

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('project_number') {should eq 12345678 }
    end

### Test that a GCP storage bucket has the expected storage class

    describe google_storage_bucket(name: 'chef-inspec-gcp-storage-bucket-abcd') do
      its('storage_class') { should eq 'STANDARD' }
    end

## Properties

Properties that can be accessed from the `google_storage_bucket` resource:

`acl`
: Access controls on the bucket.

  `bucket`
  : The name of the bucket.

  `domain`
  : The domain associated with the entity.

  `email`
  : The email address associated with the entity.

  `entity`
  : The entity holding the permission, in one of the following forms:   user-userId   user-email   group-groupId   group-email   domain-domain   project-team-projectId   allUsers   allAuthenticatedUsers Examples:   The user liz@example.com would be user-liz@example.com.   The group example@googlegroups.com would be   group-example@googlegroups.com.   To refer to all members of the Google Apps for Business domain   example.com, the entity would be domain-example.com.

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

`cors`
: The bucket's Cross-Origin Resource Sharing (CORS) configuration.

    `max_age_seconds`
    : The value, in seconds, to return in the Access-Control-Max-Age header used in preflight responses.

    `method`
    : The list of HTTP methods on which to include CORS response headers, (GET, OPTIONS, POST, etc) Note: "*" is permitted in the list of methods, and means "any method".

    `origin`
    : The list of Origins eligible to receive CORS response headers. Note: "*" is permitted in the list of origins, and means "any Origin".

    `response_header`
    : The list of HTTP headers other than the simple response headers to give permission for the user-agent to share across domains.

`default_event_based_hold`
: Whether or not to automatically apply an eventBasedHold to new objects added to the bucket.

`default_object_acl`
: Default access controls to apply to new objects when no ACL is provided.

  `bucket`
  : The name of the bucket.

  `domain`
  : The domain associated with the entity.

  `email`
  : The email address associated with the entity.

  `entity`
  : The entity holding the permission, in one of the following forms:   * user-{{userId}}   * user-{{email}} (such as "user-liz@example.com")   * group-{{groupId}}   * group-{{email}} (such as "group-example@googlegroups.com")   * domain-{{domain}} (such as "domain-example.com")   * project-team-{{projectId}}   * allUsers   * allAuthenticatedUsers

  `entity_id`
  : The ID for the entity

  `generation`
  : The content generation of the object, if applied to an object.

  `id`
  : The ID of the access-control entry.

  `object`
  : The name of the object, if applied to an object.

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

`id`
: The ID of the bucket. For buckets, the id and name properities are the same.

`lifecycle`
: The bucket's lifecycle configuration. See https://developers.google.com/storage/docs/lifecycle for more information.

  `rule`
  : A lifecycle management rule, which is made of an action to take and the condition(s) under which the action will be taken.

    `action`
    : The action to take.

      `storage_class`
      : Target storage class. Required iff the type of the action is SetStorageClass.

      `type`
      : Type of the action. Currently, only Delete and SetStorageClass are supported.
        
        Possible values:
        - Delete
        - SetStorageClass

    `condition`
    : The condition(s) under which the action will be taken.

      `age_days`
      : Age of an object (in days). This condition is satisfied when an object reaches the specified age.

      `created_before`
      : A date in RFC 3339 format with only the date part (for instance, "2013-01-15"). This condition is satisfied when an object is created before midnight of the specified date in UTC.

      `is_live`
      : Relevant only for versioned objects.  If the value is true, this condition matches live objects; if the value is false, it matches archived objects.

      `matches_storage_class`
      : Objects having any of the storage classes specified by this condition will be matched. Values include MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, and DURABLE_REDUCED_AVAILABILITY.

      `num_newer_versions`
      : Relevant only for versioned objects. If the value is N, this condition is satisfied when there are at least N versions (including the live version) newer than this version of the object.

`location`
: The location of the bucket. Object data for objects in the bucket resides in physical storage within this region. Defaults to US. See the developer's guide for the authoritative list.

`logging`
: The bucket's logging configuration, which defines the destination bucket and optional name prefix for the current bucket's logs.

  `log_bucket`
  : The destination bucket where the current bucket's logs should be placed.

  `log_object_prefix`
  : A prefix for log object names.

`metageneration`
: The metadata generation of this bucket.

`name`
: The name of the bucket

`owner`
: The owner of the bucket. This is always the project team's owner group.

  `entity`
  : The entity, in the form project-owner-projectId.

  `entity_id`
  : The ID for the entity.

`project_number`
: The project number of the project the bucket belongs to.

`storage_class`
: The bucket's default storage class, used whenever no storageClass is specified for a newly-created object. This defines how objects in the bucket are stored and determines the SLA and the cost of storage. Values include MULTI_REGIONAL, REGIONAL, STANDARD, NEARLINE, COLDLINE, and DURABLE_REDUCED_AVAILABILITY. If this value is not specified when the bucket is created, it will default to STANDARD. For more information, see storage classes.

  Possible values:

  - MULTI_REGIONAL
  - REGIONAL
  - STANDARD
  - NEARLINE
  - COLDLINE
  - DURABLE_REDUCED_AVAILABILITY


`time_created`
: The creation time of the bucket in RFC 3339 format.

`updated`
: The modification time of the bucket in RFC 3339 format.

`versioning`
: The bucket's versioning configuration.

  `enabled`
  : While set to true, versioning is fully enabled for this bucket.

`website`
: The bucket's website configuration, controlling how the service behaves when accessing bucket contents as a web site. See the Static Website Examples for more information.

  `main_page_suffix`
  : If the requested object path is missing, the service will ensure the path has a trailing '/', append this suffix, and attempt to retrieve the resulting object. This allows the creation of index.html objects to represent directory pages.

  `not_found_page`
  : If the requested object path is missing, and any mainPageSuffix object is missing, if applicable, the service will return the named object from this bucket as the content for a 404 Not Found result.

`labels`
: Labels applied to this bucket. A list of key->value pairs.

`encryption`
: Encryption configuration for the bucket

  `default_kms_key_name`
  : A Cloud KMS key that will be used to encrypt objects inserted into this bucket, if no encryption method is specified.

`retention_policy`
: Retention policy for the bucket

  `effective_time`
  : The time from which the retention policy was effective

  `is_locked`
  : If the retention policy is locked. If true, the retention policy cannot be removed and the period cannot be reduced.

  `retention_period`
  : The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or made noncurrent.

`project`
: A valid API project identifier.

`predefined_default_object_acl`
: Apply a predefined set of default object access controls to this bucket. Acceptable values are: - "authenticatedRead": Object owner gets OWNER access, and allAuthenticatedUsers get READER access. - "bucketOwnerFullControl": Object owner gets OWNER access, and project team owners get OWNER access. - "bucketOwnerRead": Object owner gets OWNER access, and project team owners get READER access. - "private": Object owner gets OWNER access. - "projectPrivate": Object owner gets OWNER access, and project team members get access according to their roles. - "publicRead": Object owner gets OWNER access, and allUsers get READER access.

  Possible values:

  - authenticatedRead
  - bucketOwnerFullControl
  - bucketOwnerRead
  - private
  - projectPrivate
  - publicRead


## GCP Permissions

Ensure the [Google Cloud Storage](https://console.cloud.google.com/apis/library/storage-component.googleapis.com/) is enabled for the current project.
