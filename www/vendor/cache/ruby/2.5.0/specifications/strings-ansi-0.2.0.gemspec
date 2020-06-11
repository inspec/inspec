# -*- encoding: utf-8 -*-
# stub: strings-ansi 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "strings-ansi".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/piotrmurach/strings-ansi/issues", "changelog_uri" => "https://github.com/piotrmurach/strings-ansi/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/strings-ansi", "homepage_uri" => "https://github.com/piotrmurach/strings-ansi", "source_code_uri" => "https://github.com/piotrmurach/strings-ansi" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.date = "2019-11-12"
  s.description = "Methods for processing ANSI escape codes in strings.".freeze
  s.email = ["me@piotrmurach.com".freeze]
  s.homepage = "https://github.com/piotrmurach/strings-ansi".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Methods for processing ANSI escape codes in strings.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
