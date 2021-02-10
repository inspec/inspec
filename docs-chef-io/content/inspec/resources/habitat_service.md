+++
title = "habitat_service resource"
draft = false
gh_repo = "inspec"
platform = "habitat"

[menu]
  [menu.inspec]
    title = "habitat_service"
    identifier = "inspec/resources/habitat/habitat_service.md habitat_service resource"
    parent = "inspec/resources/habitat"
+++

Use the `habitat_service` InSpec audit resource to test properties of a single Habitat service.

## Availability

### Status: EXPERIMENTAL

This resource, like all of the inspec-habitat resource pack, is in the early stages of research and development. Functionality may be defective, incomplete, or be withdrawn in the future. If you are interested in helping this project mature, please join the conversation or contribute code at the [inspec-habitat project](https://github.com/inspec/inspec-habitat).

### Connecting to Habitat

To configure `inspec` to be able to communicate with Chef Habitat, be sure [to follow the instructions](https://github.com/inspec/inspec-habitat#configuring-inspec-to-reach-habitat) regarding configuring the connection options. This will prevent 'unsupported platform' errors.

## Examples

### Check for core/httpd service

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  it                     { should exist }
  its('version')         { should eq '2.4.35'}
  its('topology')        { should eq 'standalone' }
  its('update_strategy') { should eq 'none' }
end
```

## Limitations

### API versus CLI access

Habitat exposes certain data via the CLI, and other data via the HTTP Gateway API. To enjoy the full functionality of this resource, use a set of credentials that includes the API. Limited data is available by CLI. See the [train-habitat](https://github.com/inspec/train-habitat) documentation for more details.

If you use the CLI interface without the API, unavailable properties will behave as if the resource was not found (see below).

### Behavior when not found

If the service is not found, then this resource behaves as follows:

- `it { should exist }` will be a failing test. Check this test if you are unsure if the resource will exist; it is guaranteed to be reliable in the future.
- `name` and `origin` will continue to return their values as set in the resource parameters. This allows output messaging to refer to the missing service clearly.
- All other single-value properties will return nil.
- All array and hash-valued properties will return empty objects.
- All matchers will return false.

## Availability

### Installation

This resource is in the `inspec-habitat` resource pack. You can use the resource by setting an InSpec profile dependency on the resource pack. See [inspec-habitat instructions](https://github.com/inspec/inspec-habitat#installation)

### Version

This resource was first available in version 0.1.0 of the resource pack.

## Resource Parameters

Use [resource parameters](/inspec/glossary/#resource-parameter) to identify the particular service you wish to test.

### origin

Required string. The name of the `origin` (distribution facility) of the package that provides the service.

```ruby
# Most common origin is 'core', publicly distributed packages created by Chef
describe habitat_service(origin: 'core', name: 'httpd') do
  it { should exist }
end

# Your company might run a private origin
describe habitat_service(origin: 'mycorp', name: 'secret-sauce') do
  it { should exist }
end
```

### name

Required string. The name (unique within the namespace of the origin) of the package that provides the service.

```ruby

describe habitat_service(origin: 'core', name: 'httpd') do
  it { should exist }
end

```

## Properties

Use [properties](/inspec/glossary/#property) to create tests that compare an expected value to the actual value.

### dependency_names

Array of strings. A list of the packages that this service depends on, in the form of `dep_origin/dep_name`. This property does not contain version information; see `dependency_ids` for that.

Requires API connection; not available via CLI.

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('dependency_names') { should include 'core/pcre' }
  its('dependency_names') { should_not include 'core/nginx' }
end
```

### dependency_ids

Array of strings. A list of the packages that this service depends on, in the form of `dep_origin/dep_name/1.2.3/20190325123456`. This value may be difficult to compare, because the version identifier (`1.2.3`, the third component) may be formatted in any way the maintainer of the project chooses; they need not be of the form `1.2.3`.

Requires API connection; not available via CLI.

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  # Suppose this version was unwanted, for example
  its('dependency_names') { should_not include 'core/pcre/8.42/20190115012526' }
end
```

### name

The name of the service, as passed in via the resource parameter. Always available, even if the resource was not found. See also [origin](#origin) and [version](#version).

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('name') { should cmp 'httpd' }
end
```

### origin

The origin name of the service, as passed in via the resource parameter. Always available, even if the resource was not found. See also [name](#name) and [version](#version).

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('origin') { should cmp 'core' }
end
```

### pkg_id

String. The full package identifier of the package that supports the service, in the form `origin/name/version/release`. See also [name](#name) and [version](#version).

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('pkg_id') { should cmp 'core/httpd/2.4.35/20190307151146' }
end
```

### release

String. The release number of the package that supports the service, as assigned by the packager. These values are always strings, but are 14-digit timestamps. See also [version](#version).

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('release') { should be >= '20190307151146' }
end
```

### version

The version of the package that supports the service, as assigned by the maintainer of the package project. While many versions are of the 3-digit form, there is no set rule, and exceptions are common. See also [release](#release).

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  its('version') { should be >=  '2.2' }
end
```

## Matchers

Use [matchers](/inspec/glossary/#matcher) to create tests that test a true or false question.

InSpec includes a number of [universal matchers](/inspec/matchers/). See below for matchers specific to this resource.

### have_standalone_topology

This matcher returns `true` if the service is configured in a [`standalone`](https://www.habitat.sh/docs/using-habitat/#standalone) topology.

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  it { should have_standalone_topology }
end
```

### have_leader_follower_topology

This matcher returns `true` if the service is configured in a [`leader-follower`](https://www.habitat.sh/docs/using-habitat/#leader-follower-topology) topology.

```ruby
describe habitat_service(origin: 'core', name: 'httpd') do
  it { should have_leader_follower_topology }
end
```

### be_updated_by_none

This matcher returns `true` if the update strategy for the service is [`none`](https://www.habitat.sh/docs/using-habitat/#none-strategy).

Requires API connection; not available via CLI.

```ruby
describe habitat_service(origin: 'core', name: 'postgresql') do
  it { should be_updated_by_none }
end
```

### be_updated_by_rolling

This matcher returns `true` if the update strategy for the service is [`rolling`](https://www.habitat.sh/docs/using-habitat/#rolling-strategy).

Requires API connection; not available via CLI.

```ruby
describe habitat_service(origin: 'core', name: 'postgresql') do
  it { should be_updated_by_rolling }
end
```

### be_updated_at_once

This matcher returns `true` if the update strategy for the service is [`at once`](https://www.habitat.sh/docs/using-habitat/#at-once-strategy).

Requires API connection; not available via CLI.

```ruby
describe habitat_service(origin: 'core', name: 'nginx') do
  it { should be_updated_at_once }
end
```
