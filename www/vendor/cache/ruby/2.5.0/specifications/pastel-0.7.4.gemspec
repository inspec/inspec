# -*- encoding: utf-8 -*-
# stub: pastel 0.7.4 ruby lib

Gem::Specification.new do |s|
  s.name = "pastel".freeze
  s.version = "0.7.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/piotrmurach/pastel/issues", "changelog_uri" => "https://github.com/piotrmurach/pastel/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/pastel", "homepage_uri" => "https://ttytoolkit.org", "source_code_uri" => "https://github.com/piotrmurach/pastel" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-05-08"
  s.description = "Terminal strings styling with intuitive and clean API.".freeze
  s.email = ["piotr@piotrmurach.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "CHANGELOG.md".freeze, "LICENSE.txt".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "https://ttytoolkit.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Terminal strings styling with intuitive and clean API.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<equatable>.freeze, ["~> 0.6"])
      s.add_runtime_dependency(%q<tty-color>.freeze, ["~> 0.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.0"])
    else
      s.add_dependency(%q<equatable>.freeze, ["~> 0.6"])
      s.add_dependency(%q<tty-color>.freeze, ["~> 0.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.0"])
    end
  else
    s.add_dependency(%q<equatable>.freeze, ["~> 0.6"])
    s.add_dependency(%q<tty-color>.freeze, ["~> 0.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0"])
  end
end
