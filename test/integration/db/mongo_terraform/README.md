### Setting the Environment Variables

The following instructions helps you get your development environment setup to run DB resource integration tests.

Copy `.envrc-example` to `.envrc` in projects root directory and uncomment the WORKSPACE and ATTRIBUTES_FILE line.

### Starting an Environment

First, ensure your system has [Terraform](https://www.terraform.io/intro/getting-started/install.html) installed.

This environment may be used to run your DB resource profile against or to run integration tests on it.

### Aws access

Make sure you are logged in to aws using aws cli and ~/.aws/credentials is set.

### Sourece .envrc

`source .envrc`

### Login to aws console

`saml2aws login`

### Rake Commands

Creating a new environment:

```shell
rake dbintegration_tf:init[mongodb]
```

Checking if your state has diverged from your plan:

```shell
rake dbintegration_tf:plan[mongodb]
```

Updating a running environment (For example, when you change the .tf file):

```shell
rake dbintegration_tf:apply[mongodb]
```

To run DB resource integration test:

```shell
rake dbintegration_tf:test[mongodb]
```

Destroying your environment:

```shell
rake dbintegration_tf:destroy[mongodb]
```

### To resolve VpcLimitExceeded: The maximum number of VPCs has been reached.

Make sure you have set aws region and subnet in variables.tf. If the given region exceeds the VPC limit then you will come across the VPCLimitExceeded error.