+++
title = "aws_ebs_volume resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ebs_volume"
    identifier = "inspec/resources/aws/aws_ebs_volume.md aws_ebs_volume resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_ebs_volume` InSpec audit resource to test properties of a single AWS EBS volume.

## Syntax

Ensure an EBS exists

    describe aws_ebs_volume('vol-01a2349e94458a507') do
      it { should exist }
    end

You may also use hash syntax to pass the EBS volume name

    describe aws_ebs_volume(name: 'data-vol') do
      it { should exist }
    end

## Parameters

This resource accepts a single parameter, either the EBS Volume name or id. At least one must be provided.

### volume_id _(required if `name` not provided)_

The EBS Volume ID which uniquely identifies the volume.
This can be passed as either a string or an `volume_id: 'value'` key-value entry in a hash.

### name _(required if `volume_id` not provided)_

The EBS Volume Name which uniquely identifies the volume.
This must be passed as a `name: 'value'` key-value entry in a hash.

See also the [AWS documentation on EBS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html).

## Properties

| Property          | Description                                                                                                                                           |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| availability_zone | The Availability Zone for the volume.                                                                                                                 |
| encrypted         | Indicates whether the volume will be encrypted.                                                                                                       |
| iops              | The number of I/O operations per second (IOPS) that the volume supports.                                                                              |
| kms_key_id        | The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the volume encryption key for the volume. |
| size              | The size of the volume, in GiBs.                                                                                                                      |
| snapshot_id       | The snapshot from which the volume was created, if applicable.                                                                                        |
| status            | The volume state.                                                                                                                                     |
| volume_type       | The volume type.                                                                                                                                      |

## Examples

### Test that an EBS Volume does not exist

    describe aws_ebs_volume(name: 'data_vol') do
      it { should_not exist }
    end

### Test that an EBS Volume is encrypted

    describe aws_ebs_volume(name: 'secure_data_vol') do
      it { should be_encrypted }
    end

### Test that an EBS Volume the correct size

    describe aws_ebs_volume(name: 'data_vol') do
      its('size') { should cmp 32 }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_ebs_volume(name: 'data_vol') do
      it { should exist }
    end

    describe aws_ebs_volume(name: 'data_vol') do
      it { should_not exist }
    end

### be_encrypted

The `be_encrypted` matcher tests if the described EBS Volume is encrypted.

    it { should be_encrypted }

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeVolumes`, and `iam:GetInstanceProfile` actions set to allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
