+++
title = "aws_efs_file_systems resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_efs_file_systems"
    identifier = "inspec/resources/aws/aws_efs_file_systems.md aws_efs_file_systems"
    parent = "inspec/resources/aws"
+++

Use the `aws_efs_file_systems` InSpec audit resource to test the properties of
some or all AWS EFS file systems. To audit a single EFS file system, use
`aws_efs_file_ststem` (singular).

This resource is added to InSpec AWS resource pack in version **[1.10.0](https://github.com/inspec/inspec-aws/releases/tag/v1.10.0)** and it is available with InSpec **[4.18.108](https://github.com/inspec/inspec/releases/tag/v4.18.108)** and later versions.

## Syntax

An `aws_efs_file_systems` resource block collects a group of EFS file system descriptions and then tests that group.

    describe aws_efs_file_systems
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

## Properties

| Property          | Description                                                                                                                         |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| tags              | The list of tags that the EFS file system has.                                                                                      |
| names             | The value of the `Name` (case sensitive) tag if it is defined.                                                                      |
| file_system_ids   | The ID of the EFS file system.                                                                                                      |
| creation_tokens   | The creation token that the EFS file system is associated.                                                                          |
| owner_ids         | The owner id of the EFS file system.                                                                                                |
| entries           | Provides access to the raw results of the query, which can be treated as an array of hashes.                                        |
| creation_times    | The creation time of the EFS file system                                                                                            |
| performance_modes | The performance mode of the EFS file system, e.g. 'maxIO'.                                                                          |
| encryption_status | This indicates whether the EFS file system is encrypted or not.                                                                     |
| throughput_modes  | The throughput mode of the EFS file system.                                                                                         |
| kms_key_ids       | The ID of an AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the encrypted EFS file system. |
| size_in_bytes     | The latest known metered size (in bytes) of data stored in the file system, in its `value` field.                                   |
| life_cycle_states | The life cycle phase of the EFS file system, e.g. 'deleting'.                                                                       |

## Examples

### Ensure you have exactly 3 file systems

    describe aws_efs_file_systems do
      its("entries.count") { should cmp 3 }
    end

### Use this InSpec resource to request the IDs of all EFS file systems, then test in-depth using `aws_efs_file_system`.

    aws_efs_file_systems.file_system_ids.each do |file_system_id|
      describe aws_efs_file_system(file_system_id) do
        its("tags") { should include("companyName" => "My Company Name") }
        it { should be_encrypted }
        its("throughput_mode") { should eq "bursting" }
        its("performance_mode") { should eq "generalPurpose" }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_efs_file_systems.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_efs_file_systems.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `elasticfilesystem:DescribeFileSystems` action set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EFS](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonelasticfilesystem.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
