# Example InSpec Profile For AWS

This example shows the implementation of an InSpec profile for AWS.

##  Create a profile 

```
$ inspec init profile --platform aws my-profile

 ─────────────────────────── InSpec Code Generator ───────────────────────────

Creating new profile at /Users/spaterson/my-profile
 • Creating directory libraries
 • Creating file README.md
 • Creating directory controls
 • Creating file controls/example.rb
 • Creating file inspec.yml
 • Creating file attributes.yml
 • Creating file libraries/.gitkeep
 
```

## Optionally update `attributes.yml` to point to your custom VPC

```
aws_vpc_id: 'custom-vpc-id'
```

The related control will simply be skipped if this is not provided.  See the [InSpec DSL documentation](https://www.inspec.io/docs/reference/dsl_inspec/) for more details on conditional execution using `only_if`.

## Run the tests

### With a VPC Identifier

With a supplied VPC identifier in `attributes.yml` both of the example controls will run.  The 'aws-single-vpc-exists-check' control will only check for a VPC identifier in the currently configured AWS SDK region e.g. `eu-west-2` in the below:

```
$ cd my-profile/
$ inspec exec . -t aws://  --attrs attributes.yml

Profile: AWS InSpec Profile (my-profile)
Version: 0.1.0
Target:  aws://eu-west-2

  ✔  aws-single-vpc-exists-check: Check to see if custom VPC exists.
     ✔  VPC vpc-1ea06476 should exist
  ✔  aws-vpcs-check: Check in all the VPCs for default sg not allowing 22 inwards
     ✔  EC2 Security Group sg-067cd21e928c3a2f1 should allow in {:port=>22}
     ✔  EC2 Security Group sg-9bb3b9f3 should allow in {:port=>22}
  ✔  aws-vpcs-multi-region-status-check: Check AWS VPCs in all regions have status "available"
     ✔  VPC vpc-6458b70d in eu-north-1 should exist
     ✔  VPC vpc-6458b70d in eu-north-1 should be available
     ✔  VPC vpc-8d1390e5 in ap-south-1 should exist
     ✔  VPC vpc-8d1390e5 in ap-south-1 should be available
     ✔  VPC vpc-07a71d6e in eu-west-3 should exist
     ✔  VPC vpc-07a71d6e in eu-west-3 should be available
     ✔  VPC vpc-021630e2e767412b5 in eu-west-2 should exist
     ✔  VPC vpc-021630e2e767412b5 in eu-west-2 should be available
     ✔  VPC vpc-1ea06476 in eu-west-2 should exist
     ✔  VPC vpc-1ea06476 in eu-west-2 should be available
     ✔  VPC vpc-169dee70 in eu-west-1 should exist
     ✔  VPC vpc-169dee70 in eu-west-1 should be available
     ✔  VPC vpc-01ac7ba0be447a1c4 in eu-west-1 should exist
     ✔  VPC vpc-01ac7ba0be447a1c4 in eu-west-1 should be available
     ✔  VPC vpc-09ff83d71da9d2b6e in eu-west-1 should exist
     ✔  VPC vpc-09ff83d71da9d2b6e in eu-west-1 should be available
     ✔  VPC vpc-0ebccac2337a90f13 in eu-west-1 should exist
     ✔  VPC vpc-0ebccac2337a90f13 in eu-west-1 should be available
     ✔  VPC vpc-c2a53da4 in eu-west-1 should exist
     ✔  VPC vpc-c2a53da4 in eu-west-1 should be available
     ✔  VPC vpc-4fb3f127 in ap-northeast-2 should exist
     ✔  VPC vpc-4fb3f127 in ap-northeast-2 should be available
     ✔  VPC vpc-0804856f in ap-northeast-1 should exist
     ✔  VPC vpc-0804856f in ap-northeast-1 should be available
     ✔  VPC vpc-ccb917ab in sa-east-1 should exist
     ✔  VPC vpc-ccb917ab in sa-east-1 should be available
     ✔  VPC vpc-0afcc60c70a30a615 in ca-central-1 should exist
     ✔  VPC vpc-0afcc60c70a30a615 in ca-central-1 should be available
     ✔  VPC vpc-20a25048 in ca-central-1 should exist
     ✔  VPC vpc-20a25048 in ca-central-1 should be available
     ✔  VPC vpc-5896143f in ap-southeast-1 should exist
     ✔  VPC vpc-5896143f in ap-southeast-1 should be available
     ✔  VPC vpc-47972220 in ap-southeast-2 should exist
     ✔  VPC vpc-47972220 in ap-southeast-2 should be available
     ✔  VPC vpc-071b6f0c69d1d0311 in eu-central-1 should exist
     ✔  VPC vpc-071b6f0c69d1d0311 in eu-central-1 should be available
     ✔  VPC vpc-807dfdeb in eu-central-1 should exist
     ✔  VPC vpc-807dfdeb in eu-central-1 should be available
     ✔  VPC vpc-0be54a71311bc362d in eu-central-1 should exist
     ✔  VPC vpc-0be54a71311bc362d in eu-central-1 should be available
     ✔  VPC vpc-f060cd8b in us-east-1 should exist
     ✔  VPC vpc-f060cd8b in us-east-1 should be available
     ✔  VPC vpc-0c3a7e116c58d714b in us-east-1 should exist
     ✔  VPC vpc-0c3a7e116c58d714b in us-east-1 should be available
     ✔  VPC vpc-047bff6c in us-east-2 should exist
     ✔  VPC vpc-047bff6c in us-east-2 should be available
     ✔  VPC vpc-93dd6ef4 in us-west-1 should exist
     ✔  VPC vpc-93dd6ef4 in us-west-1 should be available
     ✔  VPC vpc-2c0a6a55 in us-west-2 should exist
     ✔  VPC vpc-2c0a6a55 in us-west-2 should be available


Profile: Amazon Web Services  Resource Pack (inspec-aws)
Version: 0.1.0
Target:  aws://eu-west-2

     No tests executed.

Profile Summary: 3 successful controls, 0 control failures, 0 controls skipped
Test Summary: 53 successful, 0 failures, 0 skipped
```


### Without Supplying a VPC Identifier 

If no VPC identifier is supplied, the 'aws-single-vpc-exists-check' control is skipped and the other control runs.  The `attributes.yml` file does not have to be specified to InSpec in this case.

```
$ cd my-profile/
$ inspec exec . -t aws://  

Profile: AWS InSpec Profile (my-profile)
Version: 0.1.0
Target:  aws://eu-west-2

  ↺  aws-single-vpc-exists-check: Check to see if custom VPC exists.
     ↺  Skipped control due to only_if condition.
  ✔  aws-vpcs-check: Check in all the VPCs for default sg not allowing 22 inwards
     ✔  EC2 Security Group sg-067cd21e928c3a2f1 should allow in {:port=>22}
     ✔  EC2 Security Group sg-9bb3b9f3 should allow in {:port=>22}
  ✔  aws-vpcs-multi-region-status-check: Check AWS VPCs in all regions have status "available"
     ✔  VPC vpc-6458b70d in eu-north-1 should exist
     ✔  VPC vpc-6458b70d in eu-north-1 should be available
     ✔  VPC vpc-8d1390e5 in ap-south-1 should exist
     ✔  VPC vpc-8d1390e5 in ap-south-1 should be available
     ✔  VPC vpc-07a71d6e in eu-west-3 should exist
     ✔  VPC vpc-07a71d6e in eu-west-3 should be available
     ✔  VPC vpc-021630e2e767412b5 in eu-west-2 should exist
     ✔  VPC vpc-021630e2e767412b5 in eu-west-2 should be available
     ✔  VPC vpc-1ea06476 in eu-west-2 should exist
     ✔  VPC vpc-1ea06476 in eu-west-2 should be available
     ✔  VPC vpc-169dee70 in eu-west-1 should exist
     ✔  VPC vpc-169dee70 in eu-west-1 should be available
     ✔  VPC vpc-01ac7ba0be447a1c4 in eu-west-1 should exist
     ✔  VPC vpc-01ac7ba0be447a1c4 in eu-west-1 should be available
     ✔  VPC vpc-09ff83d71da9d2b6e in eu-west-1 should exist
     ✔  VPC vpc-09ff83d71da9d2b6e in eu-west-1 should be available
     ✔  VPC vpc-0ebccac2337a90f13 in eu-west-1 should exist
     ✔  VPC vpc-0ebccac2337a90f13 in eu-west-1 should be available
     ✔  VPC vpc-c2a53da4 in eu-west-1 should exist
     ✔  VPC vpc-c2a53da4 in eu-west-1 should be available
     ✔  VPC vpc-4fb3f127 in ap-northeast-2 should exist
     ✔  VPC vpc-4fb3f127 in ap-northeast-2 should be available
     ✔  VPC vpc-0804856f in ap-northeast-1 should exist
     ✔  VPC vpc-0804856f in ap-northeast-1 should be available
     ✔  VPC vpc-ccb917ab in sa-east-1 should exist
     ✔  VPC vpc-ccb917ab in sa-east-1 should be available
     ✔  VPC vpc-0afcc60c70a30a615 in ca-central-1 should exist
     ✔  VPC vpc-0afcc60c70a30a615 in ca-central-1 should be available
     ✔  VPC vpc-20a25048 in ca-central-1 should exist
     ✔  VPC vpc-20a25048 in ca-central-1 should be available
     ✔  VPC vpc-5896143f in ap-southeast-1 should exist
     ✔  VPC vpc-5896143f in ap-southeast-1 should be available
     ✔  VPC vpc-47972220 in ap-southeast-2 should exist
     ✔  VPC vpc-47972220 in ap-southeast-2 should be available
     ✔  VPC vpc-071b6f0c69d1d0311 in eu-central-1 should exist
     ✔  VPC vpc-071b6f0c69d1d0311 in eu-central-1 should be available
     ✔  VPC vpc-807dfdeb in eu-central-1 should exist
     ✔  VPC vpc-807dfdeb in eu-central-1 should be available
     ✔  VPC vpc-0be54a71311bc362d in eu-central-1 should exist
     ✔  VPC vpc-0be54a71311bc362d in eu-central-1 should be available
     ✔  VPC vpc-f060cd8b in us-east-1 should exist
     ✔  VPC vpc-f060cd8b in us-east-1 should be available
     ✔  VPC vpc-0c3a7e116c58d714b in us-east-1 should exist
     ✔  VPC vpc-0c3a7e116c58d714b in us-east-1 should be available
     ✔  VPC vpc-047bff6c in us-east-2 should exist
     ✔  VPC vpc-047bff6c in us-east-2 should be available
     ✔  VPC vpc-93dd6ef4 in us-west-1 should exist
     ✔  VPC vpc-93dd6ef4 in us-west-1 should be available
     ✔  VPC vpc-2c0a6a55 in us-west-2 should exist
     ✔  VPC vpc-2c0a6a55 in us-west-2 should be available


Profile: Amazon Web Services  Resource Pack (inspec-aws)
Version: 0.1.0
Target:  aws://eu-west-2

     No tests executed.

Profile Summary: 2 successful controls, 0 control failures, 1 control skipped
Test Summary: 52 successful, 0 failures, 1 skipped
```