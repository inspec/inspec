lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec"
  spec.version       = Inspec::VERSION
  spec.authors       = ["Chef InSpec Team"]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = <<-EOT
InSpec provides a framework for creating end-to-end infrastructure tests. You can use it for integration or even compliance testing. Create fully portable test profiles and use them in your workflow to ensure stability and security. Integrate InSpec in your change lifecycle for local testing, CI/CD, and deployment verification.

Packaged distributions of Progress® Chef® products obtained from RubyGems are made available pursuant to the Progress Chef EULA at https://www.chef.io/end-user-license-agreement, unless there is an executed agreement in effect between you and Progress that covers the Progress Chef products ("Master Agreement"), in which case the Master Agreement shall govern.

Source code obtained from the Chef GitHub repository is made available under Apache-2.0, a copy of which is included.

  EOT

  spec.homepage      = "https://github.com/inspec/inspec"
  spec.license       = "LicenseRef-Chef-EULA"
  spec.require_paths = ["lib"]

  # We want to support ruby 3.0 as Chef is using ruby to support AIX and we want to make sure InSpec works with it. (Ref: https://github.com/chef/chef/pull/13207)
  # TODO: Once we have Chef working fully with ruby 3.1 we can drop ruby 3.0
  spec.required_ruby_version = ">= 3.0.3"

  # ONLY the aws/azure/gcp files. The rest will come in from inspec-core
  # the gemspec is necessary for appbundler so don't remove it
  spec.files =
    Dir.glob("{{lib,etc}/**/*,Gemfile,inspec.gemspec}")
      .grep(/aws|azure|gcp|gemspec|Gemfile|inspec.gemspec/)
      .reject { |f| File.directory?(f) }

  spec.add_dependency "inspec-core", "= #{Inspec::VERSION}"

  # spec.add_dependency "train", "~> 3.10"

  # cookstyle support for inspec check
  # Added here not because they are compiled, but to keep chef-client lightweight
  spec.add_dependency "cookstyle"
  spec.add_dependency "rake"

  # progress bar streaming reporter plugin support
  spec.add_dependency "progress_bar", "~> 1.3.3"

  # Used for Azure profile until integrated into train
  spec.add_dependency "faraday_middleware", ">= 0.12.2", "< 1.1"

  # Train plugins we ship with InSpec
  spec.add_dependency "train-habitat",    "~> 0.1"
  spec.add_dependency "train-aws",        "~> 0.2"
  spec.add_dependency "train-winrm",      "~> 0.2"
  spec.add_dependency "train-kubernetes", "~> 0.1"

  spec.add_dependency "mongo", "= 2.13.2" # 2.14 introduces a broken symlink in mongo-2.14.0/spec/support/ocsp

end
