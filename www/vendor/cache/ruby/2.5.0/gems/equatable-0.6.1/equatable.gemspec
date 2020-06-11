lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'equatable/version'

Gem::Specification.new do |spec|
  spec.name          = "equatable"
  spec.version       = Equatable::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.summary       = %q{Extends Ruby objects with equality comparison and inspection methods.}
  spec.description   = %q{Extends Ruby objects with equality comparison and inspection methods. By including this module, a class indicates that its instances have explicit general contracts for `hash`, `==` and `eql?` methods.}
  spec.homepage      = "https://github.com/piotrmurach/equatable"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "#{spec.homepage}/issues",
      "changelog_uri"     => "#{spec.homepage}/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/equatable",
      "homepage_uri"      => spec.homepage,
      "source_code_uri"   => spec.homepage
    }
  end
  spec.files         = Dir['{lib,spec,examples}/**/*.rb']
  spec.files        += Dir['tasks/*', 'equatable.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.8.7'

  spec.add_development_dependency 'bundler', '>= 1.5.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rake'
end
