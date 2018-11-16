# Example InSpec Profile For AWS

This example shows the implementation of an InSpec profile for AWS.

##  Create a profile 

```
$ inspec init profile --platform aws aws-security
Create new profile at /Users/liamcaproni/aws-security
 * Create directory libraries
 * Create file README.md
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create file attributes.yml
 * Create file libraries/.gitkeep 
 
```

## Update `attributes.yml` to point to your custom VPC

```
aws_vpc_id: 'custom-vpc-id'
```

## Run the tests

```
$ cd aws-profile/
$ inspec exec -t aws://eu-west-1/test-iam-profile  --attrs attributes.yml aws-security

Profile: InSpec Profile (aws-security)
Version: 0.1.0
Target:  aws://eu-west-2

  ✔  aws-vpc-check: Check to see if custom VPC exists.
     ✔  VPC vpc-0014dad216b7664e3 should exist
  ✔  aws-vpcs-check: Check in all the VPCs for default sg not allowing 22 inwards
     ✔  EC2 Security Group sg-05cd285a7499ee2bf should allow in {:port=>22}
     ✔  EC2 Security Group sg-0f0faf6d01eafc65d should allow in {:port=>22}
     ✔  EC2 Security Group sg-0cb134808cb42f188 should allow in {:port=>22}
     ✔  EC2 Security Group sg-06b2ae6dea43e32b6 should allow in {:port=>22}
     ✔  EC2 Security Group sg-0fc81264868480768 should allow in {:port=>22}
     ✔  EC2 Security Group sg-0cc3c94d414fdcd1b should allow in {:port=>22}
     ✔  EC2 Security Group sg-0abe7f61 should allow in {:port=>22}
     ✔  EC2 Security Group sg-0f346bed179f1e6ad should allow in {:port=>22}
     ✔  EC2 Security Group sg-0ff737c3be7a370ab should allow in {:port=>22}
     ✔  EC2 Security Group sg-0f37838285d37d035 should allow in {:port=>22}
     ✔  EC2 Security Group sg-001651d64991000f7 should allow in {:port=>22}




```