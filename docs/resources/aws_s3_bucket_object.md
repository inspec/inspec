---
title: About the aws_s3_bucket_object Resource
---

# aws_s3_bucket_object

Use the `aws_s3_bucket_object` InSpec audit resource to test properties of a s3 bucket object.

To test properties of a single object(file), use the `aws_s3_bucket_object` resource.

<br>

## Syntax

An `aws_s3_bucket_object` resource block uses the parameter to select a bucket and a object in the bucket

    describe aws_s3_bucket_object(bucket_name: 'private_bucket', key: 'private_file') do
      it { should exist }
      it { should_not be_public }
      its('permissions.everyone') { should be_in [] }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test the object ACL to make sure it is not public.

    describe aws_s3_bucket_object(name: 'bucket_name', key: 'private_file') do
      it { should_not be_public }
    end

### Test authenticated users permissions

ACLs can also be granted at the level of Authenticated Users, meaning any AWS user.

    describe aws_s3_bucket_object(name: 'bucket_name', key: 'private_file.jpg') do
      its('permissions.authUsers') { should be_in [] }
    end

<br>

## Supported Properties

### permissions (Hash)

The `permissions` hash property is used for matching the permissions of specific group.

    describe aws_s3_bucket_object(name: 'bucket_name', key: 'public_file.jpg') do
      # Check examples of 'owner'
      its('permissions.owner') { should be_in ['FULL_CONTROL'] }

      # Check examples of 'authUsers'
      its('permissions.authUsers') { should be_in ['READ'] }

      # Check examples of 'everyone'
      its('permissions.everyone') { should be_in ['READ'] }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### public

The `public` matcher tests if the object is publicly accessible to everyone.

    it { should be_public }
