lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-core"
  spec.version       = Inspec::VERSION
  spec.authors       = ["Chef InSpec Team"]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing. Core library."
  spec.description   = <<-EOT
InSpec provides a framework for creating end-to-end infrastructure tests. You can use it for integration or even compliance testing. Create fully portable test profiles and use them in your workflow to ensure stability and security. Integrate InSpec in your change lifecycle for local testing, CI/CD, and deployment verification.
This has local support only. See the `inspec` gem for full support.

Packaged distributions of Progress® Chef® products obtained from RubyGems are made available pursuant to the Progress Chef EULA at https://www.chef.io/end-user-license-agreement, unless there is an executed agreement in effect between you and Progress that covers the Progress Chef products ("Master Agreement"), in which case the Master Agreement shall govern.

Source code obtained from the Chef GitHub repository is made available under Apache-2.0, a copy of which is included.

  EOT
  spec.homepage      = "https://github.com/inspec/inspec"
  spec.license       = "LicenseRef-Chef-EULA"
  spec.require_paths = ["lib"]

  # We want to support ruby 3.0 as Chef is using ruby to support AIX and we want to make sure InSpec works with it. (Ref: https://github.com/chef/chef/pull/13207)
  # TODO: Once we have Chef working fully with ruby 3.1 we can drop ruby 3.0
  spec.required_ruby_version = ">= 3.0.3"

  # the gemfile and gemspec are necessary for appbundler so don't remove it
  spec.files =
    Dir.glob("{{lib,etc}/**/*,LICENSE,Chef-EULA,Gemfile,inspec-core.gemspec}")
      .grep_v(%r{(?<!inspec-init/templates/profiles/)(aws|azure|gcp|alicloud)})
      .grep_v(%r{lib/plugins/.*/test/})
      .reject { |f| File.directory?(f) }

  # Implementation dependencies
  spec.add_dependency "chef-telemetry",           "~> 1.0", ">= 1.0.8" # 1.0.8+ removes the http dep
  spec.add_dependency "license-acceptance",       ">= 0.2.13", "< 3.0"
  # TODO: We should remove the thor pinning in next upcoming releases currently it's breaking our unit test in cli_args_test for aliases due to
  # recent changes made in thor library REF: https://github.com/rails/thor/releases/tag/v1.3.0 & https://github.com/rails/thor/pull/800
  spec.add_dependency "thor",                     ">= 0.20", "< 1.3.0"
  spec.add_dependency "method_source",            ">= 0.8", "< 2.0"
  spec.add_dependency "rubyzip",                  ">= 1.2.2", "< 3.0"
  spec.add_dependency "rspec",                    ">= 3.9", "<= 3.12"
  spec.add_dependency "rspec-its",                "~> 1.2"
  spec.add_dependency "pry",                      "~> 0.13"
  spec.add_dependency "hashie",                   ">= 3.4", "< 6.0"
  spec.add_dependency "mixlib-log",               "~> 3.0"
  spec.add_dependency "sslshake",                 "~> 1.2"
  spec.add_dependency "parallel",                 "~> 1.9"
  spec.add_dependency "faraday",                  ">= 1", "< 3"
  spec.add_dependency "faraday-follow_redirects", "~> 0.3"
  spec.add_dependency "tty-table",                "~> 0.10"
  spec.add_dependency "tty-prompt",               "~> 0.17"
  spec.add_dependency "tomlrb",                   ">= 1.2", "< 2.1"
  spec.add_dependency "addressable",              "~> 2.4"
  spec.add_dependency "parslet",                  ">= 1.5", "< 2.0" # Pinned < 2.0, see #5389
  spec.add_dependency "semverse",                 "~> 3.0"
  spec.add_dependency "multipart-post",           "~> 2.0"

  # spec.add_dependency "train-core", ">= 3.11.0"
  spec.add_dependency "chef-licensing", ">= 0.7.5"
end
