+++
title = "google_compute_target_pool resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_target_pool"
    identifier = "inspec/resources/gcp/google_compute_target_pool.md google_compute_target_pool resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_target_pool` is used to test a Google TargetPool resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_target_pool(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-gcp-target-pool') do
  it { should exist }
  its('session_affinity') { should eq 'CLIENT_IP' }
  it { should has_target_instance('gcp_ext_vm_name', 'zone') }
end

describe google_compute_target_pool(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_target_pool` resource:

`backup_pool`
: This field is applicable only when the containing target pool is serving a forwarding rule as the primary pool, and its failoverRatio field is properly set to a value between [0, 1]. backupPool and failoverRatio together define the fallback behavior of the primary target pool: if the ratio of the healthy instances in the primary pool is at or below failoverRatio, traffic arriving at the load-balanced IP will be directed to the backup pool. In case where failoverRatio and backupPool are not set, or all the instances in the backup pool are unhealthy, the traffic will be directed back to the primary pool in the "force" mode, where traffic will be spread to the healthy instances with the best effort, or to all instances when no instance is healthy.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`failover_ratio`
: This field is applicable only when the containing target pool is serving a forwarding rule as the primary pool (i.e., not as a backup pool to some other target pool). The value of the field must be in [0, 1]. If set, backupPool must also be set. They together define the fallback behavior of the primary target pool: if the ratio of the healthy instances in the primary pool is at or below this number, traffic arriving at the load-balanced IP will be directed to the backup pool. In case where failoverRatio is not set or all the instances in the backup pool are unhealthy, the traffic will be directed back to the primary pool in the "force" mode, where traffic will be spread to the healthy instances with the best effort, or to all instances when no instance is healthy.

`health_check`
: A reference to a HttpHealthCheck resource. A member instance in this pool is considered healthy if and only if the health checks pass. If not specified it means all member instances will be considered healthy at all times.

`id`
: The unique identifier for the resource.

`instances`
: A list of virtual machine instances serving this pool. They must live in zones contained in the same region as this pool.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`session_affinity`
: Session affinity option. Must be one of these values: - NONE: Connections from the same client IP may go to any instance in the pool. - CLIENT_IP: Connections from the same client IP will go to the same instance in the pool while that instance remains healthy. - CLIENT_IP_PROTO: Connections from the same client IP with the same IP protocol will go to the same instance in the pool while that instance remains healthy.

  Possible values:

  - NONE
  - CLIENT_IP
  - CLIENT_IP_PROTO

`region`
: The region where the target pool resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
