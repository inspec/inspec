+++
title = "google_compute_image resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_image"
    identifier = "inspec/resources/gcp/google_compute_image.md google_compute_image resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_image` is used to test a Google Image resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_image(project: 'chef-gcp-inspec', name: 'inspec-image') do
  it { should exist }
  its('disk_size_gb') { should cmp 3 }
end

describe google_compute_image(project: 'chef-gcp-inspec', name: 'notfound') do
  it { should_not exist }
end
```

### Test that a GCP compute image is in a particular status e.g. "READY" means available for use

    describe google_compute_image(project: 'chef-inspec-gcp', location: 'europe-west2', name: 'compute-address') do
      its('status') { should eq "READY" }
    end

### Test that a GCP compute image has the expected family

    describe google_compute_image(project: 'chef-inspec-gcp', name: 'ubuntu') do
      its('family') { should match "ubuntu" }
    end

## Properties

Properties that can be accessed from the `google_compute_image` resource:

`archive_size_bytes`
: Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`deprecated`
: The deprecation status associated with this image.

  `deleted`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DELETED. This is only informational and the status will not change unless the client explicitly changes it.

  `deprecated`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to DEPRECATED. This is only informational and the status will not change unless the client explicitly changes it.

  `obsolete`
  : An optional RFC3339 timestamp on or after which the state of this resource is intended to change to OBSOLETE. This is only informational and the status will not change unless the client explicitly changes it.

  `replacement`
  : The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

  `state`
  : The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.

    Possible values:

    - DEPRECATED
    - OBSOLETE
    - DELETED

`description`
: An optional description of this resource. Provide this property when you create the resource.

`disk_size_gb`
: Size of the image when restored onto a persistent disk (in GB).

`family`
: The name of the image family to which this image belongs. You can create disks by specifying an image family instead of a specific image name. The image family always returns its latest image that is not deprecated. The name of the image family must comply with RFC1035.

`guest_os_features`
: A list of features to enable on the guest operating system. Applicable only for bootable images.

  `type`
  : The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options.

    Possible values:

    - MULTI_IP_SUBNET
    - SECURE_BOOT
    - UEFI_COMPATIBLE
    - VIRTIO_SCSI_MULTIQUEUE
    - WINDOWS

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`image_encryption_key`
: Encrypts the image using a customer-supplied encryption key. After you encrypt an image with a customer-supplied key, you must provide the same key if you use the image later (e.g. to create a disk from the image)

  `raw_key`
  : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

  `sha256`
  : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  `kms_key_name`
  : (Beta only) The name of the encryption key that is stored in Google Cloud KMS.

`labels`
: Labels to apply to this Image.

`label_fingerprint`
: The fingerprint used for optimistic locking of this resource. Used internally during updates.

`licenses`
: Any applicable license URI.

`name`
: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`raw_disk`
: The parameters of the raw disk image.

  `container_type`
  : The format used to encode and transmit the block device, which should be TAR. This is just a container and transmission format and not a runtime format. Provided by the client when the disk image is created.

    Possible values:
    - TAR

  `sha1_checksum`
  : An optional SHA1 checksum of the disk image before unpackaging. This is provided by the client when the disk image is created.

  `source`
  : The full Google Cloud Storage URL where disk storage is stored You must provide either this property or the sourceDisk property but not both.

`source_disk`
: The source disk to create this image based on. You must provide either this property or the rawDisk.source property but not both to create an image.

`source_disk_encryption_key`
: The customer-supplied encryption key of the source disk. Required if the source disk is protected by a customer-supplied encryption key.

  `raw_key`
  : Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.

  `sha256`
  : The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.

  `kms_key_name`
  : (Beta only) The name of the encryption key that is stored in Google Cloud KMS.

`source_disk_id`
: The ID value of the disk used to create this image. This value may be used to determine whether the image was taken from the current or a previous instance of a given disk name.

`source_type`
: The type of the image used to create this disk. The default and only value is RAW

  Possible values:
  - RAW

`self_link`
: The self link of the image

`status`
: The status of the image. Either `READY` `PENDING` or `FAILED`.

  Possible values:

  - READY
  - PENDING
  - FAILED

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
