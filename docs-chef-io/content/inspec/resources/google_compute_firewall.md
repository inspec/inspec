+++
title = "google_compute_firewall resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_firewall"
    identifier = "inspec/resources/gcp/google_compute_firewall.md google_compute_firewall resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_firewall` is used to test a Google Firewall resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_firewall(project: 'chef-gcp-inspec', name: 'inspec-gcp-firewall') do
  its('direction') { should cmp 'INGRESS' }
  its('log_config_enabled?') { should be true }
  its('source_tags') { should include 'some-tag' }
end
```

### Test that a GCP compute firewall allows SSH access on port 22

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_ssh?')  { should be true }
    end

### Test that a GCP compute firewall does not allow HTTP access on port 80

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_http?')  { should be false }
    end

### Test that a GCP compute firewall allows HTTPS access on port 443

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('allowed_https?')  { should be true }
    end

### Test the direction of a GCP compute firewall e.g. "INGRESS" or "EGRESS"

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('direction') { should eq "INGRESS" }
    end

### Test the source IP range list for the GCP compute firewall is not open to the world

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('source_ranges') { should_not eq ["0.0.0.0/0"] }
      # or using helpers
      its('direction') { should eq "INGRESS" }
      it { should_not allow_ip_ranges ["0.0.0.0/0"] }
    end

### Test whether or not a port/protocol is defined for a given firewall rule

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      # similar to the http  / ssh helpers above
      it { should_not allow_port_protocol("22", "tcp") }
      it { should allow_port_protocol("80", "tcp") }
    end

### Test whether firewall rule allows ingress/egress for specified tags

    describe google_compute_firewall(project: 'chef-inspec-gcp', name: 'firewall-rule') do
      its('direction') { should eq "INGRESS" }
      it { should allow_source_tags ["allow-gcp-tag"] }
      it { should allow_target_tags ["allow-gcp-other-tag"] }
      # stricter
      it { should allow_source_tags_only ["allow-gcp-tag"] }
      it { should allow_target_tags_only ["allow-gcp-other-tag"] }
    end

## Properties

Properties that can be accessed from the `google_compute_firewall` resource:

`allowed`
: The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection.

  `ip_protocol`
  : The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp, ipip), or the IP protocol number.

  `ports`
  : An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port.  Example inputs include: ["22"], ["80","443"], and ["12345-12349"].

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`denied`
: The list of DENY rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a denied connection.

  `ip_protocol`
  : The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp, ipip), or the IP protocol number.

  `ports`
  : An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port.  Example inputs include: ["22"], ["80","443"], and ["12345-12349"].

`description`
: An optional description of this resource. Provide this property when you create the resource.

`destination_ranges`
: If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format. Only IPv4 is supported.

`direction`
: Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, it is NOT supported to specify destinationRanges; For EGRESS traffic, it is NOT supported to specify sourceRanges OR sourceTags.

  Possible values:

  - INGRESS
  - EGRESS

`disabled`
: Denotes whether the firewall rule is disabled, i.e not applied to the network it is associated with. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled.

`log_config`
: This field denotes whether to enable logging for a particular firewall rule. If logging is enabled, logs will be exported to Stackdriver.

  `enable_logging`
  : This field denotes whether to enable logging for a particular firewall rule. If logging is enabled, logs will be exported to Stackdriver.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`network`
: URL of the network resource for this firewall rule. If not specified when creating a firewall rule, the default network is used: global/networks/default If you choose to specify this property, you can specify the network as a full or partial URL. For example, the following are all valid URLs: https://www.googleapis.com/compute/v1/projects/myproject/global/ networks/my-network projects/myproject/global/networks/my-network global/networks/default

`priority`
: Priority for this rule. This is an integer between 0 and 65535, both inclusive. When not specified, the value assumed is 1000. Relative priorities determine precedence of conflicting rules. Lower value of priority implies higher precedence (eg, a rule with priority 0 has higher precedence than a rule with priority 1). DENY rules take precedence over ALLOW rules having equal priority.

`source_ranges`
: If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. These ranges must be expressed in CIDR format. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply. Only IPv4 is supported.

`source_service_accounts`
: If source service accounts are specified, the firewall will apply only to traffic originating from an instance with a service account in this list. Source service accounts cannot be used to control traffic to an instance's external IP address because service accounts are associated with an instance, not an IP address. sourceRanges can be set at the same time as sourceServiceAccounts. If both are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP belongs to an instance with service account listed in sourceServiceAccount. The connection does not need to match both properties for the firewall to apply. sourceServiceAccounts cannot be used at the same time as sourceTags or targetTags.

`source_tags`
: If source tags are specified, the firewall will apply only to traffic with source IP that belongs to a tag listed in source tags. Source tags cannot be used to control traffic to an instance's external IP address. Because tags are associated with an instance, not an IP address. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply.

`target_service_accounts`
: A list of service accounts indicating sets of instances located in the network that may make network connections as specified in allowed. targetServiceAccounts cannot be used at the same time as targetTags or sourceTags. If neither targetServiceAccounts nor targetTags are specified, the firewall rule applies to all instances on the specified network.

`target_tags`
: A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed. If no targetTags are specified, the firewall rule applies to all instances on the specified network.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
