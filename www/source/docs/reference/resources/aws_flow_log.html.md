---
title: About the aws_flow_log Resource
platform: aws
---

# aws\_flow\_log

Use the `aws_flow_log` InSpec audit resource to test properties of a single Flow Log.

## Syntax

    describe aws_flow_log(flow_log_id: 'fl-9c718cf5') do
      it { should exist }
    end
    
#### Parameters

This resource requires at least one of the following parameters to be provided: `flow_log_id`, `subnet_id`, `vpc_id`.

##### flow\_log\_id _(required if no other parameters provided)_

The Flow Log ID which uniquely identifies the Flow Log. 
This can be passed either as a string or as a `flow_log_id: 'value'` key-value entry in a hash.

##### subnet\_id _(required if no other parameters provided)_

The subnet associated with the Flow Log, if applicable. 
This must be passed as a `subnet_id: 'value'` key-value entry in a hash.

##### vpc\_id _(required if no other parameters provided)_

The VPC associated with the Flow Log, if applicable. 
This must be passed as a `vpc_id: 'value'` key-value entry in a hash.

See also the [AWS documentation on Flow Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html).

## Properties

|Property         | Description|
| ---             | --- |
|flow\_log\_id    | The ID of the Flow Log. |
|log\_group\_name | The name of the associated log group. |
|resource\_id     | The ID of the assosiated resource, e.g. VPC, Subnet or Network Interface. |

## Examples

##### Search for a flow log by the associated subnet id
    describe aws_flow_log(subnet_id: 'subnet-c6a4319c') do
      it { should exist }
    end

##### Search for a flow log by the associated VPC id
    describe aws_flow_log(vpc_id: 'vpc-96cabaef') do
      it { should exist }
    end

##### Ensure the correct Flow Log is associated with a Subnet
    describe aws_flow_log(subnet_id: 'subnet-c6a4319c') do
      its('flow_log_id') { should cmp 'fl-9c718cf5' }
    end


### Ensure the Flow Log is associated with the correct resource type
    describe aws_flow_log('fl-9c718cf5') do
      its('resource_type') { should cmp 'subnet' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist
The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

    describe aws_flow_log('AnExistingFlowLog') do
      it { should exist }
    end

    describe aws_flow_log('ANonExistentFlowLog') do
      it { should_not exist }
    end


#### be\_attached\_to\_eni

Indicates that the Flow Log is attached to a ENI resource.

    describe aws_flow_log('fl-9c718cf5') do
      it { should be_attached_to_eni }
    end

#### be\_attached\_to\_subnet

Indicates that the Flow Log is attached to a subnet resource.

    describe aws_flow_log('fl-9c718cf5') do
      it { should be_attached_to_subnet }
    end

#### be\_attached\_to\_vpc

Indicates that the Flow Log is attached to a vpc resource.

    describe aws_flow_log('fl-9c718cf5') do
      it { should be_attached_to_vpc }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeFlowLogs` actions with Effect set to Allow.  
