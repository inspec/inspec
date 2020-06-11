# -*- encoding: utf-8 -*-
# stub: timeliness 0.3.10 ruby lib

Gem::Specification.new do |s|
  s.name = "timeliness".freeze
  s.version = "0.3.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Meehan".freeze]
  s.date = "2019-02-05"
  s.description = "Fast date/time parser with customisable formats, timezone and I18n support.".freeze
  s.email = "adam.meehan@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "CHANGELOG.rdoc".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/adzap/timeliness".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Date/time parsing for the control freak.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<tzinfo>.freeze, [">= 0.3.31"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
      s.add_development_dependency(%q<i18n>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.2"])
      s.add_dependency(%q<tzinfo>.freeze, [">= 0.3.31"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<timecop>.freeze, [">= 0"])
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.2"])
    s.add_dependency(%q<tzinfo>.freeze, [">= 0.3.31"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<timecop>.freeze, [">= 0"])
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
  end
end
