# -*- encoding: utf-8 -*-
# stub: train-habitat 0.2.13 ruby lib

Gem::Specification.new do |s|
  s.name = "train-habitat".freeze
  s.version = "0.2.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef InSpec Team".freeze]
  s.date = "2019-11-15"
  s.description = "Allows applications using Train to speak to Habitat.".freeze
  s.email = ["inspec@chef.io".freeze]
  s.homepage = "https://github.com/inspec/train-habitat".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Habitat API Transport for Train".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
