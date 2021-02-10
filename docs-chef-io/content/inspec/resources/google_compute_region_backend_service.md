+++
title = "google_compute_region_backend_service resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_region_backend_service"
    identifier = "inspec/resources/gcp/google_compute_region_backend_service.md google_compute_region_backend_service resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_region_backend_service` is used to test a Google RegionBackendService resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_region_backend_service(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'inspec-gcp-region-backend-service') do
  it { should exist }
  its('description') { should eq 'A regional description' }
  its('protocol') { should eq 'TCP' }
  its('timeout_sec') { should eq '15' }
end

describe google_compute_region_backend_service(project: 'chef-gcp-inspec', region: 'europe-west2', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_region_backend_service` resource:

`affinity_cookie_ttl_sec`
: Lifetime of cookies in seconds if session_affinity is GENERATED_COOKIE. If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value for TTL is one day. When the load balancing scheme is INTERNAL, this field is not used.

`backends`
: The set of backends that serve this RegionBackendService.

  `balancing_mode`
  : Specifies the balancing mode for this backend.

    Possible values:
    - UTILIZATION
    - RATE
    - CONNECTION

  `capacity_scaler`
  : A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION).  ~>**NOTE**: This field cannot be set for INTERNAL region backend services (default loadBalancingScheme), but is required for non-INTERNAL backend service. The total capacity_scaler for all backends must be non-zero.  A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].

  `description`
  : An optional description of this resource. Provide this property when you create the resource.

  `failover`
  : This field designates whether this is a failover backend. More than one failover backend can be configured for a given RegionBackendService.

  `group`
  : The fully-qualified URL of an Instance Group or Network Endpoint Group resource. In case of instance group this defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource.  For Network Endpoint Groups this defines list of endpoints. All endpoints of Network Endpoint Group must be hosted on instances located in the same zone as the Network Endpoint Group.  Backend services cannot mix Instance Group and Network Endpoint Group backends.  When the `load_balancing_scheme` is INTERNAL, only instance groups are supported.  Note that you must specify an Instance Group or Network Endpoint Group resource using the fully-qualified URL, rather than a partial URL.

  `max_connections`
  : The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes. Cannot be set for INTERNAL backend services.  For CONNECTION mode, either maxConnections or one of maxConnectionsPerInstance or maxConnectionsPerEndpoint, as appropriate for group type, must be set.

  `max_connections_per_instance`
  : The max number of simultaneous connections that a single backend instance can handle. Cannot be set for INTERNAL backend services.  This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes. For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.

  `max_connections_per_endpoint`
  : The max number of simultaneous connections that a single backend network endpoint can handle. Cannot be set for INTERNAL backend services.  This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes. For CONNECTION mode, either maxConnections or maxConnectionsPerEndpoint must be set.

  `max_rate`
  : The max requests per second (RPS) of the group. Cannot be set for INTERNAL backend services.  Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. Either maxRate or one of maxRatePerInstance or maxRatePerEndpoint, as appropriate for group type, must be set.

  `max_rate_per_instance`
  : The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set. Cannot be set for INTERNAL backend services.

  `max_rate_per_endpoint`
  : The max requests per second (RPS) that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerEndpoint must be set. Cannot be set for INTERNAL backend services.

  `max_utilization`
  : Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. Valid range is [0.0, 1.0]. Cannot be set for INTERNAL backend services.

`circuit_breakers`
: Settings controlling the volume of connections to a backend service. This field is applicable only when the `load_balancing_scheme` is set to INTERNAL_MANAGED and the `protocol` is set to HTTP, HTTPS, or HTTP2.

  `connect_timeout`
  : (Beta only) The timeout for new network connections to hosts.

    `seconds`
    : Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.

    `nanos`
    : Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

  `max_requests_per_connection`
  : Maximum requests for a single backend connection. This parameter is respected by both the HTTP/1.1 and HTTP/2 implementations. If not specified, there is no limit. Setting this parameter to 1 will effectively disable keep alive.

  `max_connections`
  : The maximum number of connections to the backend cluster. Defaults to 1024.

  `max_pending_requests`
  : The maximum number of pending requests to the backend cluster. Defaults to 1024.

  `max_requests`
  : The maximum number of parallel requests to the backend cluster. Defaults to 1024.

  `max_retries`
  : The maximum number of parallel retries to the backend cluster. Defaults to 3.

`consistent_hash`
: Consistent Hash-based load balancing can be used to provide soft session affinity based on HTTP headers, cookies or other properties. This load balancing policy is applicable only for HTTP connections. The affinity to a particular destination host will be lost when one or more hosts are added/removed from the destination service. This field specifies parameters that control consistent hashing. This field only applies when all of the following are true: `load_balancing_scheme` is set to INTERNAL_MANAGED, `protocol` is set to HTTP, HTTPS, or HTTP2, and `locality_lb_policy` is set to MAGLEV or RING_HASH

`http_cookie`
: Hash is based on HTTP Cookie. This field describes a HTTP cookie that will be used as the hash key for the consistent hash load balancer. If the cookie is not present, it will be generated. This field is applicable if the sessionAffinity is set to HTTP_COOKIE.

  `ttl`
  : Lifetime of the cookie.

    `seconds`
    : Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.

    `nanos`
    : Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.

  `name`
  : Name of the cookie.

  `path`
  : Path to set for the cookie.

`http_header_name`
: The hash based on the value of the specified header field. This field is applicable if the sessionAffinity is set to HEADER_FIELD.

`minimum_ring_size`
: The minimum number of virtual nodes to use for the hash ring. Larger ring sizes result in more granular load distributions. If the number of hosts in the load balancing pool is larger than the ring size, each host will be assigned a single virtual node. Defaults to 1024.

`connection_draining`
: Settings for connection draining

  `draining_timeout_sec`
  : Time for which instance will be drained (not accept new connections, but still work to finish started).

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource.

`failover_policy`
: Policy for failovers.

  `disable_connection_drain_on_failover`
  : On failover or failback, this field indicates whether connection drain will be honored. Setting this to true has the following effect: connections to the old active pool are not drained. Connections to the new active pool use the timeout of 10 min (currently fixed). Setting to false has the following effect: both old and new connections will have a drain timeout of 10 min. This can be set to true only if the protocol is TCP. The default is false.

  `drop_traffic_if_unhealthy`
  : This option is used only when no healthy VMs are detected in the primary and backup instance groups. When set to true, traffic is dropped. When set to false, new connections are sent across all VMs in the primary group. The default is false.

  `failover_ratio`
  : The value of the field must be in [0, 1]. If the ratio of the healthy VMs in the primary backend is at or below this number, traffic arriving at the load-balanced IP will be directed to the failover backend. In case where 'failoverRatio' is not set or all the VMs in the backup backend are unhealthy, the traffic will be directed back to the primary backend in the "force" mode, where traffic will be spread to the healthy VMs with the best effort, or to all VMs when no VM is healthy. This field is only used with l4 load balancing.

`fingerprint`
: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

`health_checks`
: The set of URLs to HealthCheck resources for health checking this RegionBackendService. Currently at most one health check can be specified, and a health check is required.

`id`
: The unique identifier for the resource.

`load_balancing_scheme`
: Indicates what kind of load balancing this regional backend service will be used for. A backend service created for one type of load balancing cannot be used with the other(s).

  Possible values:

  - INTERNAL
  - INTERNAL_MANAGED


`locality_lb_policy`
: The load balancing algorithm used within the scope of the locality.

  The possible values are:

  ROUND*ROBIN
  : This is a simple policy in which each healthy backend is selected in round robin order.

  LEAST_REQUEST
  : An O(1) algorithm which selects two random healthy hosts and picks the host which has fewer active requests.

  RING_HASH
  : The ring/modulo hash load balancer implements consistent hashing to backends. The algorithm has the property that the addition/removal of a host from a set of N hosts only affects 1/N of the requests.

  RANDOM
  : The load balancer selects a random healthy host.

  ORIGINAL_DESTINATION
  : Backend host is selected based on the client connection metadata, i.e., connections are opened to the same address as the destination address of the incoming connection before the connection was redirected to the load balancer.

  MAGLEV
  : used as a drop in replacement for the ring hash load balancer. Maglev is not as stable as ring hash but has faster table lookup build times and host selection times. For more information about Maglev, refer to https://ai.google/research/pubs/pub44824. This field is applicable only when the `load_balancing_scheme` is set to INTERNAL_MANAGED and the `protocol` is set to HTTP, HTTPS, or HTTP2.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`outlier_detection`
: Settings controlling eviction of unhealthy hosts from the load balancing pool. This field is applicable only when the `load_balancing_scheme` is set to INTERNAL_MANAGED and the `protocol` is set to HTTP, HTTPS, or HTTP2.

  `base_ejection_time`
  : The base time that a host is ejected for. The real time is equal to the base time multiplied by the number of times the host has been ejected. Defaults to 30000ms or 30s.

    `seconds`
    : Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.

    `nanos`
    : Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.

  `consecutive_errors`
  : Number of errors before a host is ejected from the connection pool. When the backend host is accessed over HTTP, a 5xx return code qualifies as an error. Defaults to 5.

  `consecutive_gateway_failure`
  : The number of consecutive gateway failures (502, 503, 504 status or connection errors that are mapped to one of those status codes) before a consecutive gateway failure ejection occurs. Defaults to 5.

  `enforcing_consecutive_errors`
  : The percentage chance that a host will be actually ejected when an outlier status is detected through consecutive 5xx. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 100.

  `enforcing_consecutive_gateway_failure`
  : The percentage chance that a host will be actually ejected when an outlier status is detected through consecutive gateway failures. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 0.

  `enforcing_success_rate`
  : The percentage chance that a host will be actually ejected when an outlier status is detected through success rate statistics. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 100.

  `interval`
  : Time interval between ejection sweep analysis. This can result in both new ejections as well as hosts being returned to service. Defaults to 10 seconds.

    `seconds`
    : Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.

    `nanos`
    : Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.

  `max_ejection_percent`
  : Maximum percentage of hosts in the load balancing pool for the backend service that can be ejected. Defaults to 10%.

  `success_rate_minimum_hosts`
  : The number of hosts in a cluster that must have enough request volume to detect success rate outliers. If the number of hosts is less than this setting, outlier detection via success rate statistics is not performed for any host in the cluster. Defaults to 5.

  `success_rate_request_volume`
  : The minimum number of total requests that must be collected in one interval (as defined by the interval duration above) to include this host in success rate based outlier detection. If the volume is lower than this setting, outlier detection via success rate statistics is not performed for that host. Defaults to 100.

  `success_rate_stdev_factor`
  : This factor is used to determine the ejection threshold for success rate outlier ejection. The ejection threshold is the difference between the mean success rate, and the product of this factor and the standard deviation of the mean success rate: mean - (stdev * success_rate_stdev_factor). This factor is divided by a thousand to get a double. That is, if the desired factor is 1.9, the runtime value should be 1900. Defaults to 1900.

`port_name`
: A named port on a backend instance group representing the port for communication to the backend VMs in that group. Required when the loadBalancingScheme is EXTERNAL, INTERNAL_MANAGED, or INTERNAL_SELF_MANAGED and the backends are instance groups. The named port must be defined on each backend instance group. This parameter has no meaning if the backends are NEGs. API sets a default of "http" if not given. Must be omitted when the loadBalancingScheme is INTERNAL (Internal TCP/UDP Load Balancing).

`protocol`
: The protocol this RegionBackendService uses to communicate with backends. The default is HTTP. **NOTE**: HTTP2 is only valid for beta HTTP/2 load balancer types and may result in errors if used with the GA API.

  Possible values:

  - HTTP
  - HTTPS
  - HTTP2
  - SSL
  - TCP
  - UDP


`session_affinity`
: Type of session affinity to use. The default is NONE. Session affinity is not applicable if the protocol is UDP.

  Possible values:

  - NONE
  - CLIENT
  - IP
  - CLIENT*IP_PORT_PROTO
  - CLIENT*IP_PROTO
  - GENERATED*COOKIE
  - HEADER_FIELD
  - HTTP_COOKIE

`timeout_sec`
: How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].

`log_config`
: This field denotes the logging options for the load balancer traffic served by this backend service. If logging is enabled, logs will be exported to Stackdriver.

  `enable`
  : Whether to enable logging for the load balancer traffic served by this backend service.

  `sample_rate`
  : This field can only be specified if logging is enabled for this backend service. The value of the field must be in [0, 1]. This configures the sampling rate of requests to the load balancer where 1.0 means all logged requests are reported and 0.0 means no logged requests are reported. The default value is 1.0.

`network`
: The URL of the network to which this backend service belongs. This field can only be specified when the load balancing scheme is set to INTERNAL.

`region`
: A reference to the region where the regional backend service resides.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
