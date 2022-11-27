# Example InSpec Profile For AliCloud

This example shows the implementation of an InSpec profile for AliCloud.

The related control will simply be skipped if this is not provided.  See the [InSpec DSL documentation](https://docs.chef.io/inspec/dsl_inspec/) for more details on conditional execution using `only_if`.

## Run the test

```bash
$ cd my-alicloud-sample-profile/
$ inspec exec . -t alicloud://
```

```
Profile:   Ali Cloud InSpec Profile (my-alicloud-profile)
Version:   0.1.0
Target:    alicloud://ap-south-1
    ✔  ali-cloud-instances-1.0: Ensure AliCloud ECS Instances has correct attributes.
         ✔  AliCloud ECS Instances (All) is expected to exist
         ✔  AliCloud ECS Instances (All) entries.count is expected to be >= 1
Profile:   AliCloud Resource Pack (inspec-alicloud)
Version:   0.10.8
Target:    alicloud://ap-south-1
     No tests executed.
Profile Summary: 1 successful controls, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
```
