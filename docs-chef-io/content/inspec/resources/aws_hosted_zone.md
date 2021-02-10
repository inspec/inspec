+++
title = "aws_hosted_zone resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_hosted_zone"
    identifier = "inspec/resources/aws/aws_hosted_zone.md aws_hosted_zone resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_hosted_zone` resource to test a specific hosted zone configuration.

## Syntax

```ruby
describe aws_hosted_zone('zone-name') do
  it { should exist }
  its ('name_servers.count') { should eq 4 }
  its ('private_zone') { should be false }
  its ('record_names') { should include 'sid-james.carry-on.films.com' }
end
```

## Parameters

This resource takes one parameter, the name of the hosted zone to validate.

## Properties

| Property     | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| name         | The name of the hosted zone.                                                                     |
| id           | It's id.                                                                                         |
| name_servers | List of the associated name servers                                                              |
| private_zone | If the hosted zone if private or public                                                          |
| record_count | Number of associated records                                                                     |
| records      | The associated records, flattens the list, so each rule will have multiple records for each type |

## Examples

### Ensure a specific hosted zone exists

```ruby
describe aws_hosted_zone('zone-name') do
  it { should exist }
end
```

## Matchers

This InSpec audit resource has the following special matchers. For a full list
of available matchers, please visit our [matchers page](/inspec/matchers/).

### exist

The control will pass if the describe passes all tests.

Use `exist` to validate the hosted zone exists

```ruby
describe aws_hosted_zone('zone-name') do
  it { should exist }
end
```

Use `should_not` to test the entity should not exist.

```ruby
describe aws_hosted_zone('zone-name') do
  it { should_not exist }
end
```

### should

The control will pass if the describe passes all tests.

Use `should` to validate the hosted zone if public or private, the number of name
servers is correct or that a specific record exists e.g.

```ruby
describe aws_hosted_zone('zone-name') do
  it { should exist }
  its ('name_servers.count') { should eq 4 }
  its ('private_zone') { should be false }
  its ('record_names') { should include 'sid-james.carry-on.films.com' }
end
```

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal)
will need the `route53:ListHostedZones` action with Effect set to Allow.

You can find detailed documentation at
[Amazon Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/r53-api-permissions-ref.html)
