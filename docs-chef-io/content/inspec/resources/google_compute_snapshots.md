+++
title = "google_compute_snapshots resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_snapshots"
    identifier = "inspec/resources/gcp/google_compute_snapshots.md google_compute_snapshots resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_snapshots` is used to test a Google Snapshot resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_snapshots(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
end

describe.one do
  google_compute_snapshots(project: 'chef-gcp-inspec').names do |snapshot_name|
    describe google_compute_snapshot(project: 'chef-gcp-inspec', name: snapshot_name) do
      its('source_disk') { should match 'inspec-snapshot-disk' }
    end
  end
end
```

## Properties

Properties that can be accessed from the `google_compute_snapshots` resource:

See the [google_compute_snapshot](/inspec/resources/google_compute_snapshot/#properties) resource for more information.

`creation_timestamps`
: an array of `google_compute_snapshot` creation_timestamp

`ids`
: an array of `google_compute_snapshot` id

`disk_size_gbs`
: an array of `google_compute_snapshot` disk_size_gb

`names`
: an array of `google_compute_snapshot` name

`descriptions`
: an array of `google_compute_snapshot` description

`storage_bytes`
: an array of `google_compute_snapshot` storage_bytes

`licenses`
: an array of `google_compute_snapshot` licenses

`labels`
: an array of `google_compute_snapshot` labels

`label_fingerprints`
: an array of `google_compute_snapshot` label_fingerprint

`source_disks`
: an array of `google_compute_snapshot` source_disk

`zones`
: an array of `google_compute_snapshot` zone

`snapshot_encryption_keys`
: an array of `google_compute_snapshot` snapshot_encryption_key

`source_disk_encryption_keys`
: an array of `google_compute_snapshot` source_disk_encryption_key

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
