+++
title = "google_redis_instance resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_redis_instance"
    identifier = "inspec/resources/gcp/google_redis_instance.md google_redis_instance resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_redis_instance` is used to test a Google Instance resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_redis_instance(project: 'chef-gcp-inspec', region: 'us-central1', name: 'my-redis-cache') do
  it { should exist }
  its('tier') { should cmp 'STANDARD_HA' }
  its('memory_size_gb') { should cmp '1' }
  its('alternative_location_id') { should cmp 'us-central1-f' }
  its('redis_version') { should cmp 'REDIS_3_2' }
  its('display_name') { should cmp 'InSpec test instance' }
  its('reserved_ip_range') { should cmp '192.168.0.0/29' }
  its('labels') { should include('key' => 'value') }
end

describe google_redis_instance(project: 'chef-gcp-inspec', region: 'us-central1', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_redis_instance` resource:

`alternative_location_id`
: Only applicable to STANDARD_HA tier which protects the instance against zonal failures by provisioning it across two zones. If provided, it must be a different zone from the one provided in [locationId].

`authorized_network`
: The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used.

`connect_mode`
: The connection mode of the Redis instance.

  Possible values:

  - DIRECT_PEERING
  - PRIVATE_SERVICE_ACCESS


`create_time`
: The time the instance was created in RFC3339 UTC"Zulu" format, accurate to nanoseconds.

`current_location_id`
: The current zone where the Redis endpoint is placed. For Basic Tier instances, this will always be the same as the [locationId] provided by the user at creation time. For Standard Tier instances, this can be either [locationId] or [alternativeLocationId] and can change after a failover event.

`display_name`
: An arbitrary and optional user-provided name for the instance.

`host`
: Hostname or IP address of the exposed Redis endpoint used by clients to connect to the service.

`labels`
: Resource labels to represent user provided metadata.

`redis_configs`
: Redis configuration parameters, according to http://redis.io/topics/config. Please check Memorystore documentation for the list of supported parameters: https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Instance.FIELDS.redis_configs

`location_id`
: The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId].

`name`
: The ID of the instance or a fully qualified identifier for the instance.

`memory_size_gb`
: Redis memory size in GiB.

`port`
: The port number of the exposed Redis endpoint.

`redis_version`
: The version of Redis software. If not provided, latest supported version will be used. Currently, the supported values are: - REDIS_4_0 for Redis 4.0 compatibility - REDIS_3_2 for Redis 3.2 compatibility

`reserved_ip_range`
: The CIDR range of internal addresses that are reserved for this instance. If not provided, the service will choose an unused /29 block, for example, 10.0.0.0/29 or 192.168.0.0/29. Ranges must be unique and non-overlapping with existing subnets in an authorized network.

`tier`
: The service tier of the instance. Must be one of these values: - BASIC: standalone instance - STANDARD_HA: highly available primary/replica instances

  Possible values:

  - BASIC
  - STANDARD_HA


`region`
: The name of the Redis region of the instance.

## GCP Permissions
