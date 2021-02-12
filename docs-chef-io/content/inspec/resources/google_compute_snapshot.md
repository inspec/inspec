+++
title = "google_compute_snapshot resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_snapshot"
    identifier = "inspec/resources/gcp/google_compute_snapshot.md google_compute_snapshot resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_snapshot` is used to test a Google Snapshot resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_snapshot(project: 'chef-gcp-inspec', name: 'inspec-gcp-disk-snapshot') do
  it { should exist }
  its('source_disk') { should match 'inspec-snapshot-disk' }
end

describe google_compute_snapshot(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_snapshot` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`id`
: The unique identifier for the resource.

`disk_size_gb`
: Size of the snapshot, specified in GB.

`name`
: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`description`
: An optional description of this resource.

`storage_bytes`
: A size of the the storage used by the snapshot. As snapshots share storage, this number is expected to change with snapshot creation/deletion.

`licenses`
: A list of public visible licenses that apply to this snapshot. This can be because the original image had licenses attached (such as a Windows image). snapshotEncryptionKey nested object Encrypts the snapshot using a customer-supplied encryption key.

`labels`
: Labels to apply to this Snapshot.

`label_fingerprint`
: The fingerprint used for optimistic locking of this resource. Used internally during updates.

`source_disk`
: A reference to the disk used to create this snapshot.

`zone`
: A reference to the zone where the disk is hosted.

`snapshot_encryption_key`
: The customer
-supplied encryption key of the snapshot. Required if the source snapshot is protected by a customer-supplied encryption key.

`raw_key`
: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

`sha256`
: The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

`kms_key_name`
: The name of the encryption key that is stored in Google Cloud KMS.

`source_disk_encryption_key`
: The customer
-supplied encryption key of the source snapshot. Required if the source snapshot is protected by a customer-supplied encryption key.

`raw_key`
: Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

`kms_key_name`
: The name of the encryption key that is stored in Google Cloud KMS.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
