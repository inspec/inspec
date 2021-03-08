+++
title = "aws_efs_file_system resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_efs_file_system"
    identifier = "inspec/resources/aws/aws_efs_file_system.md aws_efs_file_system"
    parent = "inspec/resources/aws"
+++

[\[edit on GitHub\]](https://github.com/inspec/inspec/blob/master/docs-chef-io/content/inspec/rources/aws_efs_file_system.md)

Use the `aws_efs_file_system` InSpec audit resource to test the properties of a single AWS EFS file system.
This resource is added to InSpec AWS resource pack in version **[1.10.0](https://github.com/inspec/inspec-aws/releases/tag/v1.10.0)** and it is available with InSpec **[4.18.108](https://github.com/inspec/inspec/releases/tag/v4.18.108)** and later versions.

## Syntax

An `aws_efs_file_system` resource block declares the tests for a single AWS EFS file system by either file system id or creation token.

    describe aws_efs_file_system(file_system_id: 'fs-12345678') do
      it                         { should be_encrypted }
      its('size_in_bytes.value') { should cmp 6144 }
    end

    describe aws_efs_file_system(creation_token: 'my-token') do
      its('encrypted')       { should cmp true }
      its('throughput_mode') { should eq 'bursting' }
    end

The value of the `file_system_id` can be provided as a string.

    describe aws_efs_file_system('fs-12345678') do
      it { should exist }
    end

## Parameters

Either the EFS file system id or creation token must be provided.

### file_system_id _(required if `creation_token` not provided)_

The ID of the EFS file system. This is in the format of `fs-` followed by 8 or 17 hexadecimal characters.
This can be passed either as a string or as a `file_system_id: 'value'` key-value entry in a hash.

### creation*token *(required if `file_system_id` not provided)\_

The creation token is automatically assigned by AWS if not provided by the user at creation.
This is a string with minimum 1 and maximum 64-character long.
This must be passed as a `creation_token: 'value'` key-value entry in a hash.

## Properties

| Property         | Description                                                                         |
| ---------------- | ----------------------------------------------------------------------------------- |
| creation_token   | The value of the creation token.                                                    |
| file_system_id   | The id of the file system which is auto-assigned by the AWS.                        |
| encrypted        | Indicates whether the file system is encrypted or not.                              |
| life_cycle_state | The lifecycle phase of the file system, e.g. 'creating'.                            |
| owner_id         | The AWS account that created the file system.                                       |
| performance_mode | The performance mode of the file system, e.g. 'maxIO'.                              |
| throughput_mode  | The throughput mode for a file system, e.g. 'bursting'.                             |
| tags             | An hash with each key-value pair corresponding to a tag associated with the entity. |

There are also additional properties available. For a comprehensive list, see [the API reference documentation](https://docs.aws.amazon.com/efs/latest/ug/API_FileSystemDescription.html)

## Examples

### Test that an EFS file system is available

    describe aws_efs_file_system("fs-12345678") do
        its("life_cycle_state") { should eq 'available' }
    end

### Test that an EFS file system is in 'maxIO' performance mode

    describe aws_efs_file_system(creation_token: "My Token") do
        its("performance_mode") { should eq "maxIO" }
    end

### Test that an EFS file system has a certain tag

    describe aws_efs_file_system(creation_token: "My Token") do
        its("tags") { should include("companyName" => "My Company") }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list
of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

    describe aws_efs_file_system(file_system_id: "fs-12345678") do
        it { should exist }
    end

### be_encrypted

    describe aws_efs_file_system(creation_token: "My Token") do
        it { should be_encrypted }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `elasticfilesystem:DescribeFileSystems` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EFS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonelasticfilesystem.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
