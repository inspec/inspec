lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec-bin/version"

# This is just link inspec-bin, but relies on inspec-core instead of inspec
# inspec-core is a stripped-down version of the inspec gem with fewer exotic dependencies

Gem::Specification.new do |spec|
  spec.name          = "inspec-core-bin" # dallas multi-pass
  spec.version       = "#{InspecBin::VERSION}.rc"
  spec.authors       = ["Chef InSpec Core Engineering "]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = <<-EOT
InSpec executable for inspec-core gem. Use of this executable may require accepting a license agreement.

Packaged distributions of Progress® Chef® products obtained from RubyGems are made available pursuant to the Progress Chef EULA at https://www.chef.io/end-user-license-agreement, unless there is an executed agreement in effect between you and Progress that covers the Progress Chef products ("Master Agreement"), in which case the Master Agreement shall govern.

Source code obtained from the Chef GitHub repository is made available under Apache-2.0, a copy of which is included.

  EOT

  spec.homepage      = "https://github.com/inspec/inspec/tree/main/inspec-bin"
  spec.license       = "LicenseRef-Chef-EULA"

  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.1.0"

  spec.add_dependency "inspec-core", "= #{InspecBin::VERSION}.rc"
  spec.add_development_dependency "rake"

  spec.files = %w{README.md LICENSE Gemfile} + ["inspec-core-bin.gemspec"] +
    Dir.glob("{lib,bin}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = "bin"
  spec.executables = %w{inspec}

end
