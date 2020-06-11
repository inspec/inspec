# -*- encoding: utf-8 -*-
# stub: middleman-cli 4.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-cli".freeze
  s.version = "4.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Reynolds".freeze, "Ben Hollis".freeze]
  s.date = "2020-05-27"
  s.description = "A static site generator. Provides dozens of templating languages (Haml, Sass, Compass, Slim, CoffeeScript, and more). Makes minification, compression, cache busting, Yaml data (and more) an easy part of your development cycle.".freeze
  s.email = ["me@tdreyno.com".freeze, "ben@benhollis.net".freeze]
  s.executables = ["middleman".freeze]
  s.files = ["bin/middleman".freeze]
  s.homepage = "http://middlemanapp.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Hand-crafted frontend development".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0.17.0", "< 2.0"])
    else
      s.add_dependency(%q<thor>.freeze, [">= 0.17.0", "< 2.0"])
    end
  else
    s.add_dependency(%q<thor>.freeze, [">= 0.17.0", "< 2.0"])
  end
end
