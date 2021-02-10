+++
title = "google_billing_project_billing_info resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_billing_project_billing_info"
    identifier = "inspec/resources/gcp/google_billing_project_billing_info.md google_billing_project_billing_info resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_billing_project_billing_info` is used to test a Google ProjectBillingInfo resource

## Examples

```ruby
describe google_billing_project_billing_info(project_id: 'chef-gcp-inspec') do
  it { should exist }

  its('billing_account_name') { should eq 'billingAccounts/012345-567890-ABCDEF' }
  its('billing_enabled') { should eq true }
end
```

## Properties

Properties that can be accessed from the `google_billing_project_billing_info` resource:

`project_id`
: The project id to retrieve billing info for.

`billing_account_name`
: The resource name of the billing account associated with the project, if any. For example, `billingAccounts/ 012345-567890-ABCDEF`.

`billing_enabled`
: True if the project is associated with an open billing account, to which usage on the project is charged. False if the project
is associated with a closed billing account, or no billing account at all, and therefore cannot use paid services.

## GCP Permissions
