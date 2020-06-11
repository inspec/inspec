# -*- encoding: utf-8 -*-
# stub: rspec-its 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-its".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rspec/rspec-its/issues", "changelog_uri" => "https://github.com/rspec/rspec-its/blob/v1.3.0/Changelog.md", "documentation_uri" => "https://www.rubydoc.info/gems/rspec-its/1.3.0", "mailing_list_uri" => "https://groups.google.com/forum/#!forum/rspec", "source_code_uri" => "https://github.com/rspec/rspec-its" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Peter Alfvin".freeze]
  s.date = "2019-04-09"
  s.description = "RSpec extension gem for attribute matching".freeze
  s.email = ["palfvin@gmail.com".freeze]
  s.homepage = "https://github.com/rspec/rspec-its".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Provides \"its\" method formerly part of rspec-core".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-core>.freeze, [">= 3.0.0"])
      s.add_runtime_dependency(%q<rspec-expectations>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["> 1.3.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1.0"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 1.3.8"])
      s.add_development_dependency(%q<aruba>.freeze, ["~> 0.6.2"])
    else
      s.add_dependency(%q<rspec-core>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rspec-expectations>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<bundler>.freeze, ["> 1.3.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1.0"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.8"])
      s.add_dependency(%q<aruba>.freeze, ["~> 0.6.2"])
    end
  else
    s.add_dependency(%q<rspec-core>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rspec-expectations>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["> 1.3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1.0"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.8"])
    s.add_dependency(%q<aruba>.freeze, ["~> 0.6.2"])
  end
end
