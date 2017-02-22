# InSpec AWS Resource Pack

NOTE: This is early access and not suitable for production. We use this repository to prototype and verify our design goals.

This resource pack provides resources for AWS. It will ship with the required resources to write your own AWS tests.

```
├── README.md - this readme
├── controls - contains no controls
└── libraries - contains AWS resources
```

## Design Goals

Goals for this project are:

- Find the right abstraction layer for AWS
- InSpec AWS resources should be aware that they target AWS
- No mixture of InSpec OS and InSpec AWS resource in one profile possible
- AWS should become a native target for InSpec `inspec exec inspec-aws -t aws://accesskey:secret@region`

This project will be merged into [InSpec](https://github.com/chef/inspec), once we reached all the goals.

## Get started

To run the profile, use InSpec with an environment variable for AWS credentials:

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

Those variables are defined in [AWS CLI Docs](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment)

Now you can use `inspec exec inspec-aws`. Please note, that you have to define the AWS target in future: `inspec exec inspec-aws -t aws://accesskey:secret@region`.

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

  describe ec2('my-ec2-machine') do
    it { should be_running }
  end
end
```

### Available Resources

 * `aws_ec2` - This resource reads information about an ec2 instance

### Roadmap

 * `aws_ami`
 * `aws_s3bucket`
 * `aws_security_group`
 * `aws_iam_group`
 * `aws_iam_policy`
 * `aws_iam_role`
 * `aws_iam_user`
 ...


## Tests

### Unit tests

To execute the unit tests, run:

```
bundle exec rake test
```

### Integration tests

To run the integration tests, please make sure all required environment variables like `AWS_ACCESS_KEY_ID`
, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION` are set properly. (`AWS_DEFAULT_REGION` **must** be set to **us-east-1** when running the integration tests.) We use terraform to create the AWS setup and InSpec to verify the all aspects. Integration tests can be executed via:

```
bundle exec rake test:integration
```

This task sets up test AWS resources, runs the integration tests, and then cleans up the resources.  To perform these tasks independently, please call them individually:

* `bundle exec rake test:setup_integration_tests`
* `bundle exec rake test:run_integration_tests`
* `bundle exec rake test:cleanup_integration_tests`

## Kudos

This project was inspired by [inspec-aws](https://github.com/arothian/inspec-aws) from [arothian](https://github.com/arothian).

## License

|  |  |
| ------ | --- |
| **Author:** | Christoph Hartmann (<chartmann@chef.io>) |
| **Copyright:** | Copyright (c) 2016 Chef Software Inc. |
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
