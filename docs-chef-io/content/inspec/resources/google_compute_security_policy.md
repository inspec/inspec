+++
title = "google_compute_security_policy resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_security_policy"
    identifier = "inspec/resources/gcp/google_compute_security_policy.md google_compute_security_policy resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_security_policy` is used to test a Google SecurityPolicy resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_security_policy(project: 'chef-gcp-inspec', name: 'sec-policy') do
  it { should exist }
  its('rules.size') { should cmp 2 }
  its('rules.first.priority') { should cmp '1000' }
  its('rules.first.match.config.src_ip_ranges.first') { should cmp '9.9.9.0/24' }
end

describe google_compute_security_policy(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_security_policy` resource:

`name`
: Name of the security policy.

`id`
: The unique identifier for the resource.

`rules`
: A list of rules that belong to this policy. There must always be a default rule (rule with priority 2147483647 and match "\*"). If no rules are provided when creating a security policy, a default rule with action "allow" will be added.

`description`
: A description of the rule.

`priority`
: An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.

`action`
: The Action to preform when the client connection triggers the rule. Can currently be either "allow" or "deny()" where valid values for status are 403, 404, and 502.

`preview`
: If set to true, the specified action is not enforced.

`match`
: A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced.

    `description`
    : A description of the rule.

    `expr`
    : User defined CEVAL expression. A CEVAL expression is used to specify match criteria such as origin.ip, source.region_code and contents in the request header.

      `expression`
      : Textual representation of an expression in Common Expression Language syntax.

      `title`
      : Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.

      `description`
      : Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.

      `location`
      : Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.

    `versioned_expr`
    : Preconfigured versioned expression. If this field is specified, config must also be specified. Available preconfigured expressions along with their requirements are: `SRC_IPS_V1` - must specify the corresponding srcIpRange field in config.

    `config`
    : The configuration options available when specifying versionedExpr. This field must be specified if versionedExpr is specified and cannot be specified if versionedExpr is not specified.

      `src_ip_ranges`
      : CIDR IP address range.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
