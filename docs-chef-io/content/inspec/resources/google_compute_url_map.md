+++
title = "google_compute_url_map resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_compute_url_map"
    identifier = "inspec/resources/gcp/google_compute_url_map.md google_compute_url_map resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_compute_url_map` is used to test a Google UrlMap resource

## Beta Resource

This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples

```ruby
describe google_compute_url_map(project: 'chef-gcp-inspec', name: 'inspec-gcp-url-map') do
  it { should exist }
  its('description') { should eq 'URL map description' }
  its('default_service') { should match /\/inspec-gcp-backend-service$/ }
  its('host_rules.count') { should eq 1 }
  its('host_rules.first.hosts') { should include 'site.com' }
  its('path_matchers.count') { should eq 1 }
  its('path_matchers.first.default_service') { should match /\/inspec-gcp-backend-service$/ }
  its('tests.count') { should eq 1 }
  its('tests.first.host') { should eq 'test.com' }
  its('tests.first.path') { should eq '/home' }
end

describe google_compute_url_map(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties

Properties that can be accessed from the `google_compute_url_map` resource:

`creation_timestamp`
: Creation timestamp in RFC3339 text format.

`default_service`
: The full or partial URL of the defaultService resource to which traffic is directed if none of the hostRules match. If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if routeAction specifies any weightedBackendServices, service must not be specified. Only one of defaultService, defaultUrlRedirect or defaultRouteAction.weightedBackendService must be set.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`id`
: The unique identifier for the resource.

`fingerprint`
: Fingerprint of this resource. A hash of the contents stored in this object. This field is used in optimistic locking.

`header_action`
: Specifies changes to request and response headers that need to take effect for the selected backendService. The headerAction specified here take effect after headerAction specified under pathMatcher.

`request_headers_to_add`
: Headers to add to a matching request prior to forwarding the request to the backendService.

    `header_name`
    : The name of the header.

    `header_value`
    : The value of the header to add.

    `replace`
    : If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

`request_headers_to_remove`
: A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.

`response_headers_to_add`
: Headers to add the response prior to sending the response back to the client.

    `header_name`
    : The name of the header.

    `header_value`
    : The value of the header to add.

    `replace`
    : If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

`response_headers_to_remove`
: A list of header names for headers that need to be removed from the response prior to sending the response back to the client.

`host_rules`
: The list of HostRules to use against the URL.

`description`
: An optional description of this resource. Provide this property when you create the resource.

`hosts`
: The list of host patterns to match. They must be valid hostnames, except _ will match any string of ([a-z0-9-.]_). In that case, \* must be the first character and must be followed in the pattern by either - or ..

`path_matcher`
: The name of the PathMatcher to use to match the path portion of the URL if the hostRule matches the URL's host portion.

`name`
: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

`path_matchers`
: The list of named PathMatchers to use against the URL.

`default_service`
: The full or partial URL to the BackendService resource. This will be used if none of the pathRules or routeRules defined by this PathMatcher are matched. For example, the following are all valid URLs to a BackendService resource: - https://www.googleapis.com/compute/v1/projects/project/global/backendServices/backendService - compute/v1/projects/project/global/backendServices/backendService - global/backendServices/backendService If defaultRouteAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if defaultService is specified, defaultRouteAction cannot contain any weightedBackendServices. Conversely, if defaultRouteAction specifies any weightedBackendServices, defaultService must not be specified. Only one of defaultService, defaultUrlRedirect or defaultRouteAction.weightedBackendService must be set. Authorization requires one or more of the following Google IAM permissions on the specified resource defaultService: - compute.backendBuckets.use - compute.backendServices.use

`description`
: An optional description of this resource. Provide this property when you create the resource.

`header_action`
: Specifies changes to request and response headers that need to take effect for the selected backendService. HeaderAction specified here are applied after the matching HttpRouteRule HeaderAction and before the HeaderAction in the UrlMap

    `request_headers_to_add`
    : Headers to add to a matching request prior to forwarding the request to the backendService.

      `header_name`
      : The name of the header.

      `header_value`
      : The value of the header to add.

      `replace`
      : If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

    `request_headers_to_remove`
    : A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.

    `response_headers_to_add`
    : Headers to add the response prior to sending the response back to the client.

      `header_name`
      : The name of the header.

      `header_value`
      : The value of the header to add.

      `replace`
      : If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header.

    `response_headers_to_remove`
    : A list of header names for headers that need to be removed from the response prior to sending the response back to the client.

`name`
: The name to which this PathMatcher is referred by the HostRule.

`default_url_redirect`
: When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set.

    `host_redirect`
    : The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.

    `https_redirect`
    : If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.

    `path_redirect`
    : The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

    `prefix_redirect`
    : The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

    `redirect_response_code`
    : The HTTP Status code to use for this RedirectAction. Supported values are:

      Supported values are:

      - MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301.
      - FOUND, which corresponds to 302.
      - SEE_OTHER which corresponds to 303.
      - TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained.
      - PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.

    `strip_query`
    : If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained.

`tests`
: The list of expected URL mapping tests. Request to update this UrlMap will succeed only if all of the test cases pass. You can specify a maximum of 100 tests per UrlMap.

    `description`
    : Description of this test case.

    `host`
    : Host portion of the URL.

    `path`
    : Path portion of the URL.

    `service`
    : Expected BackendService resource the given URL should be mapped to.

`default_url_redirect`
: When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set.

`host_redirect`
: The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.

`https_redirect`
: If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.

`path_redirect`
: The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

`prefix_redirect`
: The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.

`redirect_response_code`
: The HTTP Status code to use for this RedirectAction.

    Supported values are:

    - MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301.
    - FOUND, which corresponds to 302.
    - SEE_OTHER which corresponds to 303.
    - TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained.
    - PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.

`strip_query`
: If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. The default is set to false.

## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
