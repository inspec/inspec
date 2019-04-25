lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspec-bin/version'

Gem::Specification.new do |spec|
  spec.name          = 'inspec-bin'
  spec.version       = InspecBin::VERSION
  spec.authors       = ['Chef InSpec Core Engineering ']
  spec.email         = ['inspec@chef.io']
  spec.summary       = 'Infrastructure and compliance testing.'
  spec.description   = 'InSpec executable for inspec gem. Use of this executable requires a commercial relationship Chef Software.'
  spec.homepage      = 'https://github.com/inspec/inspec'
  spec.license       = 'Apache-2.0'

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'

  spec.add_dependency 'inspec', "= #{InspecBin::VERSION}"
  spec.add_development_dependency 'rake'

  spec.files = %w{Rakefile LICENSE} + Dir.glob('*.gemspec') +
               Dir.glob('{lib}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.bindir = 'bin'
  spec.executables = %w{inspec}

end
