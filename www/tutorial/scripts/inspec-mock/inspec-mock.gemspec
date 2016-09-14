# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'inspec-mock'
  spec.version       = '0.1.0'
  spec.authors       = ['Chef Software, Inc']
  spec.summary       = 'Mock for InSpec.'
  spec.files = %w{
    inspec-mock.gemspec Gemfile
  } + Dir.glob(
    '{bin,lib}/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.executables   = %w{ inspec }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'inspec'
end
