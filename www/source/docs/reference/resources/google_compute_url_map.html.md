---
title: About the google_compute_url_map resource
platform: gcp
---

## Syntax
A `google_compute_url_map` is used to test a Google UrlMap resource

## Examples
```
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

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `default_service`: A reference to BackendService resource if none of the hostRules match.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `host_rules`: The list of HostRules to use against the URL.

    * `description`: An optional description of this HostRule. Provide this property when you create the resource.

    * `hosts`: The list of host patterns to match. They must be valid hostnames, except * will match any string of ([a-z0-9-.]*). In that case, * must be the first character and must be followed in the pattern by either - or ..

    * `pathMatcher`: The name of the PathMatcher to use to match the path portion of the URL if the hostRule matches the URL's host portion.

  * `id`: The unique identifier for the resource.

  * `fingerprint`: Fingerprint of this resource. This field is used internally during updates of this resource.

  * `name`: Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `path_matchers`: The list of named PathMatchers to use against the URL.

    * `defaultService`: A reference to a BackendService resource. This will be used if none of the pathRules defined by this PathMatcher is matched by the URL's path portion.

    * `description`: An optional description of this resource.

    * `name`: The name to which this PathMatcher is referred by the HostRule.

    * `pathRules`: The list of path rules.

  * `tests`: The list of expected URL mappings. Requests to update this UrlMap will succeed only if all of the test cases pass.

    * `description`: Description of this test case.

    * `host`: Host portion of the URL.

    * `path`: Path portion of the URL.

    * `service`: A reference to expected BackendService resource the given URL should be mapped to.
