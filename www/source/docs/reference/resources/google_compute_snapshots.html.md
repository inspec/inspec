---
title: About the google_compute_snapshots resource
platform: gcp
---

## Syntax
A `google_compute_snapshots` is used to test a Google Snapshot resource

## Examples
```

describe google_compute_snapshots(project: 'chef-gcp-inspec') do
  its('count') { should be >= 1 }
end

describe.one do
  google_compute_snapshots(project: 'chef-gcp-inspec').names do |snapshot_name|
    describe google_compute_snapshot(project: 'chef-gcp-inspec', name: snapshot_name) do
      its('source_disk') { should match 'my_disk' }
    end
  end
end
```

## Properties
Properties that can be accessed from the `google_compute_snapshots` resource:

See [google_compute_snapshot.md](google_compute_snapshot.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_snapshot` creation_timestamp
  * `ids`: an array of `google_compute_snapshot` id
  * `disk_size_gbs`: an array of `google_compute_snapshot` disk_size_gb
  * `names`: an array of `google_compute_snapshot` name
  * `descriptions`: an array of `google_compute_snapshot` description
  * `storage_bytes`: an array of `google_compute_snapshot` storage_bytes
  * `licenses`: an array of `google_compute_snapshot` licenses
  * `labels`: an array of `google_compute_snapshot` labels
  * `label_fingerprints`: an array of `google_compute_snapshot` label_fingerprint
  * `source_disks`: an array of `google_compute_snapshot` source_disk
  * `zones`: an array of `google_compute_snapshot` zone
  * `snapshot_encryption_keys`: an array of `google_compute_snapshot` snapshot_encryption_key
  * `source_disk_encryption_keys`: an array of `google_compute_snapshot` source_disk_encryption_key

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
