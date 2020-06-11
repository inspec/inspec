# -*- encoding: utf-8 -*-
# stub: padrino-support 0.13.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "padrino-support".freeze
  s.version = "0.13.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Padrino Team".freeze, "Nathan Esquenazi".freeze, "Davide D'Agostino".freeze, "Arthur Chiu".freeze, "Igor Bochkariov".freeze]
  s.date = "2017-06-10"
  s.description = "A number of support methods and extensions for Padrino framework".freeze
  s.email = "padrinorb@gmail.com".freeze
  s.homepage = "http://www.padrinorb.com".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Support for padrino".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.1"])
  end
end
