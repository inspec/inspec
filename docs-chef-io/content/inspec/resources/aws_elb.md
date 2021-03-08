+++
title = "aws_elb resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_elb"
    identifier = "inspec/resources/aws/aws_elb.md aws_elb resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_elb` InSpec audit resource to test properties of a single AWS Elastic Load Balancer (ELB).

## Syntax

An `aws_elb` resource block declares the tests for a single AWS ELB by ELB name. AWS ELB Names are unique per region.

    describe aws_elb('my-elb') do
      it { should exist }
    end

    describe aws_elb(load_balancer_name: 'my-elb') do
      it { should exist }
    end

## Parameters

### load_balancer_name _(required)_

This resource accepts a single parameter, the ELB Name which uniquely identifies the ELB.
This can be passed either as a string or as a `load_balancer_name: 'value'` key-value entry in a hash.

See also the [AWS documentation on Elastic Load Balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference).

## Properties

| Property           | Description                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------------------- |
| load_balancer_name | The name of the load balancer.                                                                          |
| dns_name           | The DNS name of the load balancer.                                                                      |
| availability_zones | The Availability Zones for the load balancer.                                                           |
| instance_ids       | An array containing all instance ids associated with the ELB.                                           |
| external_ports     | An array of the external ports exposed on the ELB.                                                      |
| internal_ports     | An array of the internal ports exposed on the ELB.                                                      |
| security_group_ids | The security groups for the load balancer. Valid only for load balancers in a VPC.                      |
| vpc_id             | The ID of the VPC for the load balancer.                                                                |
| subnet_ids         | The IDs of the subnets for the load balancer.                                                           |
| listeners          | A collection of the listeners for the load balancer.                                                    |
| ssl_policies       | A collection of the SSL Policies configured in-use for the load balancer (and their policy attributes). |
| protocols          | A list of the protocols configured for the listeners of the load balancer.                              |

## Examples

### Test that an ELB has its availability zones configured correctly

    describe aws_elb('prod_web_app_elb') do
      its('availability_zones.count') { should be > 1 }
      its('availability_zones')       { should include 'us-east-2a' }
      its('availability_zones')       { should include 'us-east-2b' }
    end

### Ensure an ELB has the correct number of EC2 Instances associated with it

    describe aws_elb('prod_web_app_elb') do
      its('instance_ids.count') { should cmp 3 }
    end

### Ensure the correct DNS is set

    describe aws_elb('prod_web_app_elb') do
      its('dns_name') { should cmp 'your-fqdn.com' }
    end

### Ensure we only expose port 80, both to the public and internal

    describe aws_elb('prod_web_app_elb') do
      its('external_ports.count') { should cmp 1 }
      its('external_ports')       { should include 80 }
      its('internal_ports.count') { should cmp 1 }
      its('internal_ports')       { should include 80 }
    end

### Ensure the correct EC2 Instances are associated

    describe aws_elb('prod_web_app_elb') do
      its('instance_ids') { should include 'i-12345678' }
    end

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](/inspec/matchers/).

### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_elb('AnExistingELB') do
      it { should exist }
    end

    describe aws_elb('ANonExistentELB') do
      it { should_not exist }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `elasticloadbalancing:DescribeLoadBalancers` action set to Allow.

You can find detailed documentation at [Authentication and Access Control for Your Load Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/load-balancer-authentication-access-control.html)
