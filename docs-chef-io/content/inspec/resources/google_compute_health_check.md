+++
title = "google_compute_health_check resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_health_check"
    identifier = "inspec/resources/gcp/google_compute_health_check.md google_compute_health_check resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_health_check` is used to test a Google HealthCheck resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_health_check(project: 'chef-gcp-inspec', name: 'inspec-gcp-health-check') do
  it { should exist }
  its('timeout_sec') { should eq '10' }
  its('tcp_health_check.port') { should eq '80' }
end

describe google_compute_health_check(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_health_check` resource:

`check_interval_sec`
: How often (in seconds) to send a health check. The default value is 5 seconds.

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`healthy_threshold`
: A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2.

`id`
: The unique identifier for the resource. This identifier is defined by the server.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`timeout_sec`
: How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for timeoutSec to have greater value than checkIntervalSec.

`unhealthy_threshold`
: A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2.

`type`
: Specifies the type of the healthCheck, either TCP, SSL, HTTP or HTTPS. If not specified, the default is TCP. Exactly one of the protocol-specific health check field must be specified, which must match type field.

  Possible values:

  - TCP
  - SSL
  - HTTP
  - HTTPS
  - HTTP2

`http_health_check`
: A nested object resource

  `host`
  : The value of the host header in the HTTP health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.

  `request_path`
  : The request path of the HTTP health check request. The default value is /.

  `response`
  : The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.

  `port`
  : The TCP port number for the HTTP health check request. The default value is 80.

  `port_name`
  : Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.

  `proxy_header`
  : Specifies the type of proxy header to append before sending data to the backend.

    Possible values:

    - NONE
    - PROXY_V1

  `port_specification`
  : Specifies how port is selected for health checking, can be one of the following values:

    `USE_FIXED_PORT`
    : The port number in `port` is used for health checking.

    `USE_NAMED_PORT`
    : The `portName` is used for health checking.

    `USE_SERVING_PORT`
    : For NetworkEndpointGroup, the port specified for each   network endpoint is used for health checking. For other backends, the   port or named port specified in the Backend Service is used for health   checking.  If not specified, HTTP health check follows behavior specified in `port` and `portName` fields.

`https_health_check`
: A nested object resource

  `host`
  : The value of the host header in the HTTPS health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.

  `request_path`
  : The request path of the HTTPS health check request. The default value is /.

  `response`
  : The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.

  `port`
  : The TCP port number for the HTTPS health check request. The default value is 443.

  `port_name`
  : Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.

  `proxy_header`
  : Specifies the type of proxy header to append before sending data to the backend.

    Possible values:

    - NONE
    - PROXY_V1

  `port_specification`
  : Specifies how port is selected for health checking, can be one of the following values:

    `USE_FIXED_PORT`
    : The port number in `port` is used for health checking.

    `USE_NAMED_PORT`
    : The `portName` is used for health checking.

    `USE_SERVING_PORT`
    : For NetworkEndpointGroup, the port specified for each   network endpoint is used for health checking. For other backends, the   port or named port specified in the Backend Service is used for health   checking.  If not specified, HTTPS health check follows behavior specified in `port` and `portName` fields.

`tcp_health_check`
: A nested object resource

  `request`
  : The application data to send once the TCP connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII.

  `response`
  : The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.

  `port`
  : The TCP port number for the TCP health check request. The default value is 443.

  `port_name`
  : Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.

  `proxy_header`
  : Specifies the type of proxy header to append before sending data to the backend.

    Possible values:

    - NONE
    - PROXY_V1

  `port_specification`
  : Specifies how port is selected for health checking, can be one of the following values:

    `USE_FIXED_PORT`
    : The port number in `port` is used for health checking.

    `USE_NAMED_PORT`
    : The `portName` is used for health checking.

    `USE_SERVING_PORT`
    : For NetworkEndpointGroup, the port specified for each   network endpoint is used for health checking. For other backends, the   port or named port specified in the Backend Service is used for health   checking.  If not specified, TCP health check follows behavior specified in `port` and `portName` fields.

`ssl_health_check`
: A nested object resource

  `request`
  : The application data to send once the SSL connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII.

  `response`
  : The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.

  `port`
  : The TCP port number for the SSL health check request. The default value is 443.

  `port_name`
  : Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.

  `proxy_header`
  : Specifies the type of proxy header to append before sending data to the backend.

    Possible values:

    - NONE
    - PROXY_V1

  `port_specification`
  : Specifies how port is selected for health checking, can be one of the following values:

    `USE_FIXED_PORT`
    : The port number in `port` is used for health checking.

    `USE_NAMED_PORT`
    : The `portName` is used for health checking.

    `USE_SERVING_PORT`
    : For NetworkEndpointGroup, the port specified for each   network endpoint is used for health checking. For other backends, the   port or named port specified in the Backend Service is used for health   checking.  If not specified, SSL health check follows behavior specified in `port` and `portName` fields.

`http2_health_check`
: A nested object resource

  `host`
  : The value of the host header in the HTTP2 health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.

  `request_path`
  : The request path of the HTTP2 health check request. The default value is /.

  `response`
  : The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.

  `port`
  : The TCP port number for the HTTP2 health check request. The default value is 443.

  `port_name`
  : Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.

  `proxy_header`
  : Specifies the type of proxy header to append before sending data to the backend.

    Possible values:

    - NONE
    - PROXY_V1

  `port_specification`
  : Specifies how port is selected for health checking, can be one of the following values:

    `USE_FIXED_PORT`
    : The port number in `port` is used for health checking.

    `USE_NAMED_PORT`
    : The `portName` is used for health checking.

    `USE_SERVING_PORT`
    : For NetworkEndpointGroup, the port specified for each   network endpoint is used for health checking. For other backends, the   port or named port specified in the Backend Service is used for health   checking.  If not specified, HTTP2 health check follows behavior specified in `port` and `portName` fields.


`log_config`
: (Beta only) Configure logging on this health check.

    `enable`
    : Indicates whether or not to export logs. This is false by default, which means no health check logging will be done.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
