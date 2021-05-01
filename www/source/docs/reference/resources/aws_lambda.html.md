---
title: About the aws_lambda Resource
platform: aws
---

# aws\_lambda

Use the `aws_lambda` resource to test a specific lambda.

## Syntax
````
    describe aws_lambda do
      it { should exist}    
      its ('handler') { should eq 'main.on_event'}
      its ('version') { should eq '$LATEST' }
      its ('runtime') { should eq 'python3.7' }
    end
````    
#### Parameters

This resource expects the name of the function.


## Propertie

All properties as defined by the [Aws::lambda::Types::GetFunctionResponse](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Lambda/Types/GetFunctionResponse.html)

## Examples


##### tests that all lambdas with a particular tag is correctly deployed
````
      
    describe aws_lambda('my_new_lambda') do
        it { should exist}    
        its ('handler') { should eq 'main.on_event'}
        its ('version') { should eq '$LATEST' }
        its ('runtime') { should eq 'python3.7' }
    end
  }

````

## Matchers

This InSpec audit resource uses the standard matchers.  For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).


## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `lambda:GetFunction` action with Effect set to Allow.

You can find detailed documentation at [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html)

