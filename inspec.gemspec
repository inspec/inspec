# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'inspec'
  spec.version       = Inspec::VERSION
  spec.authors       = ['Dominik Richter']
  spec.email         = ['dominik.richter@gmail.com']
  spec.summary       = 'Infrastructure and compliance testing.'
  spec.description   = 'InSpec provides a framework for creating end-to-end infrastructure tests. You can use it for integration or even compliance testing. Create fully portable test profiles and use them in your workflow to ensure stability and security. Integrate InSpec in your change lifecycle for local testing, CI/CD, and deployment verification.'
  spec.homepage      = 'https://github.com/chef/inspec'
  spec.license       = 'Apache-2.0'

  spec.files = %w{
    README.md Rakefile MAINTAINERS.toml MAINTAINERS.md LICENSE inspec.gemspec
    Gemfile CHANGELOG.md .rubocop.yml
  } + Dir.glob(
    '{bin,docs,examples,lib}/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.executables   = %w{ inspec }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1'

  spec.add_dependency 'train', '>=0.22.0', '<1.0'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'json', '>= 1.8', '< 3.0'
  spec.add_dependency 'rainbow', '~> 2'
  spec.add_dependency 'method_source', '~> 0.8'
  spec.add_dependency 'rubyzip', '~> 1.1'
  spec.add_dependency 'rspec', '~> 3'
  spec.add_dependency 'rspec-its', '~> 1.2'
  spec.add_dependency 'pry', '~> 0'
  spec.add_dependency 'hashie', '~> 3.4'
  spec.add_dependency 'mixlib-log'
  spec.add_dependency 'sslshake', '~> 1.2'
  spec.add_dependency 'parallel', '~> 1.9'
  spec.add_dependency 'faraday', '>=0.9.0'
  spec.add_dependency 'toml', '~> 0.1'
  spec.add_dependency 'addressable', '~> 2.4'
  spec.add_dependency 'parslet', '~> 1.5'
  spec.add_dependency 'semverse'
end
