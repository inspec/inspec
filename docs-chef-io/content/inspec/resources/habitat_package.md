+++
title = "habitat_package resource"
draft = false
gh_repo = "inspec"
platform = "habitat"

[menu]
  [menu.inspec]
    title = "habitat_package"
    identifier = "inspec/resources/habitat/habitat_package.md habitat_package resource"
    parent = "inspec/resources/habitat"
+++

Use the `habitat_package` InSpec audit resource to test properties of a single Habitat package.

## Availability

### Status: EXPERIMENTAL

This resource, like all of the inspec-habitat resource pack, is in the early stages of research and development. Functionality may be defective, incomplete, or be withdrawn in the future. If you are interested in helping this project mature, please join the conversation or contribute code at the [inspec-habitat project](https://github.com/inspec/inspec-habitat).

### Connecting to Habitat

To configure `inspec` to be able to communicate with Chef Habitat, be sure [to follow the instructions](https://github.com/inspec/inspec-habitat#configuring-inspec-to-reach-habitat) regarding configuring the connection options. This will prevent 'unsupported platform' errors.

## Examples

### Check for core/httpd package

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  it             { should exist }
  its('version') { should eq '2.4.35'}
  its('release') { should eq '20190307151146'}
end
```

## Limitations

### API versus CLI access

Habitat exposes certain data via the CLI, and other data via the HTTP Gateway API.

This resource is **only** available using CLI credentials.

If you use the API interface without the CLI, instances of this resource will behave as if the sought-after package was not found.

### Behavior when not found

If the package is not found, then this resource behaves as follows:

- `it { should exist }` will be a failing test. Check this test if you are unsure if the resource will exist; it is guaranteed to be reliable in the future.
- `name`, `origin`, `version`, and `release` will continue to return their values as set in the resource parameters. This allows output messaging to refer to the missing package clearly.
- `identifier` will return as much information as it can assemble from `name`, `origin`, `version`, and `release`.
- All other single-value properties will return `nil`.
- All array- and hash-valued properties will return empty objects.
- All matchers will return `false`.

### Behavior when multiple packages match

A system can have multiple versions of the same-named package installed (or even multiple releases of the same version of the same named package). For this reason, if you under-specify the resource parameters, you may match with multiple packages. Under these conditions, this resource will throw an `ArgumentError` exception, and the resource test will be recorded as a failure.

To avoid this possibility, fully specify the resource parameters, including `version` and `release`.

To list all installed versions and releases of a named package, use the plural resource `habitat_packages`.

## Availability

### Installation

This resource is in the `inspec-habitat` resource pack. You can use the resource by setting an InSpec profile dependency on this resource pack. See [inspec-habitat instructions](https://github.com/inspec/inspec-habitat#installation)

### Version

This resource was first available in version 0.1.0 of the resource pack.

## Resource Parameters

Use [resource parameters](/inspec/glossary/#resource-parameter) to identify the particular package you wish to test.

`habitat_package` can accept a single resource parameter, a `String` package identifier; or it can accept a `Hash` of identifier components.

### As a single `String`

Using this approach, you pass the package identifier as a single `String`. It should consist of `<origin>/<name>/<version>/<release>`, though `version` and `release` are optional.

```ruby
describe habitat_package('core/httpd') do
  it { should exist }
end
```

### Using individual identifier components as a `Hash`

This approach can make it easier to write resource tests that use InSpec inputs or Ruby variables.

#### origin

`String`. The name of the `origin` (distribution facility) that provides the package.

```ruby
# Most common origin is 'core', publicly distributed packages created by Chef
describe habitat_package(origin: 'core', name: 'httpd') do
  it { should exist }
end

# Your company might run a private origin
describe habitat_package(origin: 'mycorp', name: 'secret-sauce') do
  it { should exist }
end
```

#### name

`String`. The name (unique within the namespace of the origin) of the package. This may match more than one package; see [Behavior when multiple packages match](#behavior-when-multiple-packages-match).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  it { should exist }
end
```

#### release

`String`, a 14-digit timestamp of the form 'YYYMMDDHHmmSS'. The release number of the package as determined by the packager of the software. If you provide this, you must also provide the version; with all four components, the match is guarenteed to be unique.

```ruby
describe habitat_package(origin: 'core', name: 'httpd', version: '2.3.5', release: '20190307151146') do
  it { should exist }
end
```

#### version

`String`, typically of the form `1.2.3` but formats vary. The version of the package as determined by the author of the software. This may match more than one package, because multiple releases of the same version may be co-installed; see [Behavior when multiple packages match](#behavior-when-multiple-packages-match).

```ruby
describe habitat_package(origin: 'core', name: 'httpd', version: '2.3.5') do
  it { should exist }
end
```

## Properties

Use [properties](/inspec/glossary/#property) to create tests that compare an expected value to the actual value.

### identifier

`String`. The origin, name, version (if known) and release (if known) concatenated with `/`, to create the package identifier.

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('identifier') { should eq 'core/httpd/2.4.35/20190307151146' }
end
```

### name

`String`. The name of the package, as passed in via the resource parameter. Always available, even if the resource was not found. See also [origin](#origin) and [version](#version).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('name') { should cmp 'httpd' }
end
```

### origin

`String`. The origin name of the package, as passed in via the resource parameter. Always available, even if the resource was not found. See also [name](#name) and [version](#version).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('origin') { should cmp 'core' }
end
```

### pkg_id

`String`. The full package identifier of the package, in the form `origin/name/version/release`. See also [name](#name) and [version](#version).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('pkg_id') { should cmp 'core/httpd/2.4.35/20190307151146' }
end
```

### release

`String`. The release number of the package, as assigned by the packager. These values are always strings, but are 14-digit timestamps. See also [version](#version).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('release') { should be >= '20190307151146' }
end
```

### version

`String`. The version of the package, as assigned by the maintainer of the package project. While many versions are of the 3-digit form, there is no set rule, and exceptions are common. See also [release](#release).

```ruby
describe habitat_package(origin: 'core', name: 'httpd') do
  its('version') { should be >=  '2.2' }
end
```

## Matchers

Use [matchers](/inspec/glossary/#matcher) to create tests that test a true or false question.

InSpec includes a number of [universal matchers](/inspec/matchers/). See below for matchers specific to this resource.

This resource does not provide any resource-specific matchers.
