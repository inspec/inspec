---
title: About the google_bigquery_dataset resource
platform: gcp
---

## Syntax
A `google_bigquery_dataset` is used to test a Google Dataset resource

## Examples
```
describe google_bigquery_dataset(project: 'chef-gcp-inspec', name: 'inspec_gcp_dataset') do
  it { should exist }

  its('friendly_name') { should eq 'A BigQuery dataset test' }
  its('location') { should eq 'EU' }
  its('description') { should eq 'Test BigQuery dataset description' }
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

  * `name`: Dataset name

  * `access`: Access controls on the bucket.

    * `domain`: A domain to grant access to. Any users signed in with the domain specified will be granted the specified access

    * `groupByEmail`: An email address of a Google Group to grant access to

    * `role`: Describes the rights granted to the user specified by the other member of the access object

    * `specialGroup`: A special group to grant access to.

    * `userByEmail`: An email address of a user to grant access to. For example: fred@example.com

    * `view`: A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation.

  * `creation_time`: The time when this dataset was created, in milliseconds since the epoch.

  * `dataset_reference`: A reference that identifies the dataset.

    * `datasetId`: A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.

    * `projectId`: The ID of the project containing this dataset.

  * `default_table_expiration_ms`: The default lifetime of all tables in the dataset, in milliseconds

  * `description`: A user-friendly description of the dataset

  * `friendly_name`: A descriptive name for the dataset

  * `id`: The fully-qualified unique name of the dataset in the format projectId:datasetId. The dataset name without the project name is given in the datasetId field

  * `labels`: The labels associated with this dataset. You can use these to organize and group your datasets

  * `last_modified_time`: The date when this dataset or any of its tables was last modified, in milliseconds since the epoch.

  * `location`: The geographic location where the dataset should reside. Possible values include EU and US. The default value is US.
