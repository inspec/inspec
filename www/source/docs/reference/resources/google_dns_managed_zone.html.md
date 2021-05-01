---
title: About the google_dns_managed_zones Resource
platform: gcp
---

# google\_dns\_managed\_zone

Use the `google_dns_managed_zones` InSpec audit resource to test properties of a single GCP DNS managed zone.

<br>

## Syntax

A `google_dns_managed_zone` resource block declares the tests for a single GCP zone by project and name.

    describe google_dns_managed_zone(project: 'chef-inspec-gcp',  zone: 'zone-name') do
      it { should exist }
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

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


<br>

## Properties

*  `creation_time`, `creation_time_date`, `description`, `dns_name`, `dnssec_config`, `id`, `kind`, `name`, `name_servers`, `key_signing_key_algorithm`, `zone_signing_key_algorithm`

<br>


## GCP Permissions

Ensure the [Cloud DNS API](https://console.cloud.google.com/apis/api/dns.googleapis.com/) is enabled for the project.