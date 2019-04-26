# Integration Testing with InSpec

## Introduction

Chef InSpec uses Test Kitchen for its integration testing. Our current testing uses Docker as our backend. You should install and have Docker running befor you run any tests.

### How to run specific integrations

To run a specific integration test use the following:

```bash
bundle exec rake test:integration[OS_NAME]
```

Example:
```bash
bundle exec rake test:integration[default-ubuntu-1604]
```

# Chef InSpec Integrations

### Test Kitchen

We run the test/integration/default profile at the end of each integration test in the verify stage. This confirms that our current code is compatible with test kitchen.

### Audit Testing

For Audit cookbook testing Chef InSpec sets up some special hooks. The integration rake command will bundle up the current checkout into a gem which is passed along to test kitchen in the os_prepare cookbook. When this cookbook is run it will install the local inspec gem. Audit will then use this gem accordingly when running in the post chef-client validators. The .kitchen.yml is setup to export the audit report to a json file which we look for and confirm the structure in the test/integration/default/controls/audit_spec.rb file.

In the validation file we confirm that the file was created from audit and that the structure looks correct. We also validate that the inspec ran with audit is the same that the current branch is using. This validates that audit did not use a older version for some reason.
