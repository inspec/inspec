lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'necromancer/version'

Gem::Specification.new do |spec|
  spec.name          = 'necromancer'
  spec.version       = Necromancer::VERSION
  spec.authors       = ['Piotr Murach']
  spec.email         = ['me@piotrmurach.com']
  spec.summary       = %q{Conversion from one object type to another with a bit of black magic.}
  spec.description   = %q{Conversion from one object type to another with a bit of black magic.}
  spec.homepage      = 'https://github.com/piotrmurach/necromancer'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata=)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
    spec.metadata["changelog_uri"] = "https://github.com/piotrmurach/necromancer/blob/master/CHANGELOG.md"
    spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/necromancer"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/piotrmurach/necromancer"
  end

  spec.files         = Dir['{lib,spec}/**/*.rb']
  spec.files        += Dir['tasks/*', 'necromancer.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '>= 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
