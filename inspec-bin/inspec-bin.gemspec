lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inspec-bin/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-bin"
  spec.version       = "#{InspecBin::VERSION}.rc"
  spec.authors       = ["Chef InSpec Core Engineering "]
  spec.email         = ["inspec@chef.io"]
  spec.summary       = "Infrastructure and compliance testing."
  spec.description   = <<-EOT
InSpec executable for inspec gem. Use of this executable may require accepting a license agreement."

Packaged distributions of Progress® Chef® products obtained from RubyGems are made available pursuant to the Progress Chef EULA at https://www.chef.io/end-user-license-agreement, unless there is an executed agreement in effect between you and Progress that covers the Progress Chef products ("Master Agreement"), in which case the Master Agreement shall govern.

Source code obtained from the Chef GitHub repository is made available under Apache-2.0, a copy of which is included.

  EOT

  spec.homepage      = "https://github.com/inspec/inspec/tree/main/inspec-bin"
  spec.license       = "LicenseRef-Chef-EULA"

  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 3.1.0"

  spec.add_dependency "inspec", "= #{InspecBin::VERSION}.rc"
  spec.add_development_dependency "rake"

  spec.files = %w{README.md LICENSE Gemfile} + Dir.glob("*.gemspec") +
    Dir.glob("{lib,bin}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = "bin"
  spec.executables = %w{inspec}

end
