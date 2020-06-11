# -*- encoding: utf-8 -*-
# stub: tty-box 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-box".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.date = "2019-10-08"
  s.description = "Draw various frames and boxes in your terminal interface.".freeze
  s.email = ["me@piotrmurach.com".freeze]
  s.homepage = "https://piotrmurach.github.io/tty".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Draw various frames and boxes in your terminal interface.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pastel>.freeze, ["~> 0.7.2"])
      s.add_runtime_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
      s.add_runtime_dependency(%q<strings>.freeze, ["~> 0.1.6"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<pastel>.freeze, ["~> 0.7.2"])
      s.add_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
      s.add_dependency(%q<strings>.freeze, ["~> 0.1.6"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<pastel>.freeze, ["~> 0.7.2"])
    s.add_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
    s.add_dependency(%q<strings>.freeze, ["~> 0.1.6"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
