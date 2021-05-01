---
title: About the google_compute_backend_service resource
platform: gcp
---

## Syntax
A `google_compute_backend_service` is used to test a Google BackendService resource

## Examples
```
describe google_compute_backend_service(project: 'chef-gcp-inspec', name: 'inspec-gcp-backend-service') do
  it { should exist }
  its('description') { should eq 'A description' }
  its('port_name') { should eq 'http' }
  its('protocol') { should eq 'HTTP' }
  its('timeout_sec') { should eq '10' }
  its('enable_cdn') { should eq 'true' }
end

describe google_compute_backend_service(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_backend_service` resource:

  * `affinity_cookie_ttl_sec`: Lifetime of cookies in seconds if session_affinity is GENERATED_COOKIE. If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value for TTL is one day.  When the load balancing scheme is INTERNAL, this field is not used.

  * `backends`: The list of backends that serve this BackendService.

    * `balancingMode`: Specifies the balancing mode for this backend.  For global HTTP(S) or TCP/SSL load balancing, the default is UTILIZATION. Valid values are UTILIZATION, RATE (for HTTP(S)) and CONNECTION (for TCP/SSL).  This cannot be used for internal load balancing.

    * `capacityScaler`: A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION).  Default value is 1, which means the group will serve up to 100% of its configured capacity (depending on balancingMode). A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].  This cannot be used for internal load balancing.

    * `description`: An optional description of this resource. Provide this property when you create the resource.

    * `group`: This instance group defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself.  No two backends in a backend service are allowed to use same Instance Group resource.  When the BackendService has load balancing scheme INTERNAL, the instance group must be in a zone within the same region as the BackendService.

    * `maxConnections`: The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.  This cannot be used for internal load balancing.

    * `maxConnectionsPerInstance`: The max number of simultaneous connections that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.  For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.  This cannot be used for internal load balancing.

    * `maxRate`: The max requests per second (RPS) of the group.  Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. For RATE mode, either maxRate or maxRatePerInstance must be set.  This cannot be used for internal load balancing.

    * `maxRatePerInstance`: The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set.  This cannot be used for internal load balancing.

    * `maxUtilization`: Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. The default is 0.8. Valid range is [0.0, 1.0].  This cannot be used for internal load balancing.

  * `cdn_policy`: Cloud CDN configuration for this BackendService.

    * `cacheKeyPolicy`: The CacheKeyPolicy for this CdnPolicy.

  * `connection_draining`: Settings for connection draining

    * `drainingTimeoutSec`: Time for which instance will be drained (not accept new connections, but still work to finish started).

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource.

  * `enable_cdn`: If true, enable Cloud CDN for this BackendService.  When the load balancing scheme is INTERNAL, this field is not used.

  * `health_checks`: The list of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this BackendService. Currently at most one health check can be specified, and a health check is required.  For internal load balancing, a URL to a HealthCheck resource must be specified instead.

  * `id`: The unique identifier for the resource.

  * `iap`: Settings for enabling Cloud Identity Aware Proxy

    * `enabled`: Enables IAP.

    * `oauth2ClientId`: OAuth2 Client ID for IAP

    * `oauth2ClientSecret`: OAuth2 Client Secret for IAP

    * `oauth2ClientSecretSha256`: OAuth2 Client Secret SHA-256 for IAP

  * `load_balancing_scheme`: Indicates whether the backend service will be used with internal or external load balancing. A backend service created for one type of load balancing cannot be used with the other.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `port_name`: Name of backend port. The same name should appear in the instance groups referenced by this service. Required when the load balancing scheme is EXTERNAL.  When the load balancing scheme is INTERNAL, this field is not used.

  * `protocol`: The protocol this BackendService uses to communicate with backends. Possible values are HTTP, HTTPS, TCP, and SSL. The default is HTTP.  For internal load balancing, the possible values are TCP and UDP, and the default is TCP.

  * `region`: The region where the regional backend service resides. This field is not applicable to global backend services.

  * `session_affinity`: Type of session affinity to use. The default is NONE.  When the load balancing scheme is EXTERNAL, can be NONE, CLIENT_IP, or GENERATED_COOKIE.  When the load balancing scheme is INTERNAL, can be NONE, CLIENT_IP, CLIENT_IP_PROTO, or CLIENT_IP_PORT_PROTO.  When the protocol is UDP, this field is not used.

  * `timeout_sec`: How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].
