+++
title = "random_number_generator resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "random_number_generator"
    identifier = "inspec/resources/os/random_number_generator.md random_number_generator resource"
    parent = "inspec/resources/os"
+++

Use the `random_number_generator` (RNG) Chef InSpec audit resource to test the presence and status of a Random Number Generator on the system.

## Availability

### Install

This resource is distributed with Chef InSpec.

### Version

This resource is available from InSpec version 1.0.0.

## Syntax

A `random_number_generator` resource block declares the resource and then one (or more) matchers.

```ruby
    describe random_number_generator do
      it { should exist }
      it { should be_available }
      its('type') { should match /hardware|cprng|software/ }
      its('sources') { should include '/dev/random' }
      its('entropy_available') { should be > 1000 }
      it { should have_sources }
      it { should have_support_services }
      it { should have_service_running }
    end
```

> Where
>
> - `it { should exist }` tests if the Random Number Generator exists.
> - `it { should be_available }` tests if the Random Number Generator is available.
> - `type`, `sources`, `entropy_available`, `cprng_status`, `cng_properties`, `has_sources`, `has_service_running`, and `has_support_services` are valid matchers for this resource.

## Properties

### type

The `type` property tests the type of the Random Number Generator.

```ruby
    its('type') { should match /hardware|cprng|software/ }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the type of the Random Number Generator, which can be `hardware`, `cprng` (on macOS), or `software`.

### sources

The `sources` property tests the sources of the Random Number Generator.

```ruby
    its('sources') { should include '/dev/random' }
```

> **Type:** Array
>
> **Return Type:** Array of Strings
>
> **Description:** Returns an array of sources used by the Random Number Generator, such as `/dev/random`.

### entropy_available

The `entropy_available` property tests the available entropy of the Random Number Generator.

```ruby
    its('entropy_available') { should be > 1000 }
```

> **Type:** Integer
>
> **Return Type:** Integer
>
> **Description:** Returns the amount of available entropy in the Random Number Generator.

### cprng_status

The `cprng_status` property tests the CPRNG status on macOS.

```ruby
    its('cprng_status') { should match /kern.random/ }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the status of the CPRNG on macOS.

### cng_properties

The `cng_properties` property tests the CNG properties on Windows.

```ruby
    its('cng_properties') { should match /Microsoft Primitive Provider/ }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the CNG properties on Windows.

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the presence and status of the Random Number Generator

```ruby
    describe random_number_generator do
      it { should exist }
      it { should be_available }
      its('type') { should match /hardware|cprng|software/ }
      its('sources') { should include '/dev/random' }
      its('entropy_available') { should be > 1000 }
      it { should have_sources }
      it { should have_support_services }
      it { should have_service_running }
    end
```

### Test macOS specific properties

```ruby
    describe random_number_generator do
      its('cprng_status') { should match /kern.random/ }
    end
```

### Test Windows specific properties

```ruby
    describe random_number_generator do
      its('cng_properties') { should match /Microsoft Primitive Provider/ }
    end
```

### Test Linux specific properties

```ruby
    describe random_number_generator do
      its('entropy_available') { should be > 1000 }
    end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following custom matchers.

### exist

The `exist` matcher tests if the Random Number Generator exists:

```ruby
    it { should exist }
```

### be_available

The `be_available` matcher tests if the Random Number Generator is available:

```ruby
    it { should be_available }
```

### have_sources

The `have_sources` matcher tests if the Random Number Generator has sources:

```ruby
    it { should have_sources }
```

### have_service_running

The `have_service_running` matcher tests if the Random Number Generator service is running:

```ruby
    it { should have_service_running }
```

### have_support_services

The `have_support_services` matcher tests if the Random Number Generator has support services:

```ruby
    it { should have_support_services }
```

## Support Services

> **FIPS Mode:** In most cases, if the system has FIPS (Federal Information Processing Standards) enabled, services like `rngd` may be unable to run. For example, on Red Hat systems, `rngd` will not run when FIPS mode is enabled.

### Background on Support Services

The `random_number_generator` resource checks for the following support services:

- **rngd (random number generator daemon):** Feeds data from a hardware RNG into the kernel's entropy pool.
- **haveged (hardware volatile entropy gathering and expansion daemon):** Provides entropy using variations in CPU execution time.
- **jitterentropy:** Measures timing "jitter" in the system to create random data.

These services are available across various distributions and can be checked using `systemctl status <service_name>` or the equivalent for your platform.

### be_hardware

The `be_hardware` matcher tests if the Random Number Generator type is hardware:

```ruby
    it { should be_hardware }
```

### be_software

The `be_software` matcher tests if the Random Number Generator type is software:

```ruby
    it { should be_software }
```

### be_cprng

The `be_cprng` matcher tests if the Random Number Generator type is CPRNG:

```ruby
    it { should be_cprng }
```
