+++
title = "google_compute_disk resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_disk"
    identifier = "inspec/resources/gcp/google_compute_disk.md google_compute_disk resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_disk` is used to test a Google Disk resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

most_recent_image = google_compute_image(project: 'debian-cloud', name: 'debian-10-buster-v20191014')

describe google_compute_disk(project: 'chef-gcp-inspec', name: 'inspec-snapshot-disk', zone: 'zone') do
  it { should exist }
  # Test that the image is the most recent image for the family
  its('source_image') { should match most_recent_image.self_link }
  its('type') { should match 'pd-standard' }
end

describe.one do
  google_compute_disk(project: 'chef-gcp-inspec', name: 'inspec-snapshot-disk', zone: 'zone').labels.each_pair do |key, value|
    describe key do
      it { should cmp "environment" }
    end
  end
end

describe google_compute_disk(project: 'chef-gcp-inspec', name: 'nonexistent', zone: 'zone') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_disk` resource:

`label_fingerprint`
: The fingerprint used for optimistic locking of this resource. Used internally during updates.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource.

`last_attach_timestamp`
: Last attach timestamp in RFC3339 text format.

`last_detach_timestamp`
: Last detach timestamp in RFC3339 text format.

`labels`
: Labels to apply to this disk. A list of key->value pairs.

`licenses`
: Any applicable publicly visible licenses.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`size_gb`
: Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the sourceImage or sourceSnapshot parameter, or specify it alone to create an empty persistent disk. If you specify this field along with sourceImage or sourceSnapshot, the value of sizeGb must not be less than the size of the sourceImage or the size of the snapshot.

`users`
: Links to the users of the disk (attached instances) in form: project/zones/zone/instances/instance

`physical_block_size_bytes`
: Physical block size of the persistent disk, in bytes. If not present in a request, a default value is used. Currently supported sizes are 4096 and 16384, other sizes may be added in the future. If an unsupported value is requested, the error message will list the supported values for the caller's project.

`type`
: URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk.

`source_image`
: The source image used to create this disk. If the source image is deleted, this field will not be set. To create a disk with one of the public operating system images, specify the image by its family name. For example, specify family/debian-8 to use the latest Debian 8 image: projects/debian-cloud/global/images/family/debian-8 Alternatively, use a specific version of a public operating system image: projects/debian-cloud/global/images/debian-8-jessie-vYYYYMMDD To create a disk with a private image that you created, specify the image name in the following format: global/images/my-private-image You can also specify a private image by its image family, which returns the latest version of the image in that family. Replace the image name with family/family-name: global/images/family/my-private-family

`resource_policies`
: (Beta only) Resource policies applied to this disk for automatic snapshot creations.

`zone`
: A reference to the zone where the disk resides.

`source_image_encryption_key`
: The customer-supplied encryption key of the source image. Required if the source image is protected by a customer-supplied encryption key.

  `raw_key`
  : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

  `sha256`
  : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  `kms_key_name`
  : The name of the encryption key that is stored in Google Cloud KMS.

`source_image_id`
: The ID value of the image used to create this disk. This value identifies the exact image that was used to create this persistent disk. For example, if you created the persistent disk from an image that was later deleted and recreated under the same name, the source image ID would identify the exact version of the image that was used.

`disk_encryption_key`
: Encrypts the disk using a customer-supplied encryption key. After you encrypt a disk with a customer-supplied key, you must provide the same key if you use the disk later (e.g. to create a disk snapshot or an image, or to attach the disk to a virtual machine). Customer-supplied encryption keys do not protect access to metadata of the disk. If you do not provide an encryption key when creating the disk, then the disk will be encrypted using an automatically generated key and you do not need to provide a key to use the disk later.

  `raw_key`
  : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

  `sha256`
  : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  `kms_key_name`
  : The name of the encryption key that is stored in Google Cloud KMS. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature.

`source_snapshot`
: The source snapshot used to create this disk. You can provide this as a partial or full URL to the resource. If the snapshot is in another project than this disk, you must supply a full URL. For example, the following are valid values:
  - `https://www.googleapis.com/compute/v1/projects/project/global/snapshots/snapshot`
  - `projects/project/global/snapshots/snapshot`
  - `global/snapshots/snapshot`

`source_snapshot_encryption_key`
: The customer-supplied encryption key of the source snapshot. Required if the source snapshot is protected by a customer-supplied encryption key.

  `raw_key`
  : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

  `kms_key_name`
  : The name of the encryption key that is stored in Google Cloud KMS.

  `sha256`
  : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

`source_snapshot_id`
: The unique ID of the snapshot used to create this disk. This value identifies the exact snapshot that was used to create this persistent disk. For example, if you created the persistent disk from a snapshot that was later deleted and recreated under the same name, the source snapshot ID would identify the exact version of the snapshot that was used.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
