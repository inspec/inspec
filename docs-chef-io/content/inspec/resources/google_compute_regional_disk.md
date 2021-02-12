+++
title = "google_compute_regional_disk resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_regional_disk"
    identifier = "inspec/resources/gcp/google_compute_regional_disk.md google_compute_regional_disk resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_regional_disk` is used to test a Google Regional Disk resource

## Examples

```ruby
describe google_compute_regional_disk(project: 'chef-gcp-inspec', name: 'my_disk', region: 'region') do
  it { should exist }
  its('type') { should match 'pd-standard' }
end

describe.one do
  google_compute_regional_disk(project: 'chef-gcp-inspec', name: 'my_disk', region: 'region').labels.each_pair do |key, value|
    describe key do
      it { should cmp "environment" }
    end
  end
end

describe google_compute_regional_disk(project: 'chef-gcp-inspec', name: 'nonexistent', region: 'region') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_regional_disk` resource:

`label_fingerprint`
: The fingerprint used for optimistic locking of this resource. Used internally during updates.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`size_gb`
: Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the sourceImage or sourceSnapshot parameter, or specify it alone to create an empty persistent disk. If you specify this field along with sourceImage or sourceSnapshot, the value of sizeGb must not be less than the size of the sourceImage or the size of the snapshot.

`physical_block_size_bytes`
: Physical block size of the persistent disk, in bytes. If not present in a request, a default value is used. Currently supported sizes are 4096 and 16384, other sizes may be added in the future. If an unsupported value is requested, the error message will list the supported values for the caller's project.

`type`
: URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk.

`region`
: A reference to the region where the disk resides.

`replica_zones`
: A reference to the zones where the disk resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
