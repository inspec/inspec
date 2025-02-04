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

This resource is available from InSpec version 6.8.26.

## Syntax

A `random_number_generator` resource block declares the resource and then one (or more) matchers.

```ruby
describe random_number_generator do
  it { should exist }
  it { should be_available }
  # Only test for hardware if not macOS
  it { should be_hardware } unless os[:family] == 'darwin'
  it { should have_sources }
  it { should have_support_services }
  it { should have_service_running }
  its('type') { should match(/hardware|csprng|software/) }
  its('sources') { should include '/dev/random' }
  its('active') { should_not be_nil }
  its('running') { should eq true }
  its('services') { should_not be_empty }
  its('entropy_available') { should be > 1000 } unless os[:family] == 'darwin'
end
```

## Properties

### type

The `type` property tests the type of the Random Number Generator.

```ruby
its('type') { should match(/hardware|csprng|software/) }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the type of the Random Number Generator, which can be `hardware`, `csprng` (on macOS), or `software`.

### sources

The `sources` property tests the sources of the Random Number Generator.

```ruby
its('sources') { should include '/dev/random' }
```

> **Type:** Array
>
> **Return Type:** Array of Strings
>
> **Description:** Returns an array of sources used by the Random Number Generator, such as `/dev/random`, `/dev/hwrng`, etc.

### active

The `active` property shows the currently active RNG source.

```ruby
its('active') { should eq '/dev/hwrng' }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the currently active RNG source. On Linux this might be `/dev/hwrng`, on macOS `/dev/random`, and on Windows it could be 'TPM', 'RDRAND', or 'CryptoAPI'.

### entropy_available

The `entropy_available` property tests the available entropy of the Random Number Generator.

```ruby
its('entropy_available') { should be > 1000 }
```

> **Type:** Integer
>
> **Return Type:** Integer or nil
>
> **Description:** Returns the amount of available entropy in the Random Number Generator. This is typically only available on Linux systems.

### running

The `running` property indicates if the RNG system is operational.

```ruby
its('running') { should eq true }
```

> **Type:** Boolean
>
> **Return Type:** Boolean
>
> **Description:** Returns true if the RNG system is operational, false otherwise.

### services

The `services` property lists the active RNG support services.

```ruby
its('services') { should include 'rngd' }
```

> **Type:** Array
>
> **Return Type:** Array of Strings
>
> **Description:** Returns an array of active RNG support services. On Linux these might include 'rngd', 'haveged', or 'jitterentropy'.

### csprng_status

The `csprng_status` property provides detailed information about the macOS Cryptographically Secure Pseudo-Random Number Generator (CSPRNG).

> **Type:** Hash
>
> **Return Type:** Hash with the following structure:
>
> ```ruby
> {
>   system: String,           # macOS version (e.g., "macOS 14.3")
>   architecture: String,     # "Apple Silicon" or "Intel"
>   kernel: String,          # Darwin kernel version and build info
>   random_subsystem: String # Kernel random subsystem status
> }
> ```
>
> **Description:** Returns system and RNG configuration details specific to macOS.

#### Example Usage

```ruby
# Test the structured status information (array-style access)
its(%w[csprng_status system]) { should include 'macOS' }
its(%w[csprng_status architecture]) { should match(/(Apple Silicon|Intel)/) }
its(%w[csprng_status kernel]) { should_not be_nil }
its(%w[csprng_status random_subsystem]) { should_not be_nil }

# Architecture-specific tests
its('sources') { should include 'RDRAND' } if its(%w[csprng_status architecture]) == 'Intel'
```

### cng_properties

The `cng_properties` property tests the Cryptography Next Generation (CNG) properties on Windows.

```ruby
its('cng_properties') { should match /Microsoft Primitive Provider/ }
```

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the CNG properties on Windows.

## Platform-Specific Examples

### Test Linux RNG Configuration

```ruby
describe random_number_generator do
  it { should exist }
  it { should be_available }
  it { should be_hardware }
  its('type') { should eq 'hardware' }
  its('sources') { should include '/dev/hwrng' }
  its('active') { should eq '/dev/hwrng' }
  its('entropy_available') { should be > 1000 }
  its('services') { should include 'rngd' }
  its('running') { should eq true }
end
```

### Test macOS RNG Configuration

```ruby
describe random_number_generator do
  it { should exist }
  it { should be_available }
  it { should be_csprng }
  its('type') { should eq 'csprng' }
  its('sources') { should include '/dev/random' }
  its('active') { should eq '/dev/random' }
  its('running') { should eq true }
  its('entropy_available') { should be_nil }

  its(%w[csprng_status system]) { should include 'macOS' }
  its(%w[csprng_status architecture]) { should match(/(Apple Silicon|Intel)/) }
end
```

### Test Windows RNG Configuration

```ruby
describe random_number_generator do
  it { should exist }
  it { should be_available }
  its('type') { should match(/hardware|csprng/) }
  its('sources') { should include 'TPM' }
  its('active') { should_not be_nil }
  its('running') { should eq true }
  its('services') { should eq ['CryptoSvc'] }
  its('cng_properties') { should match(/Microsoft Primitive Provider/) }
end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following custom matchers.

### exist

The `exist` or `exists` matcher tests if the Random Number Generator exists:

```ruby
it { should exist }
```

### be_available

The `be_available` matcher tests if the Random Number Generator is available:

```ruby
it { should be_available }
```

### be_hardware

The `be_hardware` matcher tests if the Random Number Generator type is hardware based:

```ruby
it { should be_hardware }
```

### be_software

The `be_software` matcher tests if the Random Number Generator type is software based:

```ruby
it { should be_software }
```

### be_csprng

The `be_csprng` matcher tests if the Random Number Generator is a Cryptographically Secure Pseudo-Random Number Generator:

```ruby
it { should be_csprng }
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
