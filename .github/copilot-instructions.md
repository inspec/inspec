# GitHub Copilot Instructions for InSpec

## Project Overview

InSpec is an open-source infrastructure testing framework written in Ruby. It provides a domain-specific language (DSL) for describing security and compliance rules that can be shared between software engineers, operations, and security engineers.

## Architecture

This is a **multi-gem Ruby project** with the following structure:

- **inspec** - Main framework gem (inspec.gemspec)
- **inspec-core** - Core functionality without CLI (inspec-core.gemspec)  
- **inspec-bin** - Command-line interface (inspec-bin/inspec-bin.gemspec)
- **inspec-core-bin** - Alternative CLI distribution

## Key Development Patterns

### CLI Option Management

CLI options are defined in `lib/inspec/base_cli.rb` using Thor framework:

```ruby
def self.target_options
  option :target, aliases: :t, type: :string,
    desc: "Simple targeting option using URIs"
  option :backend, aliases: :b, type: :string,
    desc: "Choose a backend: local, ssh, winrm, docker"
  # WinRM-specific options
  option :winrm_transport, type: :string, default: "negotiate",
    desc: "Specify which transport to use (WinRM)"
  option :kerberos_service, type: :string,
    desc: "Specify Kerberos service principal name (WinRM Kerberos)"
  option :kerberos_realm, type: :string,
    desc: "Specify Kerberos realm (WinRM Kerberos)"  
  option :socks_proxy, type: :string,
    desc: "Specify SOCKS proxy in format host:port (WinRM)"
end
```

### Transport Layer Integration

InSpec uses the Train library for remote connections. Transport options flow from CLI → Config → Train → specific transport plugins (train-winrm, train-ssh, etc.).

### Resource Development

InSpec resources are located in `lib/inspec/resources/` and follow this pattern:

```ruby
require "inspec/resource"

module Inspec::Resources
  class MyResource < Inspec.resource(1)
    name "my_resource"
    supports platform: "unix"
    
    desc "Description of the resource"
    example "
      describe my_resource do
        it { should exist }
      end
    "
    
    def exist?
      # Implementation
    end
  end
end
```

## Code Style Guidelines

### Ruby Version Compatibility

The project supports multiple Ruby versions with conditional dependencies:

```ruby
# In Gemfile - version-specific constraints
if RUBY_VERSION < "3.1.0"
  gem "dry-types", "<= 1.7.2"
  gem "dry-core", "> 1.0.0", "< 1.1.0"
end
```

### String Literals and Frozen Strings

Files use `# frozen_string_literal: true`. Be careful with string mutations:

```ruby
# Good - create mutable string
out = +""
out << data

# Bad - may cause frozen string errors  
out = ""
out << data
```

### Error Handling Patterns

```ruby
# InSpec-specific exceptions
begin
  # operation
rescue Inspec::ProfileSignatureRequired
  $stderr.puts exception.message
  Inspec::UI.new.exit(:signature_required)
rescue Inspec::Error
  $stderr.puts exception.message
  exit(1)
end
```

## Testing Patterns

### Unit Tests
Located in `test/unit/` with Minitest framework:

```ruby
require "helper"

class TestSomething < Minitest::Test
  def test_functionality
    # Test implementation
  end
end
```

### Integration Tests  
Located in `test/integration/` for testing real connections and resources.

### Test Helpers
Use `test/helper.rb` for common test utilities and mocks.

## Remote Connection Development

### WinRM Connection Testing
```bash
# Basic WinRM test
bundle exec inspec shell -t winrm://user@host --password 'pass' --winrm-transport plaintext

# Kerberos authentication  
bundle exec inspec shell -t winrm://user@host \
  --winrm-transport kerberos \
  --kerberos-service host \
  --kerberos-realm DOMAIN.COM

# With SOCKS proxy
bundle exec inspec shell -t winrm://user@host --socks-proxy proxy:1080
```

### Train Integration
When adding new transport options:

1. Add CLI options in `base_cli.rb`
2. Ensure options flow through `Inspec::Config`
3. Update relevant train plugin (train-winrm, etc.)
4. Add integration tests

## Packaging and Distribution

### Habitat Packaging
`habitat/plan.sh` defines Habitat package build:

```bash
pkg_name=inspec
pkg_origin=chef
pkg_version=$(cat "$PLAN_CONTEXT/../VERSION")
pkg_deps=(core/ruby3_1 core/git core/bash)

do_build() {
  gem build inspec.gemspec
  gem build inspec-core.gemspec
}
```

### Expeditor Automation
`.expeditor/config.yml` manages:
- Automated version bumping
- Multi-channel releases (unstable → current → stable)  
- RubyGems publication
- Habitat package promotion
- Docker image building

## Dependencies and Bundler

### GitHub API Authentication
Required to avoid rate limiting:
```bash
bundle config --global github.com username:token
export GITHUB_TOKEN=ghp_your-token
```

### Local Development Dependencies
```ruby
# In Gemfile for local train-winrm development
gem "train-winrm", path: "/path/to/local/train-winrm"
```

## Common File Locations

- **CLI definitions**: `lib/inspec/base_cli.rb`
- **Main runner**: `lib/inspec/runner.rb`  
- **Resources**: `lib/inspec/resources/`
- **Profiles**: `lib/inspec/profile.rb`
- **Configuration**: `lib/inspec/config.rb`
- **UI utilities**: `lib/inspec/ui.rb`
- **Version**: `VERSION` file in project root

## Development Commands

```bash
# Run tests
bundle exec rake test

# Build gems locally
bundle exec rake build

# Test CLI changes
bundle exec inspec version
bundle exec inspec shell -t local://

# Check style
bundle exec chefstyle

# Generate coverage
bundle exec rake coverage
```

## Key Dependencies

- **Thor** - CLI framework
- **Train** - Transport abstraction layer
- **RSpec** - Testing framework (for some tests)
- **Minitest** - Primary testing framework  
- **Chef ecosystem gems** - Various Chef/InSpec utilities

## When Writing Code

1. **Follow existing patterns** in similar files
2. **Add tests** for new functionality
3. **Update CLI help** for new options
4. **Consider Ruby version compatibility**
5. **Use InSpec-specific error handling**
6. **Follow frozen string literal patterns**
7. **Test with multiple transport types** when relevant

## Security Considerations

- **Never log passwords** or sensitive data
- **Validate user inputs** especially for remote connections  
- **Use proper authentication methods** for different transports
- **Handle network timeouts** gracefully
- **Escape shell commands** properly

This project emphasizes **security**, **compliance testing**, and **cross-platform compatibility**, so always consider these aspects when contributing code.
