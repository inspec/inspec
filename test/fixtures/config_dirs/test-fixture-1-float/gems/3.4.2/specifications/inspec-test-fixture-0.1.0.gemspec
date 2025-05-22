# stub: inspec-test-fixture 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "inspec-test-fixture".freeze
  s.version = "0.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["InSpec Engineering Team".freeze]
  s.date = "2018-08-17"
  s.description = "This gem is used to test the gem search and install capabilities of InSpec's plugin V2 system.  It is not a good example or starting point for plugin development.".freeze
  s.email = ["hello@chef.io".freeze]
  s.homepage = "https://github.com/inspec/inspec".freeze
  s.rubygems_version = "2.6.13".freeze
  s.summary = "A simple test plugin gem for InSpec".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_development_dependency(%q{rake}.freeze, ["~> 10.0".freeze])
end
