lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspec/version'

Gem::Specification.new do |spec|
  spec.name          = 'inspec-aws'
  spec.version       = Inspec::VERSION
  spec.authors       = ['Dominik Richter']
  spec.email         = ['dominik.richter@gmail.com']
  spec.summary       = 'Provides AWS support for InSpec'
  spec.description   = 'Allows InSpec to verify the state of your AWS cloud infrastructure.'
  spec.homepage      = 'https://github.com/chef/inspec'
  spec.license       = 'Apache-2.0'

  spec.files = %w{LICENSE inspec-aws.gemspec} +
               Dir.glob('lib/{resource_support/aws,resources/aws}/**/*',
                        File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency 'inspec-core'
  spec.add_dependency 'train-aws'

end
