# -*- encoding: utf-8 -*-
# stub: faraday_middleware 0.12.2 ruby lib

Gem::Specification.new do |s|
  s.name = "faraday_middleware".freeze
  s.version = "0.12.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Erik Michaels-Ober".freeze, "Wynn Netherland".freeze]
  s.date = "2017-08-03"
  s.email = ["sferik@gmail.com".freeze, "wynn.netherland@gmail.com".freeze]
  s.homepage = "https://github.com/lostisland/faraday_middleware".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Various middleware for Faraday".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0.7.4", "< 1.0"])
    else
      s.add_dependency(%q<faraday>.freeze, [">= 0.7.4", "< 1.0"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, [">= 0.7.4", "< 1.0"])
  end
end
