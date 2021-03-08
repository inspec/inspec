+++
title = "google_compute_disks resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_disks"
    identifier = "inspec/resources/gcp/google_compute_disks.md google_compute_disks resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_disks` is used to test a Google Disk resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
most_recent_image = google_compute_image(project: 'debian-cloud', name: 'debian-10-buster-v20191014')
describe google_compute_disks(project: 'chef-gcp-inspec', zone: 'zone') do
  it { should exist }
  its('names') { should include 'inspec-snapshot-disk' }
  its('source_images') { should include most_recent_image.self_link }
end
```

## Properties

Properties that can be accessed from the `google_compute_disks` resource:

See the [google_compute_disk](/inspec/resources/google_compute_disk/#properties) resource for more information.

`label_fingerprints`
: an array of `google_compute_disk` label_fingerprint

`creation_timestamps`
: an array of `google_compute_disk` creation_timestamp

`descriptions`
: an array of `google_compute_disk` description

`ids`
: an array of `google_compute_disk` id

`last_attach_timestamps`
: an array of `google_compute_disk` last_attach_timestamp

`last_detach_timestamps`
: an array of `google_compute_disk` last_detach_timestamp

`labels`
: an array of `google_compute_disk` labels

`licenses`
: an array of `google_compute_disk` licenses

`names`
: an array of `google_compute_disk` name

`size_gbs`
: an array of `google_compute_disk` size_gb

`users`
: an array of `google_compute_disk` users

`physical_block_size_bytes`
: an array of `google_compute_disk` physical_block_size_bytes

`types`
: an array of `google_compute_disk` type

`source_images`
: an array of `google_compute_disk` source_image

`resource_policies`
: (Beta only) an array of `google_compute_disk` resource_policies

`zones`
: an array of `google_compute_disk` zone

`source_image_encryption_keys`
: an array of `google_compute_disk` source_image_encryption_key

`source_image_ids`
: an array of `google_compute_disk` source_image_id

`disk_encryption_keys`
: an array of `google_compute_disk` disk_encryption_key

`source_snapshots`
: an array of `google_compute_disk` source_snapshot

`source_snapshot_encryption_keys`
: an array of `google_compute_disk` source_snapshot_encryption_key

`source_snapshot_ids`
: an array of `google_compute_disk` source_snapshot_id

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
