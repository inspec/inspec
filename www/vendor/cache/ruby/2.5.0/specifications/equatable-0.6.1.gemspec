# -*- encoding: utf-8 -*-
# stub: equatable 0.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "equatable".freeze
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/piotrmurach/equatable/issues", "changelog_uri" => "https://github.com/piotrmurach/equatable/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/equatable", "homepage_uri" => "https://github.com/piotrmurach/equatable", "source_code_uri" => "https://github.com/piotrmurach/equatable" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.date = "2019-06-26"
  s.description = "Extends Ruby objects with equality comparison and inspection methods. By including this module, a class indicates that its instances have explicit general contracts for `hash`, `==` and `eql?` methods.".freeze
  s.email = ["me@piotrmurach.com".freeze]
  s.homepage = "https://github.com/piotrmurach/equatable".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Extends Ruby objects with equality comparison and inspection methods.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.5.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.5.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
