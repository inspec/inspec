lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec"
  spec.version       = Inspec::VERSION
  spec.authors       = ["Chef InSpec Team"]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = "InSpec provides a framework for creating end-to-end infrastructure tests. You can use it for integration or even compliance testing. Create fully portable test profiles and use them in your workflow to ensure stability and security. Integrate InSpec in your change lifecycle for local testing, CI/CD, and deployment verification."
  spec.homepage      = "https://github.com/inspec/inspec"
  spec.license       = "Apache-2.0"

  # the gemfile and gemspec are necessary for appbundler so don't remove it
  spec.files = %w{Gemfile inspec.gemspec README.md LICENSE} + Dir.glob(
    "{bin,lib,etc}/**/*", File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    .reject { |f| File.directory?(f) || f =~ %r{lib/plugins/.*/test/} }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_dependency "train", "~> 3.0" # Inspec 4 must have train 2+; 3+ if we include train-winrm
  # Train plugins we ship with InSpec
  spec.add_dependency "train-habitat", "~> 0.1"
  spec.add_dependency "train-aws", "~> 0.1"
  spec.add_dependency "train-winrm", "~> 0.2" # Requires train 3+

  # Implementation dependencies
  spec.add_dependency "license-acceptance", ">= 0.2.13", "< 2.0"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "json-schema", "~> 2.8"
  spec.add_dependency "method_source", "~> 0.8"
  spec.add_dependency "rubyzip", "~> 1.2", ">= 1.2.2"
  spec.add_dependency "rspec", "~> 3"
  spec.add_dependency "rspec-its", "~> 1.2"
  spec.add_dependency "pry", "~> 0"
  spec.add_dependency "hashie", "~> 3.4"
  spec.add_dependency "mixlib-log"
  spec.add_dependency "sslshake", "~> 1.2"
  spec.add_dependency "parallel", "~> 1.9"
  spec.add_dependency "faraday", ">=0.9.0"
  spec.add_dependency "tty-table", "~> 0.10"
  spec.add_dependency "tty-prompt", "~> 0.17"
  # Used for Azure profile until integrated into train
  spec.add_dependency "faraday_middleware", "~> 0.12.2"
  spec.add_dependency "tomlrb", "~> 1.2"
  spec.add_dependency "addressable", "~> 2.4"
  spec.add_dependency "parslet", "~> 1.5"
  spec.add_dependency "semverse"
  spec.add_dependency "htmlentities"
  spec.add_dependency "multipart-post"
  spec.add_dependency "term-ansicolor"
end
