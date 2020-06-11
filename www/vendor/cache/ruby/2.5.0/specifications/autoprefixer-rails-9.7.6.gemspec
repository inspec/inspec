# -*- encoding: utf-8 -*-
# stub: autoprefixer-rails 9.7.6 ruby lib

Gem::Specification.new do |s|
  s.name = "autoprefixer-rails".freeze
  s.version = "9.7.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ai/autoprefixer-rails/issues", "changelog_uri" => "https://github.com/ai/autoprefixer-rails/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/ai/autoprefixer-rails" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrey Sitnik".freeze]
  s.date = "2020-04-06"
  s.email = "andrey@sitnik.ru".freeze
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze, "CHANGELOG.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/ai/autoprefixer-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Parse CSS and add vendor prefixes to CSS rules usingvalues from the Can I Use website.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<standard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<execjs>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<standard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<standard>.freeze, [">= 0"])
  end
end
