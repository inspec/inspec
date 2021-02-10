+++
title = "aws_s3_bucket_object resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_s3_bucket_object"
    identifier = "inspec/resources/aws/aws_s3_bucket_object.md aws_s3_bucket_object resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_s3_bucket_object` InSpec audit resource to test properties of a single AWS bucket object.

Each S3 Object has a 'key' which can be thought of as the name of the S3 Object which uniquely identifies it.

## Syntax

An `aws_s3_bucket_object` resource block declares a bucket and an object key by name, and then lists tests to be performed.

    describe aws_s3_bucket_object(bucket_name: 'test_bucket', key: 'test_object_key') do
      it { should exist }
      it { should_not be_public }
    end

## Parameters

### bucket_name _(required)_

The S3 Bucket Name which uniquely identifies the bucket.
This must be passed as a `bucket_name: 'value'` key-value entry in a hash.

### key _(required)_

The S3 Bucket Key which uniquely identifies the bucket object.
This must be passed as a `key: 'value'` key-value entry in a hash.

See also the [AWS documentation on S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html).

## Properties

| Property       | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| bucket_name    | The name of the bucket.                                                  |
| key            | The key within the bucket.                                               |
| content_length | Size of the body in bytes.                                               |
| content_type   | A standard MIME type describing the format of the object data.           |
| object_acl     | An array of AWS Grants detailing permission grants on the bucket object. |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html).

## Examples

### Test an object's object-level ACL

    describe aws_s3_bucket_object(bucket_name: 'test_bucket', key: 'test_key') do
      its('object_acl.count') { should eq 1 }
    end

### Test an object's size in bytes is less than `100000`

    describe aws_s3_bucket_object(bucket_name: 'test_bucket', key: 'test_key') do
      its('content_length') { should be < 1_000_000 }
    end

### Test an object's type is "image/jpeg"

    describe aws_s3_bucket_object(bucket_name: 'test_bucket', key: 'test_key') do
      its('content_type') { should eq "image/jpeg" }
    end

### Check to see if a object appears to be exposed to the public

    describe aws_s3_bucket_object(bucket_name: 'test_bucket', key: 'test_key') do
      it { should_not be_public }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers (such as `exist`) please visit our [matchers page](/inspec/matchers/).

### be_public

The `be_public` matcher tests if the object has potentially insecure access controls. This high-level matcher detects several insecure conditions, which may be enhanced in the future. Currently, the matcher reports an insecure object if any of the following conditions are met:

1. A object ACL grant exists for the 'AllUsers' group
1. A object ACL grant exists for the 'AuthenticatedUsers' group

{{< note >}}
This resource does not detect insecure bucket ACLs.
{{< /note >}}

    it { should_not be_public }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `s3:GetObject`, and `s3:GetObjectAcl` actions set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon S3](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html).
