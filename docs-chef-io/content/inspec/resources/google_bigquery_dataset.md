+++
title = "google_bigquery_dataset resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_bigquery_dataset"
    identifier = "inspec/resources/gcp/google_bigquery_dataset.md google_bigquery_dataset resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_bigquery_dataset` is used to test a Google Dataset resource

## Examples

```ruby
describe google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'inspec_gcp_dataset') do
  it { should exist }

  its('friendly_name') { should eq 'A BigQuery dataset test' }
  its('location') { should eq 'EU' }
  its('description') { should eq 'Test BigQuery dataset description' }
  its('name') { should eq 'inspec_gcp_dataset' }
  its('default_table_expiration_ms') { should cmp '3600000' }
end

describe.one do
  google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'inspec_gcp_dataset').access.each do |dataset_access|
    describe dataset_access do
      its('role') { should eq 'WRITER' }
      its('special_group') { should eq 'projectWriters' }
    end
  end
end

describe google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_bigquery_dataset` resource:

`access`
: An array of objects that define dataset access for one or more entities.

`domain`
: A domain to grant access to. Any users signed in with the domain specified will be granted the specified access

`group_by_email`
: An email address of a Google Group to grant access to.

`role`
: Describes the rights granted to the user specified by the other member of the access object. Primitive, Predefined and custom roles are supported. Predefined roles that have equivalent primitive roles are swapped by the API to their Primitive counterparts. See [official docs](https://cloud.google.com/bigquery/docs/access-control).

`special_group`
: A special group to grant access to.

  Possible values include:
  - `projectOwners`: Owners of the enclosing project.
  - `projectReaders`: Readers of the enclosing project.
  - `projectWriters`: Writers of the enclosing project.
  - `allAuthenticatedUsers`: All authenticated BigQuery users.

`user_by_email`
: An email address of a user to grant access to. For example: fred@example.com

`iam_member`
: Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. For example: `allUsers`

`view`
: A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation.

  `dataset_id`
  : The ID of the dataset containing this table.

  `project_id`
  : The ID of the project containing this table.

  `table_id`
  : The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (\_). The maximum length is 1,024 characters.

`creation_time`
: The time when this dataset was created, in milliseconds since the epoch.

`dataset_reference`
: A reference that identifies the dataset.

`dataset_id`
: A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (\_). The maximum length is 1,024 characters.

`project_id`
: The ID of the project containing this dataset.

`default_table_expiration_ms`
: The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). Once this property is set, all newly-created tables in the dataset will have an `expirationTime` property set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the `expirationTime` for a given table is reached, that table will be deleted automatically. If a table's `expirationTime` is modified or removed before the table expires, or if you provide an explicit `expirationTime` when creating a table, that value takes precedence over the default expiration time indicated by this property.

`default_partition_expiration_ms`
: The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an `expirationMs` property in the `timePartitioning` settings set to this value, and changing the value will only affect new tables, not existing ones. The storage in a partition will have an expiration time of its partition time plus this value. Setting this property overrides the use of `defaultTableExpirationMs` for partitioned tables: only one of `defaultTableExpirationMs` and `defaultPartitionExpirationMs` will be used for any new partitioned table. If you provide an explicit `timePartitioning.expirationMs` when creating or updating a partitioned table, that value takes precedence over the default partition expiration time indicated by this property.

`description`
: A user-friendly description of the dataset

`etag`
: A hash of the resource.

`friendly_name`
: A descriptive name for the dataset

`id`
: The fully-qualified unique name of the dataset in the format projectId:datasetId. The dataset name without the project name is given in the datasetId field

`labels`
: The labels associated with this dataset. You can use these to organize and group your datasets

`last_modified_time`
: The date when this dataset or any of its tables was last modified, in milliseconds since the epoch.

`location`
: The geographic location where the dataset should reside. See [official docs](https://cloud.google.com/bigquery/docs/dataset-locations). There are two types of locations, regional or multi-regional. A regional location is a specific geographic place, such as Tokyo, and a multi-regional location is a large geographic area, such as the United States, that contains at least two geographic places. Possible regional values include: `asia-east1`, `asia-northeast1`, `asia-southeast1`, `australia-southeast1`, `europe-north1`, `europe-west2` and `us-east4`. Possible multi-regional values: `EU` and `US`. The default value is multi-regional location `US`. Changing this forces a new resource to be created.

`default_encryption_configuration`
: The default encryption key for all tables in the dataset. Once this property is set, all newly-created partitioned tables in the dataset will have encryption key set to this value, unless table creation request (or query) overrides the key.

`kms_key_name`
: Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.

## GCP Permissions

Ensure the [BigQuery API](https://console.cloud.google.com/apis/library/bigquery-json.googleapis.com/) is enabled for the current project.
