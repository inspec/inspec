---
title: About the google_compute_global_forwarding_rule resource
platform: gcp
---

## Syntax
A `google_compute_global_forwarding_rule` is used to test a Google GlobalForwardingRule resource

## Examples
```
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

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: The unique identifier for the resource.

  * `ip_address`: The IP address that this forwarding rule is serving on behalf of.  Addresses are restricted based on the forwarding rule's load balancing scheme (EXTERNAL or INTERNAL) and scope (global or regional).  When the load balancing scheme is EXTERNAL, for global forwarding rules, the address must be a global IP, and for regional forwarding rules, the address must live in the same region as the forwarding rule. If this field is empty, an ephemeral IPv4 address from the same scope (global or regional) will be assigned. A regional forwarding rule supports IPv4 only. A global forwarding rule supports either IPv4 or IPv6.  When the load balancing scheme is INTERNAL, this can only be an RFC 1918 IP address belonging to the network/subnet configured for the forwarding rule. By default, if this field is empty, an ephemeral internal IP address will be automatically allocated from the IP range of the subnet or network configured for this forwarding rule.  An address can be specified either by a literal IP address or a URL reference to an existing Address resource. The following examples are all valid:  * 100.1.2.3 * https://www.googleapis.com/compute/v1/projects/project/regions/      region/addresses/address * projects/project/regions/region/addresses/address * regions/region/addresses/address * global/addresses/address * address

  * `ip_protocol`: The IP protocol to which this rule applies. Valid options are TCP, UDP, ESP, AH, SCTP or ICMP.  When the load balancing scheme is INTERNAL, only TCP and UDP are valid.

  * `backend_service`: A reference to a BackendService to receive the matched traffic.  This is used for internal load balancing. (not used for external load balancing)

  * `ip_version`: The IP Version that will be used by this forwarding rule. Valid options are IPV4 or IPV6. This can only be specified for a global forwarding rule.

  * `load_balancing_scheme`: This signifies what the ForwardingRule will be used for and can only take the following values: INTERNAL, EXTERNAL The value of INTERNAL means that this will be used for Internal Network Load Balancing (TCP, UDP). The value of EXTERNAL means that this will be used for External Load Balancing (HTTP(S) LB, External TCP/UDP LB, SSL Proxy)

  * `name`: Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `network`: For internal load balancing, this field identifies the network that the load balanced IP should belong to for this Forwarding Rule. If this field is not specified, the default network will be used.  This field is not used for external load balancing.

  * `port_range`: This field is used along with the target field for TargetHttpProxy, TargetHttpsProxy, TargetSslProxy, TargetTcpProxy, TargetVpnGateway, TargetPool, TargetInstance.  Applicable only when IPProtocol is TCP, UDP, or SCTP, only packets addressed to ports in the specified range will be forwarded to target. Forwarding rules with the same [IPAddress, IPProtocol] pair must have disjoint port ranges.  Some types of forwarding target have constraints on the acceptable ports:  * TargetHttpProxy: 80, 8080 * TargetHttpsProxy: 443 * TargetTcpProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995,                   1883, 5222 * TargetSslProxy: 25, 43, 110, 143, 195, 443, 465, 587, 700, 993, 995,                   1883, 5222 * TargetVpnGateway: 500, 4500

  * `ports`: This field is used along with the backend_service field for internal load balancing.  When the load balancing scheme is INTERNAL, a single port or a comma separated list of ports can be configured. Only packets addressed to these ports will be forwarded to the backends configured with this forwarding rule.  You may specify a maximum of up to 5 ports.

  * `subnetwork`: A reference to a subnetwork.  For internal load balancing, this field identifies the subnetwork that the load balanced IP should belong to for this Forwarding Rule.  If the network specified is in auto subnet mode, this field is optional. However, if the network is in custom subnet mode, a subnetwork must be specified.  This field is not used for external load balancing.

  * `region`: A reference to the region where the regional forwarding rule resides. This field is not applicable to global forwarding rules.

  * `target`: This target must be a global load balancing resource. The forwarded traffic must be of a type appropriate to the target object.  Valid types: HTTP_PROXY, HTTPS_PROXY, SSL_PROXY, TCP_PROXY
