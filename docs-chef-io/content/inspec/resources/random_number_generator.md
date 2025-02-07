+++
title = "random_number_generator Resource"
platform = "os"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "random_number_generator"
    identifier = "inspec/resources/os/random_number_generator.md random_number_generator resource"
    parent = "inspec/resources/os"
+++

Use the `random_number_generator` resource to test Random Number Generator (RNG) configuration and state on Linux, macOS, FreeBSD, and Windows systems.

## Installation

{{< readfile file="content/inspec/reusable/md/inspec_installation.md" >}}

## Requirements

### Platform Support

- Linux
- macOS
- FreeBSD
- Generic Unix (basic support)

## Resource Parameters

This resource does not have any parameters.

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

{/* ### cng_properties

The `cng_properties` property tests the Cryptography Next Generation (CNG) properties on Windows.

```ruby
its('cng_properties') { should match /Microsoft Primitive Provider/ }
``` */}

> **Type:** String
>
> **Return Type:** String
>
> **Description:** Returns the CNG properties on Windows.

## Common Resource Functionality

{{< readfile file="content/inspec/reusable/md/resource_functionality.md" >}}

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

## Examples

### Linux RNG Configuration

```ruby
describe random_number_generator do
  # Basic availability
  it { should exist }
  it { should be_available }
  it { should be_hardware }
  it { should be_running }

  # Sources and entropy
  its('sources') { should include '/dev/random' }
  its('sources') { should include '/dev/urandom' }
  its('entropy') { should be > 1000 }

  # Services
  its('services') { should include 'rngd' }
  its('running') { should eq true }

  # Hardware checks
  its('type') { should eq 'hardware' }
  its('sources') { should include '/dev/hwrng' }
  its('active') { should_not be_nil }
end
```

### macOS RNG Configuration

```ruby
describe random_number_generator do
  # Basic checks
  it { should exist }
  it { should be_available }
  it { should be_csprng }
  it { should be_running }

  # Source verification
  its('sources') { should include '/dev/random' }
  its('active') { should eq '/dev/random' }

  # CSPRNG status checks
  its(%w[csprng_status system]) { should match(/^macOS/) }
  its(%w[csprng_status architecture]) { should match(/(Apple Silicon|Intel)/) }
  its(%w[csprng_status kernel]) { should_not be_nil }
  its(%w[csprng_status random_subsystem]) { should_not be_empty }

  # Architecture-specific checks
  describe 'when on Intel CPU' do
    before do
      skip unless its(%w[csprng_status architecture]) == 'Intel'
    end

    it 'should have RDRAND available' do
      expect(subject.sources).to include 'RDRAND'
    end
  end
end
```

{/* ### Windows RNG Configuration

```ruby
describe random_number_generator do
  # Basic checks
  it { should exist }
  it { should be_available }
  it { should be_running }
  
  # Services and API
  its('services') { should include 'CryptoSvc' }
  its('sources') { should include 'CryptoAPI' }
  
  # Type verification
  its('type') { should match(/hardware|csprng/) }
  
  # Hardware RNG sources
  describe 'hardware RNG availability' do
    it 'should have at least one hardware source' do
      expect(subject.sources).to include('TPM')
        .or(include('RDRAND'))
    end
  end
  
  # CNG properties
  its('cng_properties') { should match(/Microsoft Primitive Provider/) }
end
``` */}

### FreeBSD RNG Configuration

```rubydescribe random_number_generator do
  # Basic checks
  it { should exist }
  it { should be_available }
  it { should be_running }

  # Sources
  its('sources') { should include '/dev/random' }
  its('sources') { should include '/dev/urandom' }

  # Yarrow check
  its('active') { should eq 'Yarrow' }

  # Hardware RNG if available
  describe 'when hardware RNG is available' do
    it 'should have hardware sources' do
      expect(subject.sources).to include('RDRAND').or(include('intel-rng'))
    end
    its('type') { should eq 'hardware' }
  end
end
```

## Support Services

> **FIPS Mode:** In most cases, if the system has FIPS (Federal Information Processing Standards) enabled, services like `rngd` may be unable to run. For example, on Red Hat systems, `rngd` will not run when FIPS mode is enabled.

### Background on Support Services

The `random_number_generator` resource checks for the following support services:

- **rngd (random number generator daemon):** Feeds data from a hardware RNG into the kernel's entropy pool.
- **haveged (hardware volatile entropy gathering and expansion daemon):** Provides entropy using variations in CPU execution time.
- **jitterentropy:** Measures timing "jitter" in the system to create random data.

These services are available across various distributions and can be checked using `systemctl status <service_name>` or the equivalent for your platform.
