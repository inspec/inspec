+++
title = "aws_s3_bucket resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_s3_bucket"
    identifier = "inspec/resources/aws/aws_s3_bucket.md aws_s3_bucket resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_s3_bucket` InSpec audit resource to test properties of a single AWS bucket.

## Syntax

An `aws_s3_bucket` resource block declares a bucket by name, and then lists tests to be performed.

    describe aws_s3_bucket(bucket_name: 'test_bucket') do
      it { should exist }
      it { should_not be_public }
    end

    describe aws_s3_bucket('test_bucket') do
      it { should exist }
    end

## Parameters

### bucket_name _(required)_

This resource accepts a single parameter, the S3 Bucket Name which uniquely identifies the bucket.
This can be passed either as a string or as a `bucket_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html).

## Properties

| Property               | Description                                                                                                             |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| region                 | The region of the bucket. Region is overridden based on the location returned from S3                                   |
| bucket_acl             | An array of AWS Grants detailing permission grants on the bucket.                                                       |
| bucket_policy          | The IAM policy document controlling access to the bucket.                                                               |
| bucket_lifecycle_rules | The lifecycle policy rules that define actions S3 will take for all objects (or a subset of objects) in their lifetime. |
| tags                   | An hash with each key-value pair corresponding to a tag associated with the entity                                      |

## Examples

### Test the bucket-level ACL

    describe aws_s3_bucket('test_bucket') do
      its('bucket_acl.count') { should eq 1 }
    end

### Check if a bucket has a bucket policy

    describe aws_s3_bucket('test_bucket') do
      its('bucket_policy') { should be_empty }
    end

### Check if a bucket appears to be exposed to the public

    describe aws_s3_bucket('test_bucket') do
      it { should_not be_public }
    end

### Check if the correct region is set

    describe aws_s3_bucket('test_bucket') do
      its('region') { should eq 'us-east-1' }
    end

### Check bucket's ACL for correct grants

    bucket_acl = aws_s3_bucket('my-bucket').bucket_acl

    # Look for grants to "AllUsers" (that is, the public)
    all_users_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end

    # Look for grants to "AuthenticatedUsers" (that is, any authenticated AWS user - nearly public)
    auth_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/
    end

### Test all buckets

    aws_s3_buckets.bucket_names.each do |bucket_name|
        describe aws_s3_bucket(bucket_name) do
          it { should have_default_encryption_enabled }
          end
      end

### Test buckets in a specific region

    aws_s3_buckets.bucket_names.each do |bucket_name|
      if aws_s3_bucket(bucket_name: bucket_name).region == region
        describe aws_s3_bucket(bucket_name) do
          it { should have_default_encryption_enabled }
              end
          end
      end

### Check if a bucket has a bucket policy that requires requests to use HTTPS

    describe aws_s3_bucket('test_bucket') do
      it { should have_secure_transport_enabled }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### be_public

The `be_public` matcher tests if the bucket has potentially insecure access controls. This high-level matcher detects several insecure conditions, which may be enhanced in the future. Currently, the matcher reports an insecure bucket if any of the following conditions are met:

1. A bucket ACL grant exists for the 'AllUsers' group
2. A bucket ACL grant exists for the 'AuthenticatedUsers' group
3. A bucket policy has an effect 'Allow' and principal '\*'

Note: This resource does not detect insecure object ACLs.

    it { should_not be_public }

### have_access_logging_enabled

The `have_access_logging_enabled` matcher tests if access logging is enabled for the s3 bucket.

    it { should have_access_logging_enabled }

### have_default_encryption_enabled

The `have_default_encryption_enabled` matcher tests if default encryption is enabled for the s3 bucket.

    it { should have_default_encryption_enabled }

### have_versioning_enabled

The `have_versioning_enabled` matcher tests if versioning is enabled for the s3 bucket.

it { should have_versioning_enabled }

### have_secure_transport_enabled

The `have_secure_transport_enabled` matcher tests if a bucket policy that explicitly denies requests via HTTP is enabled for the s3 bucket.

it { should have_secure_transport_enabled }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `s3:GetBucketAcl`, `s3:GetBucketLocation`, `s3:GetBucketLogging`, `s3:GetBucketPolicy`, and `s3:GetEncryptionConfiguration` actions set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon S3](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html).
