+++
title = "aws_lambda resource"
draft = false
gh_repo = "inspec"
platform = "aws"

[menu]
  [menu.inspec]
    title = "aws_lambda"
    identifier = "inspec/resources/aws/aws_lambda.md aws_lambda resource"
    parent = "inspec/resources/aws"
+++

Use the `aws_lambda` resource to test a specific lambda.

## Syntax

```ruby
describe aws_lambda do
  it { should exist}
  its ('handler') { should eq 'main.on_event'}
  its ('version') { should eq '$LATEST' }
  its ('runtime') { should eq 'python3.7' }
end
```

## Parameters

This resource expects the name of the function.

## Properties

All properties as defined by the [Aws::lambda::Types::GetFunctionResponse](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Lambda/Types/GetFunctionResponse.html)

## Examples

### tests that all lambdas with a particular tag is correctly deployed

```ruby
describe aws_lambda('my_new_lambda') do
    it { should exist}
    its ('handler') { should eq 'main.on_event'}
    its ('version') { should eq '$LATEST' }
    its ('runtime') { should eq 'python3.7' }
end
```

## Matchers

This InSpec audit resource uses the standard matchers. For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `lambda:GetFunction` action with Effect set to Allow.

You can find detailed documentation at [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html)
