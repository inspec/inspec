+++
title = "habitat_services resource"
draft = false
gh_repo = "inspec"
platform = "habitat"

[menu]
  [menu.inspec]
    title = "habitat_services"
    identifier = "inspec/resources/habitat/habitat_services.md habitat_services resource"
    parent = "inspec/resources/habitat"
+++

Use the `habitat_service` (singular) InSpec audit resource to perform in-depth auditing of a single service.

Use the `habitat_services` (plural) InSpec audit resource to list Habitat services, and perform bulk operations.

## Availability

### Status: EXPERIMENTAL

This resource, like all of the inspec-habitat resource pack, is in the early stages of research and development. Functionality may be defective, incomplete, or be withdrawn in the future. If you are interested in helping this project mature, please join the conversation or contribute code at the [inspec-habitat project](https://github.com/inspec/inspec-habitat).

### Connecting to Habitat

To configure `inspec` to be able to communicate with Chef Habitat, be sure [to follow the instructions](https://github.com/inspec/inspec-habitat#configuring-inspec-to-reach-habitat) regarding configuring the connection options. This will prevent 'unsupported platform' errors.

## Examples

### Ensure there are 2 services, with the expected names

```ruby
describe habitat_services do
  its('count') { should cmp 2 }
  its('names') { should include 'httpd' }
  its('names') { should include 'memcached' }
end
```

### Ensure all running services were updated since January 1, 2018

```ruby
describe habitat_services.where { release <= '20180101000000' } do
  it { should_not exist }
end
```

### Ensure gcc is not a dependency of any service

```ruby
# One way - list all services, insist none have a dependency on gcc
describe habitat_services do
  its('dependency_names') { should_not include 'core/gcc' }
end

# Another way - list all services with a dependency on gcc, insist there are none
describe habitat_services.where { dependency_names.include?('core/gcc') } do
  it { should_not exist }
end
```

### Search for services, then examine them in detail using `habitat_service`

```ruby
# Use the plural resource as a data lookup (not as a test)...
habitat_services.where { origin != 'core' }.habitat_service_params.each do |params|
  # ... then use the singular resource to do in-depth testing
  describe habitat_service(params) do
    its('release') { should_not be_standalone }
  end
end
```

## Limitations

### API versus CLI access

Habitat exposes certain data via the CLI, and other data via the HTTP Gateway API. To enjoy the full functionality of this resource, use a set of credentials that includes the API. Limited data is available by CLI. See the [train-habitat](https://github.com/inspec/train-habitat) documentation for more details.

If you use the CLI interface without the API, unavailable properties will return empty arrays or `nil`, and unavailable filter criteria will never match. See each property and filter criteria for details.

## Availability

### Installation

This resource is in the `inspec-habitat` resource pack. You can use the resource by setting an InSpec profile dependency on the resource pack. See [inspec-habitat instructions](https://github.com/inspec/inspec-habitat#installation).

### Version

This resource was first available in version 0.1.0 of the resource pack.

## Resource Parameters

[Resource parameters](/inspec/glossary/#resource-parameter) are arguments passed to the resource in the control code.

This resource does not accept resource parameters, which is typical for plural resources.

## Filter Criteria

[Filter criteria](/inspec/glossary/#filter-criteria) are used to select which services you wish to examine. If no filter criteria are used, all services are selected.

### dependency_names

An array of strings in the form `origin/name`. Each string is the qualified name of a dependency of a service that is being filtered.

Requires API connection; not available (never matches) via CLI.

```ruby
describe habitat_services.where { dependency_names.include?('core/gcc') } do
  it { should_not exist }
end
```

### name

String. The (unqualified) name of the service under consideration.

```ruby
# No services named *ftp* permitted
describe habitat_services.where(name: /ftp/) do
  it { should_not exist }
end
```

### origin

String. The name of the origin that created the package that backs the service under consideration.

```ruby
# Examine only services released by Chef
describe habitat_services.where(origin: 'chef') do
  its('topologies') { should_not include 'standalone' }
end
```

### release

String. A 14-digit timestamp, in the format `YYYYMMDDHHMmmSS`. The timestamp reflects the time at which the package backing the service was released. These strings are sortable and comparable.

```ruby
# Examine packages older than Jan 1 2018
describe habitat_services.where { release < '20180101000000' } do
  its('update_strategies' ) { should_not include 'none' }
end

# Examine packages older than 1 year
describe habitat_services.where { Date.parse(release[0..7]) < Date.today - 365 } do
  its('update_strategies' ) { should_not include 'none' }
end

# Another way
describe habitat_services.where { release < (Date.today - 365).strftime('%Y%m%d000000') } do
  its('update_strategies' ) { should_not include 'none' }
end

```

### topology

String reflecting the topology of the service. Values include `standalone` and `leader` (for leader-follower). See [the Habitat docs](https://www.habitat.sh/docs/using-habitat/#topologies) for implications of these values.

```ruby
# HA or the highway
describe habitat_services.where(topology: 'standalone') do
  it { should_not exist }
end
```

### update_strategy

String reflecting how the software package backing the service should be updated. Values include `none`, `rolling`, and `at-once`. See [the Habitat docs](https://www.habitat.sh/docs/using-habitat/#using-updates) for implications of these values.

Requires API connection; not available (never matches) via CLI.

```ruby
# No YOLO
describe habitat_services.where(update_strategy: 'at-once') do
  it { should_not exist }
end
```

## Properties

Use [properties](/inspec/glossary/#property) to create tests that compare an expected to value to the actual value.

### count

Number. The count of services that matched the filter criteria.

```ruby
# Expect 12 total
describe habitat_services do
  its(count) { should cmp 12 }
end

describe habitat_services.where(update_strategy: 'at-once') do
  it { should_not exist }
  its(count) { should cmp 0 } # Same as `should_not exist`
end
```

### dependency_names

Array of strings in the form `origin/name`. Each string is the qualified name of a dependency of a service that was selected by the filter criteria. This list is de-duplicated.

Requires API connection; not available (always an empty array) via CLI.

```ruby
describe habitat_services do
  its('dependency_names') { should_not include 'core/gcc' }
end
```

### habitat_service_params

Hash. Returns a set of options that can be passed directly to `habitat_service` (singular) to load an individual service for in-depth analysis.

```ruby
# Use the plural resource as a data lookup (not as a test)...
habitat_services.where { origin != 'core' }.habitat_service_params.each do |params|
  # ... then use the singular resource to do in-depth testing
  describe habitat_service(params) do
    its('release') { should_not be_standalone }
  end
end
```

### names

Array of strings. The unqualified name of the service, such as 'httpd'. This list is de-duplicated, though a name is almost always unique anyway.

```ruby
describe habitat_services do
  its('names') { should include 'httpd' }
  its('names') { should include 'memcached' }
  its('names') { should_not include 'telnetd' }
end
```

### origins

Array of strings. The names of the origins that created the packages that backs the services that were matched.
This list is de-duplicated.

```ruby
# Only allow core and mycorp-packaged services
describe habitat_services do
  its('origins') { should include 'core' }
  its('origins') { should include 'mycorp' }
  # Advanced usage - count an array-valued property
  its('origins', 'count') { should cmp 2 }
end
```

### releases

Array of strings. Each string is a 14-digit timestamp, in the format `YYYYMMDDHHMmmSS`. The timestamp reflects the time at which the package backing the service was released. These strings are sortable and comparable. This list is de-duplicated.

```ruby
# We had a bad Monday
describe habitat_services do
  its('releases') { should_not include '20180325000000' }
end
```

### topologies

Array of strings reflecting the topology of the matched services. Values include `standalone` and `leader` (for leader-follower). See [the Habitat docs](https://www.habitat.sh/docs/using-habitat/#topologies) for implications of these values. This list is de-duplicated.

```ruby
describe habitat_services do
  its('topologies') { should_not include 'standalone' }
end
```

### update_strategies

Array of strings reflecting how the software package backing the services that matched the filter should be updated. Values include `none`, `rolling`, and `at-once`. See [the Habitat docs](https://www.habitat.sh/docs/using-habitat/#using-updates) for implications of these values. This list is de-duplicated.

Requires API connection; not available (never matches) via CLI.

```ruby
# No YOLO
describe habitat_services do
  its('update_strategies') { should_not include 'at-once' }
end
```

## Matchers

Use [matchers](/inspec/glossary/#matcher) to create tests that test a true or false question.

InSpec includes a number of [universal matchers](/inspec/matchers/).

This resource does not define any resource-specific matchers.
