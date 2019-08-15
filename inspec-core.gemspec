lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-core"
  spec.version       = Inspec::VERSION
  spec.authors       = ["Dominik Richter"]
  spec.email         = ["dominik.richter@gmail.com"]
  spec.summary       = "Just InSpec"
  spec.description   = "Core InSpec, local support only. See `inspec` for full support."
  spec.homepage      = "https://github.com/chef/inspec"
  spec.license       = "Apache-2.0"

  spec.files = %w{README.md LICENSE} + Dir.glob("{bin,lib,etc}/**/*", File::FNM_DOTMATCH)
    .reject { |f| File.directory?(f) || f =~ /aws|azure|gcp/ || f =~ %r{lib/plugins/.*/test/} }

  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_dependency "train-core", "~> 3.0"
  spec.add_dependency "license-acceptance", ">= 0.2.13", "< 2.0"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "json-schema", "~> 2.8"
  spec.add_dependency "method_source", "~> 0.8"
  spec.add_dependency "rubyzip", "~> 1.1"
  spec.add_dependency "rspec", "~> 3"
  spec.add_dependency "rspec-its", "~> 1.2"
  spec.add_dependency "hashie", "~> 3.4"
  spec.add_dependency "mixlib-log"
  spec.add_dependency "pry", "~> 0"
  spec.add_dependency "sslshake", "~> 1.2"
  spec.add_dependency "parallel", "~> 1.9"
  spec.add_dependency "faraday", ">=0.9.0"
  spec.add_dependency "faraday_middleware", "~> 0.12.2"
  spec.add_dependency "tomlrb", "~> 1.2"
  spec.add_dependency "addressable", "~> 2.4"
  spec.add_dependency "parslet", "~> 1.5"
  spec.add_dependency "semverse"
  spec.add_dependency "htmlentities"
  spec.add_dependency "multipart-post"
  spec.add_dependency "tty-table", "~> 0.10"
  spec.add_dependency "tty-prompt", "~> 0.17"
  spec.add_dependency "term-ansicolor"
end
