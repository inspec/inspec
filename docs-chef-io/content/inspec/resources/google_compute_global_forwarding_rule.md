+++
title = "google_compute_global_forwarding_rule resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_global_forwarding_rule"
    identifier = "inspec/resources/gcp/google_compute_global_forwarding_rule.md google_compute_global_forwarding_rule resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_global_forwarding_rule` is used to test a Google GlobalForwardingRule resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_global_forwarding_rule(project: 'chef-gcp-inspec', name: 'inspec-gcp-global-forwarding-rule') do
  it { should exist }
  its('port_range') { should eq '80-80' }
  its('target') { should  match /\/inspec-gcp-http-proxy$/ }
end

describe google_compute_global_forwarding_rule(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_global_forwarding_rule` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource.

`ip_address`
: The IP address that this forwarding rule is serving on behalf of. Addresses are restricted based on the forwarding rule's load balancing scheme (external or internal) and scope (global or regional). The address must be a global IP for external global forwarding rules. If this field is empty, an ephemeral IPv4 address from the same scope (global) is chosen. Global forwarding rules supports either IPv4 or IPv6. When the load balancing scheme is INTERNAL_SELF_MANAGED, this must be a URL reference to an existing Address resource (internal regional static IP address), with a purpose of GCE_END_POINT and addressType of INTERNAL. An address can be specified either by a literal IP address or a URL reference to an existing Address resource. The following examples are all valid:
  - 100.1.2.3
  - https://www.googleapis.com/compute/v1/projects/project/regions/
  - region/addresses/address
  - projects/project/regions/region/addresses/address
  - regions/region/addresses/address
  - global/addresses/address
  - address

`ip_protocol`
: The IP protocol to which this rule applies. When the load balancing scheme is INTERNAL_SELF_MANAGED, only TCP is valid.

  Possible values:

  - TCP
  - UDP
  - ESP
  - AH
  - SCTP
  - ICMP


`ip_version`
: The IP Version that will be used by this global forwarding rule.

  Possible values:

  - IPV4
  - IPV6


`labels`
: (Beta only) Labels to apply to this forwarding rule. A list of key->value pairs.

`label_fingerprint`
: (Beta only) The fingerprint used for optimistic locking of this resource. Used internally during updates.

`load_balancing_scheme`
: This signifies what the GlobalForwardingRule will be used for. The value of INTERNAL_SELF_MANAGED means that this will be used for Internal Global HTTP(S) LB. The value of EXTERNAL means that this will be used for External Global Load Balancing (HTTP(S) LB, External TCP/UDP LB, SSL Proxy) NOTE: Currently global forwarding rules cannot be used for INTERNAL load balancing.

  Possible values:

  - EXTERNAL
  - INTERNAL_SELF_MANAGED


`metadata_filters`
: Opaque filter criteria used by Loadbalancer to restrict routing configuration to a limited set xDS compliant clients. In their xDS requests to Loadbalancer, xDS clients present node metadata. If a match takes place, the relevant routing configuration is made available to those proxies. For each metadataFilter in this list, if its filterMatchCriteria is set to MATCH_ANY, at least one of the filterLabels must match the corresponding label provided in the metadata. If its filterMatchCriteria is set to MATCH_ALL, then all of its filterLabels must match with corresponding labels in the provided metadata. metadataFilters specified here can be overridden by those specified in the UrlMap that this ForwardingRule references. metadataFilters only applies to Loadbalancers that have their loadBalancingScheme set to INTERNAL_SELF_MANAGED.

  `filter_match_criteria`
  : Specifies how individual filterLabel matches within the list of filterLabels contribute towards the overall metadataFilter match.  MATCH_ANY - At least one of the filterLabels must have a matching label in the provided metadata. MATCH_ALL - All filterLabels must have matching labels in the provided metadata.

    Possible values:

    - MATCH_ANY
    - MATCH_ALL

  `filter_labels`
  : The list of label value pairs that must match labels in the provided metadata based on filterMatchCriteria  This list must not be empty and can have at the most 64 entries.

    `name`
    : Name of the metadata label. The length must be between 1 and 1024 characters, inclusive.

    `value`
    : The value that the label must match. The value has a maximum length of 1024 characters.

`name`
: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`network`
: This field is not used for external load balancing. For INTERNAL_SELF_MANAGED load balancing, this field identifies the network that the load balanced IP should belong to for this global forwarding rule. If this field is not specified, the default network will be used.

`port_range`
: This field is used along with the target field for TargetHttpProxy, TargetHttpsProxy, TargetSslProxy, TargetTcpProxy, TargetVpnGateway, TargetPool, TargetInstance. Applicable only when IPProtocol is TCP, UDP, or SCTP, only packets addressed to ports in the specified range will be forwarded to target. Forwarding rules with the same `[IPAddress, IPProtocol]` pair must have disjoint port ranges. Some types of forwarding target have constraints on the acceptable ports:
  - TargetHttpProxy: 80, 8080
  - TargetHttpsProxy: 443
  - TargetTcpProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995, 1883, 5222
  - TargetSslProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995, 1883, 5222
  - TargetVpnGateway: 500, 4500

`target`
: The URL of the target resource to receive the matched traffic. The forwarded traffic must be of a type appropriate to the target object. For INTERNAL_SELF_MANAGED load balancing, only HTTP and HTTPS targets are valid.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
