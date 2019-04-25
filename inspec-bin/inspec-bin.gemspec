lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspec/version' # Always match inspec version

Gem::Specification.new do |spec|
  spec.name          = 'inspec-bin'
  spec.version       = Inspec::VERSION
  spec.authors       = ['Chef InSpec Core Engineering ']
  spec.email         = ['inspec@chef.io']
  spec.summary       = 'Infrastructure and compliance testing.'
  spec.description   = 'InSpec executable for inspec gem. Use of this executable requires a commercial relationship Chef Software.'
  spec.homepage      = 'https://github.com/inspec/inspec'
  spec.license       = 'Apache-2.0'

  # the gemfile and gemspec are necessary for appbundler so don't remove it
  spec.files = %w{Gemfile inspec-bin.gemspec LICENSE} + Dir.glob(
    '{bin,lib}/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4'
end
