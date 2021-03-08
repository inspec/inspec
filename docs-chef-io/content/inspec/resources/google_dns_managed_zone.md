+++
title = "google_dns_managed_zone resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dns_managed_zone"
    identifier = "inspec/resources/gcp/google_dns_managed_zone.md google_dns_managed_zone resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dns_managed_zone` is used to test a Google ManagedZone resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dns_managed_zone(project: 'chef-gcp-inspec', zone: 'example-zone') do
  it { should exist }
  its('dns_name') { should cmp 'dns-zone-name.com.' }

  its('description') { should cmp 'example description' }
  its('zone_signing_key_algorithm') { should cmp 'rsasha256' }
  its('key_signing_key_algorithm') { should cmp 'rsasha512' }
end

describe google_dns_managed_zone(project: 'chef-gcp-inspec', zone: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute zone exists

    describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: 'zone-name') do
      it { should exist }
    end

### Test that a GCP DNS managed zone has the expected DNS name

    describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: 'zone-name') do
      its('dns_name') { should match 'mydomain.com' }
    end

### Test that a GCP DNS managed zone has expected name server

    describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: 'zone-name') do
      its('name_servers') { should include 'ns-cloud-d1.googledomains.com.' }
    end

## Properties

Properties that can be accessed from the `google_dns_managed_zone` resource:

`description`
: A mutable string of at most 1024 characters associated with this resource for the user's convenience. Has no effect on the managed zone's function.

`dns_name`
: The DNS name of this managed zone, for instance "example.com.".

`dnssec_config`
: DNSSEC configuration

  `kind`
  : Identifies what kind of resource this is

  `non_existence`
  : Specifies the mechanism used to provide authenticated denial-of-existence responses. non_existence can only be updated when the state is `off`.

    Possible values:
    - nsec
    - nsec3

  `state`
  : Specifies whether DNSSEC is enabled, and what mode it is in

    Possible values:
    - off
    - on
    - transfer

  `default_key_specs`
  : Specifies parameters that will be used for generating initial DnsKeys for this ManagedZone. If you provide a spec for keySigning or zoneSigning, you must also provide one for the other. default_key_specs can only be updated when the state is `off`.

    `algorithm`
    : String mnemonic specifying the DNSSEC algorithm of this key

      Possible values:
      - ecdsap256sha256
      - ecdsap384sha384
      - rsasha1
      - rsasha256
      - rsasha512

    `key_length`
    : Length of the keys in bits

    `key_type`
    : Specifies whether this is a key signing key (KSK) or a zone signing key (ZSK). Key signing keys have the Secure Entry Point flag set and, when active, will only be used to sign resource record sets of type DNSKEY. Zone signing keys do not have the Secure Entry Point flag set and will be used to sign all other types of resource record sets.

      Possible values:
      - keySigning
      - zoneSigning

    `kind`
    : Identifies what kind of resource this is

`id`
: Unique identifier for the resource; defined by the server.

`name`
: User assigned name for this resource. Must be unique within the project.

`name_servers`
: Delegate your managed_zone to these virtual name servers; defined by the server

`name_server_set`
: Optionally specifies the NameServerSet for this ManagedZone. A NameServerSet is a set of DNS name servers that all host the same ManagedZones. Most users will leave this field unset.

`creation_time`
: The time that this resource was created on the server. This is in RFC3339 text format.

`labels`
: A set of key/value label pairs to assign to this ManagedZone.

`visibility`
: The zone's visibility: public zones are exposed to the Internet, while private zones are visible only to Virtual Private Cloud resources.

  Possible values:

  - private
  - public


`private_visibility_config`
: For privately visible zones, the set of Virtual Private Cloud resources that the zone is visible from.

  `networks`
  : The list of VPC networks that can see this zone.

    `network_url`
    : The fully qualified URL of the VPC network to bind to. This should be formatted like `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}`

`forwarding_config`
: (Beta only) The presence for this field indicates that outbound forwarding is enabled for this zone. The value of this field contains the set of destinations to forward to.

  `target_name_servers`
  : List of target name servers to forward to. Cloud DNS will select the best available name server if more than one target is given.

    `ipv4_address`
    : IPv4 address of a target name server.

    `forwarding_path`
    : Forwarding path for this TargetNameServer. If unset or `default` Cloud DNS will make forwarding decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go to the Internet. When set to `private`, Cloud DNS will always send queries through VPC for this target

      Possible values:
      - default
      - private

`peering_config`
: (Beta only) The presence of this field indicates that DNS Peering is enabled for this zone. The value of this field contains the network to peer with.

  `target_network`
  : The network with which to peer.

    `network_url`
    : The fully qualified URL of the VPC network to forward queries to. This should be formatted like `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}`

`reverse_lookup`
: (Beta only) Specifies if this is a managed reverse lookup zone. If true, Cloud DNS will resolve reverse lookup queries using automatically configured records for VPC resources. This only applies to networks listed under `private_visibility_config`.

`service_directory_config`
: (Beta only) The presence of this field indicates that this zone is backed by Service Directory. The value of this field contains information related to the namespace associated with the zone.

  `namespace`
  : The namespace associated with the zone.

    `namespace_url`
    : The fully qualified URL of the service directory namespace that should be associated with the zone. Ignored for `public` visibility zones.

## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
