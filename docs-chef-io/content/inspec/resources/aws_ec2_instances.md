+++
title = "aws_ec2_instances resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_ec2_instances"
    identifier = "inspec/resources/aws/aws_ec2_instances.md aws_ec2_instances resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_ec2_instances` InSpec audit resource to test properties of some or all AWS EC2 instances. To audit a single EC2 instance, use `aws_ec2_instance` (singular).

## Syntax

An `aws_ec2_instances` resource block collects a group of EC2 Instances and then tests that group.

    describe aws_ec2_instances
      it { should exist }
    end

## Parameters

This resource does not expect any parameters.

## Properties

| Property       | Description                                                                                                                                                                                                                                                                                            |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| instance_ids   | The ID of the EC2 instance. The field name is `instance_id`.                                                                                                                                                                                                                                           |
| names          | The value of the `Name` tag if applied to the instance. The filed name is `name`.                                                                                                                                                                                                                      |
| vpc_ids        | The VPC with which the EC2 instance is associated. The field name is `vpc_id`.                                                                                                                                                                                                                         |
| subnet_ids     | The subnet with which the EC2 instance is associated. The field name is `subnet_id`.                                                                                                                                                                                                                   |
| instance_types | The type of instance, for example m5.large. The field name is `instance_type`.                                                                                                                                                                                                                         |
| entries        | Provides access to the raw results of the query, which can be treated as an array of hashes.                                                                                                                                                                                                           |
| tags           | A hash, with each key-value pair corresponding to an EC2 instance tag, e.g, `{"Name"=>"Testing Box", "Environment"=>"Dev"}`. This property is available in InSpec AWS resource pack version **[1.12.0](https://github.com/inspec/inspec-aws/releases/tag/v1.12.0)** onwards. The field name is `tags`. |
| iam_profiles   | The IAM instance profile associated with the instance. The `role` property of the `aws_ec2_instance` singular resource can be used to check the attached IAM role on the profile. The field name is `iam_profile`.                                                                                     |

## Examples

### Ensure you have exactly 3 instances

    describe aws_ec2_instances do
      its('instance_ids.count') { should cmp 3 }
    end

### Use this InSpec resource to request the IDs of all EC2 instances, then test in-depth using `aws_ec2_instance`.

    aws_ec2_instances.instance_ids.each do |instance_id|
      describe aws_ec2_instance(instance_id) do
        it              { should_not have_roles }
        its('key_name') { should cmp 'admin-ssh-key' }
        its('image_id') { should eq 'ami-27a58d5c' }
      end
    end

### Filter EC2 instances with their `Environment` tags<superscript>\*</superscript> equal to `Dev`, then test in-depth using `aws_ec2_instance`.

    aws_ec2_instances.where(tags: {"Environment" => "Dev"}).instance_ids.each do |id|
      describe aws_ec2_instance(id) do
        it { should be_stopped }
      end
    end

<superscript>\*</superscript>Note that the filter won't return the EC2 instances with multiple tags. In this case use regex: `/{"Environment"=>"Dev"}/`

### Filter EC2 instances with a `stop-at-10-pm` tag regardless of its value, then test in-depth using `aws_ec2_instance`.

    aws_ec2_instances.where(tags: /"stop-at-10-pm"=>/).instance_ids.each do |id|
      describe aws_ec2_instance(id) do
        it { should be_stopped }
      end
    end

### Filter EC2 instances with their `name` equal to `Test Box`, then check their role using `aws_ec2_instance`.

    aws_ec2_instances.where(name: "Test Box").instance_ids.each do |id|
      describe aws_ec2_instance(id) do
        its('role) { should eq "test-role" }
      end
    end

## Matchers

For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.
The field names described in the [properties table](#properties) should be used for the `<property>` in the `where` clause.

Use `should_not` to test the entity should not exist.

    describe aws_ec2_instances.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_ec2_instances.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `ec2:DescribeInstances`, and `iam:GetInstanceProfile` actions set to allow.

You can find detailed documentation at
[Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html),
and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
