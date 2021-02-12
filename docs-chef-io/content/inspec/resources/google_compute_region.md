+++
title = "google_compute_region resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_region"
    identifier = "inspec/resources/gcp/google_compute_region.md google_compute_region resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_region` is used to test a Google Region resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_region(project: 'chef-gcp-inspec', name: 'europe-west2') do
  it { should exist }
  it { should be_up }
  its('zone_names') { should include "#{gcp_location}-a" }
end

describe google_compute_region(project: 'chef-gcp-inspec', name: 'notthere') do
  it { should_not exist }
end
```

### Test that a GCP compute region exists

```ruby
  describe google_compute_region(project: 'chef-inspec-gcp',  region: 'europe-west2') do
    it { should exist }
  end
```

### Test that a GCP compute region is in the expected state

```ruby
  describe google_compute_region(project: 'chef-inspec-gcp',  region: 'europe-west2') do
    its('status') { should eq 'UP' }
    # or equivalently
    it { should be_up }
  end
```

### Test a GCP compute region identifier

```ruby
  describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
    its('id') { should eq "1220" }
  end
```

### Check that a region is associated with the expected zone fully qualified name

```ruby
  describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
    its('zones') { should include "https://www.googleapis.com/compute/v1/projects/spaterson-project/zones/asia-east1-a" }
  end
```

### Check that a region is associated with the expected zone short name

```ruby
  describe google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1") do
    its('zone_names') { should include "asia-east1-a" }
  end
```

The `zone_names` property is also useful for subsequently looping over associated `google_compute_zone` resources. For example:

```ruby
  google_compute_region(project: 'chef-inspec-gcp',  region: "asia-east1").zone_names.each do |zone_name|
    describe google_compute_zone(project: 'chef-inspec-gcp', name: zone_name) do
      it { should be_up }
    end
  end

```

## Properties

Properties that can be accessed from the `google_compute_region` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`deprecated`
: The deprecation state of this resource.

`deleted`
: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DELETED.

`deprecated`
: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to DEPRECATED.

`obsolete`
: An optional RFC3339 timestamp on or after which the deprecation state of this resource will be changed to OBSOLETE.

`replacement`
: The URL of the suggested replacement for a deprecated resource. The suggested replacement resource must be the same kind of resource as the deprecated resource.

`state`
: The deprecation state of this resource. This can be DEPRECATED, OBSOLETE, or DELETED. Operations which create a new resource using a DEPRECATED resource will return successfully, but with a warning indicating the deprecated resource and recommending its replacement. Operations which use OBSOLETE or DELETED resources will be rejected and result in an error.

  Possible values:

  - DEPRECATED
  - OBSOLETE
  - DELETED

`description`
: An optional description of this resource.

`id`
: The unique identifier for the resource.

`name`
: Name of the resource.

`quotas`
: Quotas assigned to this region.

`metric`
: Name of the quota metric.

`limit`
: Quota limit for this metric.

`usage`
: Current usage of this metric.

`owner`
: Owning resource. This is the resource on which this quota is applied.

`status`
: Status of the region, either UP or DOWN.
Possible values:

- UP
- DOWN

`zones`
: List of zones within the region

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
