---
title: About the aws_s3_buckets Resource
---

# aws_s3_buckets

Use the `aws_s3_buckets` InSpec audit resource to list all buckets in a single account.

<br>

## Syntax

An `aws_s3_buckets` resource block takes no arguments

    describe aws_s3_buckets do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

As this is the initial release of `aws_s3_buckets`, its limited functionality precludes examples.

<br>

## Matchers

### exists

The control will pass if the resource contains at least one bucket.

    # Test if there are any buckets
    describe aws_s3_buckets
      it { should exist }
    end

## Properties

### bucket_names

Provides an array of strings containing the names of the buckets.

    # Examine a specific subnets cidr_blocks
    describe aws_s3_buckets do
      its('bucket_names') { should eq ['my_bucket'] }
    end
