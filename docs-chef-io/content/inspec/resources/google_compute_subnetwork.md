+++
title = "google_compute_subnetwork resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_subnetwork"
    identifier = "inspec/resources/gcp/google_compute_subnetwork.md google_compute_subnetwork resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_subnetwork` is used to test a Google Subnetwork resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_subnetwork(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-subnet') do
  it { should exist }
  its('ip_cidr_range') { should eq '10.2.0.0/16' }
  its('log_config.enable') { should be true }
  its('log_config.flow_sampling') { should cmp '0.5' }
  its('log_config.aggregation_interval') { should cmp 'INTERVAL_10_MIN' }
  its('log_config.metadata') { should include 'INCLUDE_ALL_METADATA' }
end

describe google_compute_subnetwork(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP compute subnetwork exists

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      it { should exist }
    end

### Test when a GCP compute subnetwork was created

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('creation_timestamp') { should be > Time.now - 365*60*60*24*10 }
    end

### Test for an expected subnetwork identifier

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('id') { should eq 12345567789 }
    end

### Test that a subnetwork gateway address is as expected

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('gateway_address') { should eq "10.2.0.1" }
    end

### Test that a subnetwork IP CIDR range is as expected

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('ip_cidr_range') { should eq "10.2.0.0/29" }
    end

### Test that a subnetwork is associated with the expected network

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('network') { should match "gcp_network_name" }
    end

### Test whether VMs in this subnet can access Google services without assigning external IP addresses through Private Google Access

    describe google_compute_subnetwork(project: 'chef-inspec-gcp', region: 'europe-west2', name: 'gcp-inspec-subnetwork') do
      its('private_ip_google_access') { should be false }
    end

## Properties

Properties that can be accessed from the `google_compute_subnetwork` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource. This field can be set only at resource creation time.

`gateway_address`
: The gateway address for default routes to reach destination addresses outside this subnetwork.

`id`
: The unique identifier for the resource.

`ip_cidr_range`
: The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported.

`name`
: The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`network`
: The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks.

`purpose`
: (Beta only) The purpose of the resource. This field can be either PRIVATE or INTERNAL_HTTPS_LOAD_BALANCER. A subnetwork with purpose set to INTERNAL_HTTPS_LOAD_BALANCER is a user-created subnetwork that is reserved for Internal HTTP(S) Load Balancing. If unspecified, the purpose defaults to PRIVATE. If set to INTERNAL_HTTPS_LOAD_BALANCER you must also set the role.

  Possible values:

  - INTERNAL_HTTPS_LOAD_BALANCER
  - PRIVATE

`role`
: (Beta only) The role of subnetwork. Currently, this field is only used when purpose = INTERNAL_HTTPS_LOAD_BALANCER. The value can be set to ACTIVE or BACKUP. An ACTIVE subnetwork is one that is currently being used for Internal HTTP(S) Load Balancing. A BACKUP subnetwork is one that is ready to be promoted to ACTIVE or is currently draining.

  Possible values:

  - ACTIVE
  - BACKUP

`secondary_ip_ranges`
: An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges.

`range_name`
: The name associated with this subnetwork secondary range, used when adding an alias IP range to a VM instance. The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the subnetwork.

`ip_cidr_range`
: The range of IP addresses belonging to this subnetwork secondary range. Provide this property when you create the subnetwork. Ranges must be unique and non-overlapping with all primary and secondary IP ranges within a network. Only IPv4 is supported.

`private_ip_google_access`
: When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access.

`region`
: URL of the GCP region for this subnetwork.

`log_config`
: Denotes the logging options for the subnetwork flow logs. If logging is enabled logs will be exported to Stackdriver. This field cannot be set if the `purpose` of this subnetwork is `INTERNAL_HTTPS_LOAD_BALANCER`

`enable`
: If logging is enabled for this subnetwork

`aggregation_interval`
: Can only be specified if VPC flow logging for this subnetwork is enabled. Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections. Default is an interval of 5 seconds per connection.

  Possible values:
  - INTERVAL_5_SEC
  - INTERVAL_30_SEC
  - INTERVAL_1_MIN
  - INTERVAL_5_MIN
  - INTERVAL_10_MIN
  - INTERVAL_15_MIN

`flow_sampling`
: Can only be specified if VPC flow logging for this subnetwork is enabled. The value of the field must be in [0, 1. Set the sampling rate of VPC flow logs within the subnetwork where 1.0 means all collected logs are reported and 0.0 means no logs are reported. Default is 0.5 which means half of all collected logs are reported.

`metadata`
: Can only be specified if VPC flow logging for this subnetwork is enabled. Configures whether metadata fields should be added to the reported VPC flow logs.

  Possible values:
  - EXCLUDE_ALL_METADATA
  - INCLUDE_ALL_METADATA

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
