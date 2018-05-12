# Testing Against Azure - Integration Testing

## Problem Statement

We want to test Azure-related InSpec resource against Azure itself. This requires a test fixture in Azure to examine using InSpec.

## General Approach

We have a Terraform plan to set up and destroy test fixtures in Azure. When the environment is running we have a set of integration tests that may run against it.

Credentials are handled via a `~/.azure/credentials` file. Create a directory in your home directory called `.azure`. Then create a file called `credentials`. An example file is below:

```
[subscription_id]
client_id=
client_secret=
tenant_id=
```

Substitute `subscription_id` for your Azure subscription ID. Client ID and client secret can be obtained when you create your application account (instructions below).

Tenant ID can be obtained by logging into the Azure portal. Browse to the `Azure Active Directory` and click on `properties`. The `Directory ID` is your Tenant ID.

### Installing Terraform

Download [Terraform](https://www.terraform.io/downloads.html).  We require at least v0.10. To install and choose from multiple Terraform versions, consider using [tfenv](https://github.com/kamatama41/tfenv).

## Current Solution

We have registered an application to use for authentication. We use Terraform to create the needed resources that we run our tests against.

### Creating the Application account

1. Login to the Azure portal.
2. Click on `Azure Active Directory`.
3. Click on `APP registrations`.
4. Click on `New application registration`.
5. Fill in a name and a Sign-on URL. Select `Web app / API` from the `Application Type` drop down. Save your application.
6. Note your Application ID. This is your `client_id` above.
6. Click on `Settings`
7. Click on `Keys`
8. Create a new password. This value is your `client_secret` above.
9. Go to your subscription (click on `All Services` then subscriptions). Choose your subscription from that list.
11. Note your Subscription ID can be found here.
10. Click `Access Control (IAM)`
11. Click Add
13. Select the `contributor` role.
12. Select the application you just created and save.

## Running the integration tests
`INSPEC_TERRAFORM_ENVIRONMENT` should be set to a unique value for you to work against. See [Terraform Workspaces](https://www.terraform.io/docs/state/workspaces.html)

`AZURE_LOCATION` may be set to the region you'd prefer to test in. The default setting is "West Europe".

To run all Azure integration tests, run:

`INSPEC_TERRAFORM_ENVIRONMENT=$YOUR_WORKSPACE bundle exec rake test:azure`

If you are doing something which requires changing the Azure environment, e.g. developing a new Azure module you may want to have your environment running while you make changes.

`INSPEC_TERRAFORM_ENVIRONMENT=$YOUR_WORKSPACE bundle exec rake test:azure:setup`

After making any changes to Terraform. Apply your changes.

`INSPEC_TERRAFORM_ENVIRONMENT=$YOUR_WORKSPACE bundle exec rake test:azure:apply`

This will automatically regenerate your plan file and apply the changes.

When you are done, and wish to destroy your environment:

`INSPEC_TERRAFORM_ENVIRONMENT=$YOUR_WORKSPACE bundle exec rake test:azure:cleanup`
