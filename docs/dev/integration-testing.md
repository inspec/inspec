# Integration Testing with InSpec

## Introduction

Inspec uses Test Kitchen for its integration testing. You can access the integration tests through the `rake test:integration` command.

### How to run specific integrations

To run a specific integration test use the following:

`rake test:integration OS_NAME`

# Inspec Integrations

### Test Kitchen

We run the test/integration/default profile at the end of each integration test in the verify stage. This confirms that our current code is compatible with test kitchen.

### Audit Testing

For Audit cookbook testing InSpec sets up some special hooks. The integration rake command will bundle up the current checkout into a gem which is passed along to test kitchen in the os_prepare cookbook. When this cookbook is ran it will install the local inspec gem. Audit will then use this gem accordingly when running in the post chef-client validators. The .kitchen.yml is setup to export the audit report to a json file which we look for and confirm the structure in the test/integration/default/controls/audit_spec.rb file.

In the validation file we confirm that the file was created from audit and that the structure looks correct. We also validate that the inspec ran with audit is the same that the current branch is using. This validates that audit did not use a older version for some reason.

