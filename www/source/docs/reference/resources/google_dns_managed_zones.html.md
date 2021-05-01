---
title: About the google_dns_managed_zones Resource
platform: gcp
---

# google\_dns\_managed\_zones

Use the `google_dns_managed_zones` InSpec audit resource to test properties of all, or a filtered group of, GCP DNS managed zones for a project.

<br>

## Syntax

A `google_dns_managed_zones` resource block collects GCP zones by project then tests that group.

    describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_dns_managed_zone`.

    google_dns_managed_zones(project: 'chef-inspec-gcp').zone_names.each do |zone_name|
      describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of zones available for the project

    describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
      its('count') { should be <= 100}
    end

### Test that an expected, named managed zone is available for the project

    describe google_dns_managed_zones(project: 'chef-inspec-gcp') do
      its('zone_names') { should include "zone-name" }
    end

### Test that a subset of all zones matching "myzone*" exist

    google_dns_managed_zones(project: 'chef-inspec-gcp').where(zone_name: /^myzone/).zone_names.each do |zone_name|
      describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: zone_name) do
        it { should exist }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `zone_id`; `zone_name`; `zone_dns_name` and `dnssec_enabled`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `zone_ids` - an array of google_dns_managed_zone identifier integers
*  `zone_names` - an array of google_dns_managed_zone name strings
*  `zone_dns_names` - an array of google_dns_managed_zone dns name strings
*  `dnssec_config_state`- an array of google_dns_managed_zone dnssec_config boolean values

<br>


## GCP Permissions

Ensure the [Cloud DNS API](https://console.cloud.google.com/apis/api/dns.googleapis.com/) is enabled for the project.