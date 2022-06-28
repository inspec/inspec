lib = File.expand_path("lib", __dir__)
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
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7"

  # ONLY the aws/azure/gcp files. The rest will come in from inspec-core
  # the gemspec is necessary for appbundler so don't remove it
  spec.files =
    Dir.glob("{{lib,etc}/**/*,Gemfile,inspec.gemspec}")
      .grep(/aws|azure|gcp|gemspec|Gemfile|inspec.gemspec/)
      .reject { |f| File.directory?(f) }

  spec.add_dependency "inspec-core", "= #{Inspec::VERSION}"

  spec.add_dependency "train", "~> 3.10"

  # cookstyle support for inspec check
  # Added here not because they are compiled, but to keep chef-client lightweight
  spec.add_dependency "cookstyle"
  spec.add_dependency "rake"

  # progress bar streaming reporter plugin support
  spec.add_dependency "progress_bar", "~> 1.3.3"

  # Used for Azure profile until integrated into train
  spec.add_dependency "faraday_middleware", ">= 0.12.2", "< 1.1"

  # Train plugins we ship with InSpec
  spec.add_dependency "train-habitat", "~> 0.1"
  spec.add_dependency "train-aws",     "~> 0.2"
  spec.add_dependency "train-winrm",   "~> 0.2"
  spec.add_dependency "mongo", "= 2.13.2" # 2.14 introduces a broken symlink in mongo-2.14.0/spec/support/ocsp

end
