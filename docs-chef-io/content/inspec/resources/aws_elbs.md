+++
title = "aws_elbs resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_elbs"
    identifier = "inspec/resources/aws/aws_elbs.md aws_elbs resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_elbs` InSpec audit resource to test the configuration of a collection
of AWS Elastic Load Balancers.

## Syntax

    describe aws_elbs do
      its('load_balancer_names') { should include 'elb-name' }
    end

## Parameters

This resource does not expect any parameters.

See also the [AWS documentation on Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference).

## Properties

| Property            | Description                                                                        |
| ------------------- | ---------------------------------------------------------------------------------- |
| load_balancer_names | The name of the load balancer.                                                     |
| dns_names           | The DNS name of the load balancer.                                                 |
| availability_zones  | The Availability Zones for the load balancer.                                      |
| instance_ids        | An array containing all instance ids associated with the ELB.                      |
| external_ports      | An array of the external ports exposed on the ELB.                                 |
| internal_ports      | An array of the internal ports exposed on the ELB.                                 |
| security_group_ids  | The security groups for the load balancer. Valid only for load balancers in a VPC. |
| vpc_ids             | The ID of the VPC for the load balancer.                                           |
| subnet_id s         | The IDs of the subnets for the load balancer.                                      |

## Examples

### Ensure there are no Load Balancers with an undesired zone.

    describe aws_elbs do
      it                             { should exist }
      its('availability_zones')      { should_not include 'us-east-1a'}
    end

### Ensure all ELBs expose only port 80

    aws_elbs.each do |elb|
      describe elb do
        its('external_ports.count') { should cmp 1 }
        its('external_ports')       { should include 80 }
        its('internal_ports.count') { should cmp 1 }
        its('internal_ports')       { should include 80 }
      end
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_elbs.where( <property>: <value>) do
      it { should exist }
    end

    describe aws_elbs.where( <property>: <value>) do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `elasticloadbalancing:DescribeLoadBalancers` action set to Allow.

You can find detailed documentation at [Authentication and Access Control for Your Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/load-balancer-authentication-access-control.html)
