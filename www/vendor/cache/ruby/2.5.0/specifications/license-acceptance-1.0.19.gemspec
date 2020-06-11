# -*- encoding: utf-8 -*-
# stub: license-acceptance 1.0.19 ruby lib

Gem::Specification.new do |s|
  s.name = "license-acceptance".freeze
  s.version = "1.0.19"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["tyler-ball".freeze]
  s.date = "2020-04-14"
  s.description = "Chef End User License Agreement Acceptance for Ruby products".freeze
  s.email = ["tball@chef.io".freeze]
  s.homepage = "https://github.com/chef/license-acceptance/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Chef End User License Agreement Acceptance".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pastel>.freeze, ["~> 0.7"])
      s.add_runtime_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<tty-box>.freeze, ["~> 0.3"])
      s.add_runtime_dependency(%q<tty-prompt>.freeze, ["~> 0.18"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.12"])
      s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_development_dependency(%q<pry-stack_explorer>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<mixlib-cli>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<thor>.freeze, [">= 0.20", "< 2.0"])
      s.add_development_dependency(%q<climate_control>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<chefstyle>.freeze, [">= 0"])
    else
      s.add_dependency(%q<pastel>.freeze, ["~> 0.7"])
      s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
      s.add_dependency(%q<tty-box>.freeze, ["~> 0.3"])
      s.add_dependency(%q<tty-prompt>.freeze, ["~> 0.18"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.12"])
      s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_dependency(%q<pry-stack_explorer>.freeze, ["~> 0.4"])
      s.add_dependency(%q<mixlib-cli>.freeze, ["~> 1.7"])
      s.add_dependency(%q<thor>.freeze, [">= 0.20", "< 2.0"])
      s.add_dependency(%q<climate_control>.freeze, ["~> 0.2"])
      s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<pastel>.freeze, ["~> 0.7"])
    s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
    s.add_dependency(%q<tty-box>.freeze, ["~> 0.3"])
    s.add_dependency(%q<tty-prompt>.freeze, ["~> 0.18"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.12"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
    s.add_dependency(%q<pry-stack_explorer>.freeze, ["~> 0.4"])
    s.add_dependency(%q<mixlib-cli>.freeze, ["~> 1.7"])
    s.add_dependency(%q<thor>.freeze, [">= 0.20", "< 2.0"])
    s.add_dependency(%q<climate_control>.freeze, ["~> 0.2"])
    s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
  end
end
