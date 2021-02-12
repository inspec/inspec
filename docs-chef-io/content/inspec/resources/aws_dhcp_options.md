+++
title = "aws_dhcp_options resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_dhcp_options"
    identifier = "inspec/resources/aws/aws_dhcp_options.md aws_dhcp_options resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_dhcp_options` InSpec audit resource to test properties of a single AWS DHCP Options.

## Syntax

Ensure that an `aws_dhcp_options` exists

    describe aws_dhcp_options('dopt-0123456789abcdefg') do
      it { should exist }
    end

    describe aws_dhcp_options(dhcp_options_id: 'dopt-0123456789abcdefg') do
      it { should exist }
    end

## Parameters

### dhcp_options_id _(required)_

This resource accepts a single parameter, the DHCP Options ID which uniquely identifies the DHCP Options.
This can be passed either as a string or as a `dhcp_options_id: 'value'` key-value entry in a hash.

See also the [AWS documentation on EC2](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeDhcpOptions.html).

## Properties

| Property            | Description                                               |
| ------------------- | --------------------------------------------------------- |
| dhcp_configurations | The list of dhcp configurations                           |
| domain_name_servers | The list of domain name servers in the dhcp configuration |
| ntp_servers         | The list of ntp servers in the dhcp configuration         |
| tags                | The tags of the DHCP Options.                             |

### Test tags on the DHCP Options

    describe aws_dhcp_options('dopt-0123456789abcdefg') do
      its('tags') { should include(:Environment => 'env-name',
                                   :Name => 'dhcp-options-name')}
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:DescribeDhcpOptions` action with Effect set to Allow.

You can find detailed documentation at [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html).
