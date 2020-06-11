# -*- encoding: utf-8 -*-
# stub: middleman-core 4.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-core".freeze
  s.version = "4.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Reynolds".freeze, "Ben Hollis".freeze, "Karl Freeman".freeze]
  s.date = "2020-05-27"
  s.description = "A static site generator. Provides dozens of templating languages (Haml, Sass, Compass, Slim, CoffeeScript, and more). Makes minification, compression, cache busting, Yaml data (and more) an easy part of your development cycle.".freeze
  s.email = ["me@tdreyno.com".freeze, "ben@benhollis.net".freeze, "karlfreeman@gmail.com".freeze]
  s.homepage = "http://middlemanapp.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Hand-crafted frontend development".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.4.5", "< 3"])
      s.add_runtime_dependency(%q<tilt>.freeze, ["~> 2.0.9"])
      s.add_runtime_dependency(%q<erubis>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<fast_blank>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<servolux>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2", "< 6.0"])
      s.add_runtime_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.0"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_runtime_dependency(%q<memoist>.freeze, ["~> 0.14"])
      s.add_runtime_dependency(%q<listen>.freeze, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<i18n>.freeze, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<fastimage>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<sassc>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<uglifier>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<execjs>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<contracts>.freeze, ["~> 0.13.0"])
      s.add_runtime_dependency(%q<hashie>.freeze, ["~> 3.4"])
      s.add_runtime_dependency(%q<hamster>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<backports>.freeze, ["~> 3.6"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rack>.freeze, [">= 1.4.5", "< 3"])
      s.add_dependency(%q<tilt>.freeze, ["~> 2.0.9"])
      s.add_dependency(%q<erubis>.freeze, [">= 0"])
      s.add_dependency(%q<fast_blank>.freeze, [">= 0"])
      s.add_dependency(%q<parallel>.freeze, [">= 0"])
      s.add_dependency(%q<servolux>.freeze, [">= 0"])
      s.add_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4.2", "< 6.0"])
      s.add_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.0"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_dependency(%q<memoist>.freeze, ["~> 0.14"])
      s.add_dependency(%q<listen>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<i18n>.freeze, ["~> 0.9.0"])
      s.add_dependency(%q<fastimage>.freeze, ["~> 2.0"])
      s.add_dependency(%q<sassc>.freeze, ["~> 2.0"])
      s.add_dependency(%q<uglifier>.freeze, ["~> 3.0"])
      s.add_dependency(%q<execjs>.freeze, ["~> 2.0"])
      s.add_dependency(%q<contracts>.freeze, ["~> 0.13.0"])
      s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
      s.add_dependency(%q<hamster>.freeze, ["~> 3.0"])
      s.add_dependency(%q<backports>.freeze, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 1.4.5", "< 3"])
    s.add_dependency(%q<tilt>.freeze, ["~> 2.0.9"])
    s.add_dependency(%q<erubis>.freeze, [">= 0"])
    s.add_dependency(%q<fast_blank>.freeze, [">= 0"])
    s.add_dependency(%q<parallel>.freeze, [">= 0"])
    s.add_dependency(%q<servolux>.freeze, [">= 0"])
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.2", "< 6.0"])
    s.add_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.0"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
    s.add_dependency(%q<memoist>.freeze, ["~> 0.14"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<i18n>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<fastimage>.freeze, ["~> 2.0"])
    s.add_dependency(%q<sassc>.freeze, ["~> 2.0"])
    s.add_dependency(%q<uglifier>.freeze, ["~> 3.0"])
    s.add_dependency(%q<execjs>.freeze, ["~> 2.0"])
    s.add_dependency(%q<contracts>.freeze, ["~> 0.13.0"])
    s.add_dependency(%q<hashie>.freeze, ["~> 3.4"])
    s.add_dependency(%q<hamster>.freeze, ["~> 3.0"])
    s.add_dependency(%q<backports>.freeze, ["~> 3.6"])
  end
end
