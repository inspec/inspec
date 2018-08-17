# -*- encoding: utf-8 -*-
# stub: inspec-test-fixture 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "inspec-test-fixture"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["InSpec Engineering Team"]
  s.date = "2018-08-17"
  s.description = "This gem is used to test the gem search and install capabilities of InSpec's plugin V2 system.  It is not a good example or starting point for plugin development."
  s.email = ["hello@chef.io"]
  s.homepage = "https://github.com/inspec/inspec"
  s.rubygems_version = "2.5.1"
  s.summary = "A simple test plugin gem for InSpec"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
