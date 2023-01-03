### Setting the Environment Variables

The following instructions helps you get your development environment setup to run DB resource integration tests.

Copy `.envrc-example` to `.envrc` in projects root directory and uncomment the WORKSPACE and ATTRIBUTES_FILE line.

### Starting an Environment

First, ensure your system has [Terraform](https://www.terraform.io/intro/getting-started/install.html) installed.

This environment may be used to run your DB resource profile against or to run integration tests on it.

### Sourece .envrc

`source .envrc`

### Login to aws console

`saml2aws login`

### Rake Commands

Creating a new environment:

```shell
rake tf:init
rake tf:apply
```

Checking if your state has diverged from your plan:

```shell
rake tf:plan
```

Updating a running environment (For example, when you change the .tf file):

```shell
rake tf:apply
```

To run DB resource integration test:

```shell
rake test:dbintegration
```

Destroying your environment:

```shell
rake tf:destroy
```
