+++
title = "google_dns_managed_zones resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_dns_managed_zones"
    identifier = "inspec/resources/gcp/google_dns_managed_zones.md google_dns_managed_zones resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_dns_managed_zones` is used to test a Google ManagedZone resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_dns_managed_zones(project: 'chef-gcp-inspec') do
  it { should exist }
  its('zone_names') { should include 'example-zone' }
  its('zone_dns_names') { should include 'dns-zone-name.com.' }
end
```

### Test that there are no more than a specified number of zones available for the project

    describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected, named managed zone is available for the project

    describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
      its('zone_names') { should include "zone-name" }
    end

### Test that a subset of all zones matching "myzone\*" exist

    google_dns_managed_zones(project: 'chef-inspec-gcp').where(zone_name: /^myzone/).zone_names.each do |zone_name|
      describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
      end
    end

## Properties

Properties that can be accessed from the `google_dns_managed_zones` resource:

See the [google_dns_managed_zone](/inspec/resources/google_dns_managed_zone/#properties) resource for more information.

`descriptions`
: an array of `google_dns_managed_zone` description

`zone_dns_names`
: an array of `google_dns_managed_zone` dns_name

`dnssec_configs`
: an array of `google_dns_managed_zone` dnssec_config

`zone_ids`
: an array of `google_dns_managed_zone` id

`zone_names`
: an array of `google_dns_managed_zone` name

`name_servers`
: an array of `google_dns_managed_zone` name_servers

`name_server_sets`
: an array of `google_dns_managed_zone` name_server_set

`creation_times`
: an array of `google_dns_managed_zone` creation_time

`labels`
: an array of `google_dns_managed_zone` labels

`visibilities`
: an array of `google_dns_managed_zone` visibility

`private_visibility_configs`
: an array of `google_dns_managed_zone` private_visibility_config

`forwarding_configs`
: (Beta only) an array of `google_dns_managed_zone` forwarding_config

`peering_configs`
: (Beta only) an array of `google_dns_managed_zone` peering_config

`reverse_lookups`
: (Beta only) an array of `google_dns_managed_zone` reverse_lookup

`service_directory_configs`
: (Beta only) an array of `google_dns_managed_zone` service_directory_config

## Filter Criteria

This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
