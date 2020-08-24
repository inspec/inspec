# Integration Testing with InSpec

## Introduction

Chef InSpec uses Test Kitchen for its integration testing. Our current testing uses Docker (kitchen-dokken) as our backend. You should install and have Docker running before you run any tests.

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

### Why no audit cookbook testing?

Audit cookbook testing is handled in the audit cookbook repo. In addition, the audit cookbook restricts which InSpec gem can be installed, forcing the installation from Rubygems for Chef clients 15+. Since we need to test with the from-source inspec gem, we can't use that approach. Instead, we don't test using audit cookbook here.
