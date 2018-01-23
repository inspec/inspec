# InSpec for AWS

## Roadmap

This repository is the development repository for InSpec for AWS. Once [RFC Platforms](https://github.com/chef/inspec/issues/1661) is fully implemented in InSpec, this repository is going to be merged into core InSpec.

As of now, AWS resources are implemented as an InSpec resource pack. It will ship with the required resources to write your own AWS tests.

```
├── README.md - this readme
└── libraries - contains AWS resources
```

## Get started

Before running the profile with InSpec, define environment variables with your AWS region and credentials.  InSpec supports the following standard AWS variables:

- `AWS_REGION`
- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN` (optional)

Those variables are defined in [AWS CLI Docs](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment)

## Use the resources

Since this is a InSpec resource pack, it only defines InSpec resources. It includes example tests only. You can easily use the AWS InSpec resources in your tests do the following:

### Create a new profile

```
inspec init profile my-profile
```

### Adapt the `inspec.yml`

```
name: my-profile
title: My own AWS profile
version: 0.1.0
depends:
  - name: aws
    url: https://github.com/chef/inspec-aws/archive/master.tar.gz
```

### Add controls

Since your profile depends on the resource pack, you can use those resources in your own profile:

```
control "aws-1" do
  impact 0.7
  title 'Checks the machine is running'

  describe aws_ec2_instance('my-ec2-machine') do
    it { should be_running }
  end
end
```

### Running your profile

Then use `inspec exec my-profile` to execute your new profile.

Our future intent is to support an `aws` target for InSpec/Train, so you may also pass credentials `inspec exec my-profile -t aws://accesskey:secret@region`.  

* See [train/issues/229](https://github.com/chef/train/issues/229).

### Available Resources

 * `aws_ec2_instance` - This resource reads information about an ec2 instance
 * `aws_iam_access_key` - Verifies settings for AWS IAM access keys
 * `aws_iam_password_policy` - Verifies iam password policy
 * `aws_iam_root_user` - Verifies settings for AWS root account
 * `aws_iam_user` - Verifies settings for a specific AWS IAM user
 * `aws_iam_users` - Verifies settings for AWS IAM users

### Roadmap

 * `aws_ami`
 * `aws_s3bucket`
 * `aws_security_group`
 * `aws_iam_group`
 * `aws_iam_policy`
 * `aws_iam_role`

## Developing and Testing the AWS Resources Pack

### Unit tests

To execute the unit tests, run:

```
bundle exec rake test
```

### Integration tests

Please see TESTING_AGAINST_AWS.md for details on how to setup the needed AWS accounts to perform testing.

## Kudos

This project was inspired by [inspec-aws](https://github.com/arothian/inspec-aws) from [arothian](https://github.com/arothian).

## License

|  |  |
| ------ | --- |
| **Author:** | Christoph Hartmann (<chris@lollyrock.com>) |
| **Copyright:** | Copyright (c) 2017 Chef Software Inc. |
| **License:** | Apache License, Version 2.0 |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
