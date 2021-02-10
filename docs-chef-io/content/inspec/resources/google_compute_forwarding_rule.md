+++
title = "google_compute_forwarding_rule resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_forwarding_rule"
    identifier = "inspec/resources/gcp/google_compute_forwarding_rule.md google_compute_forwarding_rule resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_forwarding_rule` is used to test a Google ForwardingRule resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby

describe google_compute_forwarding_rule(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'udp-forwarding-rule') do
  it { should exist }
  its('region') { should match 'europe-west2' }
  its('creation_timestamp') { should be > Time.now - 365*60*60*24*10 }
  its('load_balancing_scheme') { should match 'EXTERNAL' }
  its('port_range') { should match "500-500" }
  its('ip_protocol') { should match "UDP" }
end

describe google_compute_forwarding_rule(project: 'chef-gcp-inspec', region: 'europe-west2', name: "nonexistent") do
  it { should_not exist }
end
```

### Test that a GCP compute forwarding_rule exists

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      it { should exist }
    end

### Test when a GCP compute forwarding_rule was created

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected forwarding_rule identifier

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('id') { should eq 12345567789 }
    end

### Test that a forwarding_rule load_balancing_scheme is as expected

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('load_balancing_scheme') { should eq "INTERNAL" }
    end

### Test that a forwarding_rule IP address is as expected

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('ip_address') { should eq "10.0.0.1" }
    end

### Test that a forwarding_rule is associated with the expected network

    describe google_compute_forwarding_rule(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-forwarding_rule') do
      its('network') { should match "gcp_network_name" }
    end

## Properties

Properties that can be accessed from the `google_compute_forwarding_rule` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`is_mirroring_collector`
: (Beta only) Indicates whether or not this load balancer can be used as a collector for packet mirroring. To prevent mirroring loops, instances behind this load balancer will not have their traffic mirrored even if a PacketMirroring rule applies to them. This can only be set to true for load balancers that have their loadBalancingScheme set to INTERNAL.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource.

`ip_address`
: The IP address that this forwarding rule is serving on behalf of. Addresses are restricted based on the forwarding rule's load balancing scheme (EXTERNAL or INTERNAL) and scope (global or regional). When the load balancing scheme is EXTERNAL, for global forwarding rules, the address must be a global IP, and for regional forwarding rules, the address must live in the same region as the forwarding rule. If this field is empty, an ephemeral IPv4 address from the same scope (global or regional) will be assigned. A regional forwarding rule supports IPv4 only. A global forwarding rule supports either IPv4 or IPv6. When the load balancing scheme is INTERNAL, this can only be an RFC 1918 IP address belonging to the network/subnet configured for the forwarding rule. By default, if this field is empty, an ephemeral internal IP address will be automatically allocated from the IP range of the subnet or network configured for this forwarding rule. An address can be specified either by a literal IP address or a URL reference to an existing Address resource. The following examples are all valid:

  - 100.1.2.3
  - https://www.googleapis.com/compute/v1/projects/project/regions/
  - region/addresses/address
  - projects/project/regions/region/addresses/address
  - regions/region/addresses/address
  - global/addresses/address
  - address

`ip_protocol`
: The IP protocol to which this rule applies. When the load balancing scheme is INTERNAL, only TCP and UDP are valid.

  Possible values:

  - TCP
  - UDP
  - ESP
  - AH
  - SCTP
  - ICMP

`backend_service`
: A BackendService to receive the matched traffic. This is used only for INTERNAL load balancing.

`load_balancing_scheme`
: This signifies what the ForwardingRule will be used for and can be EXTERNAL, INTERNAL, or INTERNAL_MANAGED. EXTERNAL is used for Classic Cloud VPN gateways, protocol forwarding to VMs from an external IP address, and HTTP(S), SSL Proxy, TCP Proxy, and Network TCP/UDP load balancers. INTERNAL is used for protocol forwarding to VMs from an internal IP address, and internal TCP/UDP load balancers. INTERNAL_MANAGED is used for internal HTTP(S) load balancers.

  Possible values:

  - EXTERNAL
  - INTERNAL
  - INTERNAL_MANAGED

`name`
: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`network`
: For internal load balancing, this field identifies the network that the load balanced IP should belong to for this Forwarding Rule. If this field is not specified, the default network will be used. This field is only used for INTERNAL load balancing.

`port_range`
: This field is used along with the target field for TargetHttpProxy, TargetHttpsProxy, TargetSslProxy, TargetTcpProxy, TargetVpnGateway, TargetPool, TargetInstance. Applicable only when IPProtocol is TCP, UDP, or SCTP, only packets addressed to ports in the specified range will be forwarded to target. Forwarding rules with the same `[IPAddress, IPProtocol]` pair must have disjoint port ranges. Some types of forwarding target have constraints on the acceptable ports:
  - TargetHttpProxy: 80, 8080
  - TargetHttpsProxy: 443
  - TargetTcpProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995, 1883, 5222
  - TargetSslProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995, 1883, 5222
  - TargetVpnGateway: 500, 4500

`ports`
: This field is used along with the backend_service field for internal load balancing. When the load balancing scheme is INTERNAL, a single port or a comma separated list of ports can be configured. Only packets addressed to these ports will be forwarded to the backends configured with this forwarding rule. You may specify a maximum of up to 5 ports.

`subnetwork`
: The subnetwork that the load balanced IP should belong to for this Forwarding Rule. This field is only used for INTERNAL load balancing. If the network specified is in auto subnet mode, this field is optional. However, if the network is in custom subnet mode, a subnetwork must be specified.

`target`
: The URL of the target resource to receive the matched traffic. The target must live in the same region as the forwarding rule. The forwarded traffic must be of a type appropriate to the target object.

`allow_global_access`
: If true, clients can access ILB from all regions. Otherwise only allows from the local region the ILB is located at.

`labels`
: (Beta only) Labels to apply to this forwarding rule. A list of key->value pairs.

`label_fingerprint`
: (Beta only) The fingerprint used for optimistic locking of this resource. Used internally during updates.

`all_ports`
: For internal TCP/UDP load balancing (i.e. load balancing scheme is INTERNAL and protocol is TCP/UDP), set this to true to allow packets addressed to any ports to be forwarded to the backends configured with this forwarding rule. Used with backend service. Cannot be set if port or portRange are set.

`network_tier`
: The networking tier used for configuring this address. If this field is not specified, it is assumed to be PREMIUM.

  Possible values:

  - PREMIUM
  - STANDARD

`service_label`
: An optional prefix to the service name for this Forwarding Rule. If specified, will be the first label of the fully qualified service name. The label must be 1-63 characters long, and comply with RFC1035. Specifically, the label must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. This field is only used for INTERNAL load balancing.

`service_name`
: The internal fully qualified service name for this Forwarding Rule. This field is only used for INTERNAL load balancing.

`region`
: A reference to the region where the regional forwarding rule resides. This field is not applicable to global forwarding rules.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
