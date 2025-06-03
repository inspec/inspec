lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec-bin/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-bin"
  spec.version       = InspecBin::VERSION
  spec.authors       = ["Chef InSpec Core Engineering "]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = "InSpec executable for inspec gem. Use of this executable may require accepting a license agreement."
  spec.homepage      = "https://github.com/inspec/inspec/tree/main/inspec-bin"
  spec.license       = "Apache-2.0"

  spec.require_paths = ["lib"]
  # Chef will provide AIX support with ruby 3.0 in separate builds with older versions of InSpec 5, hence we can drop ruby 3.0 support
  spec.required_ruby_version = ">= 3.1.0"

  spec.add_dependency "inspec", "= #{InspecBin::VERSION}"
  spec.add_development_dependency "rake"

  spec.files = %w{README.md LICENSE Gemfile} + Dir.glob("*.gemspec") +
    Dir.glob("{lib,bin}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = "bin"
  spec.executables = %w{inspec}

end
