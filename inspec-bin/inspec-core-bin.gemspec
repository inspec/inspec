lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec-bin/version"

# This is just link inspec-bin, but relies on inspec-core instead of inspec
# inspec-core is a stripped-down version of the inspec gem with fewer exotic dependencies

Gem::Specification.new do |spec|
  spec.name          = "inspec-core-bin" # dallas multi-pass
  spec.version       = InspecBin::VERSION
  spec.authors       = ["Chef InSpec Core Engineering "]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = "InSpec executable for inspec-core gem. Use of this executable may require accepting a license agreement."
  spec.homepage      = "https://github.com/inspec/inspec/tree/main/inspec-bin"
  spec.license       = "Apache-2.0"

  spec.require_paths = ["lib"]
  # Chef will provide AIX support with ruby 3.0 in separate builds with older versions of InSpec 5, hence we can drop ruby 3.0 support
  spec.required_ruby_version = ">= 3.1.0"

  spec.add_dependency "inspec-core", "= #{InspecBin::VERSION}"
  spec.add_development_dependency "rake"

  spec.files = %w{README.md LICENSE Gemfile} + ["inspec-core-bin.gemspec"] +
    Dir.glob("{lib,bin}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = "bin"
  spec.executables = %w{inspec}

end
