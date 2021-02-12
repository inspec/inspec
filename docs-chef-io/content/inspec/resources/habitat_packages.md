+++
title = "habitat_packages resource"
draft = false
gh_repo = "inspec"
platform = "habitat"

[menu]
  [menu.inspec]
    title = "habitat_packages"
    identifier = "inspec/resources/habitat/habitat_packages.md habitat_packages resource"
    parent = "inspec/resources/habitat"
+++

Use the `habitat_package` (singular) InSpec audit resource to perform in-depth auditing of a single package.

Use the `habitat_packages` (plural) InSpec audit resource to list Habitat packages, and perform bulk operations.

## Availability

### Status: EXPERIMENTAL

This resource, like all of the inspec-habitat resource pack, is in the early stages of research and development. Functionality may be defective, incomplete, or be withdrawn in the future. If you are interested in helping this project mature, please join the conversation or contribute code at the [inspec-habitat project](https://github.com/inspec/inspec-habitat).

### Connecting to Habitat

To configure `inspec` to be able to communicate with Chef Habitat, be sure [to follow the instructions](https://github.com/inspec/inspec-habitat#configuring-inspec-to-reach-habitat) regarding configuring the connection options. This will prevent 'unsupported platform' errors.

## Examples

### Ensure httpd and memcached are installed

```ruby
describe habitat_packages do
  its('names') { should include 'httpd' }
  its('names') { should include 'memcached' }
end
```

### Ensure all packages were updated since January 1, 2018

```ruby
describe habitat_packages.where { release <= '20180101000000' } do
  it { should_not exist }
end
```

### Search for packages, then examine them in detail using `habitat_package`

```ruby
# Use the plural resource as a data lookup (not as a test)...
habitat_packages.where { origin != 'core' }.habitat_package_params.each do |params|
  # ... then use the singular resource to do in-depth testing
  describe habitat_package(params) do
    # ...
  end
end
```

## Limitations

### API versus CLI access

Habitat exposes certain data via the CLI, and other data via the HTTP Gateway API. This resource is not available via the API; you must provide CLI credentials to use the resource. See the [train-habitat](https://github.com/inspec/train-habitat) documentation for more details.

If you use this resource without the CLI, this resource will always return zero matches.

## Availability

### Installation

This resource is in the `inspec-habitat` resource pack. You can use this resource by setting an InSpec profile dependency on the resource pack. See [inspec-habitat instructions](https://github.com/inspec/inspec-habitat#installation).

### Version

This resource was first available in version 0.1.0 of the resource pack.

## Resource Parameters

[Resource parameters](/inspec/glossary/#resource-parameter) are arguments passed to the resource in the control code.

This resource does not accept resource parameters, which is typical for plural resources.

## Filter Criteria

[Filter criteria](/inspec/glossary/#filter-criteria) are used to select which packages you wish to examine. If no filter criteria are used, all packages are selected.

### name

String. The (unqualified) name of the package under consideration.

```ruby
# No packages named *ftp* permitted
describe habitat_packages.where(name: /ftp/) do
  it { should_not exist }
end
```

### origin

String. The name of the origin that created the package under consideration.

```ruby
# Examine only packages released by Chef
describe habitat_packages.where(origin: 'bad-origin') do
  it { should_not exist }
end
```

### release

String. A 14-digit timestamp, in the format `YYYYMMDDHHMmmSS`. The timestamp reflects the time at which the package backing the package was released. These strings are sortable and comparable.

```ruby
# Examine packages older than Jan 1 2018
describe habitat_packages.where { release < '20180101000000' } do
  it { should_not exist }
end

# Examine packages older than 1 year
describe habitat_packages.where { Date.parse(release[0..7]) < Date.today - 365 } do
  it { should_not exist }
end

# Another way
describe habitat_packages.where { release < (Date.today - 365).strftime('%Y%m%d000000') } do
  it { should_not exist }
end

```

## Properties

Use [properties](/inspec/glossary/#property) to create tests that compare an expected value to the actual value.

### count

Number. The count of packages that matched the filter criteria.

```ruby
# Expect 12 total
describe habitat_packages do
  its(count) { should cmp 12 }
end
```

### habitat_package_params

`Array` of `Hash`es. Returns a list of a set of options that can be passed directly to `habitat_package` (singular) to load an individual package for in-depth analysis.

```ruby
# Use the plural resource as a data lookup (not as a test)...
habitat_packages.where { origin != 'core' }.habitat_package_params.each do |params|
  # ... then use the singular resource to do in-depth testing
  describe habitat_package(params) do
    its('release') { should_not be < '201904090000' }
  end
end
```

### names

Array of strings. The unqualified name of the package, such as 'httpd'. This list is de-duplicated, though a name is almost always unique anyway.

```ruby
describe habitat_packages do
  its('names') { should include 'httpd' }
  its('names') { should include 'memcached' }
  its('names') { should_not include 'telnetd' }
end
```

### origins

Array of strings. The names of the origins that created the matched packages.
This list is de-duplicated.

```ruby
# Only allow core and mycorp-packaged packages
describe habitat_packages do
  its('origins') { should include 'core' }
  its('origins') { should include 'mycorp' }
  # Advanced usage - count an array-valued property
  its('origins', 'count') { should cmp 2 }
end
```

### releases

Array of strings. Each string is a 14-digit timestamp, in the format `YYYYMMDDHHMmmSS`. The timestamp reflects the time at which the package backing the package was released. These strings are sortable and comparable. This list is de-duplicated.

```ruby
# We had a bad Monday
describe habitat_packages do
  its('releases') { should_not include '20180325000000' }
end
```

## Matchers

Use [matchers](/inspec/glossary/#matcher) to create tests that test a true or false question.

InSpec includes a number of [universal matchers](/inspec/matchers/).

This resource does not define any resource-specific matchers.
