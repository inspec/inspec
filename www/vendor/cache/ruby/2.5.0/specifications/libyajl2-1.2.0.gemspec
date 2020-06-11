# -*- encoding: utf-8 -*-
# stub: libyajl2 1.2.0 ruby lib
# stub: ext/libyajl2/extconf.rb

Gem::Specification.new do |s|
  s.name = "libyajl2".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["lamont-granquist".freeze]
  s.date = "2014-11-22"
  s.description = "Installs a vendored copy of libyajl2 for distributions which lack it".freeze
  s.email = ["lamont@getchef.com".freeze]
  s.extensions = ["ext/libyajl2/extconf.rb".freeze]
  s.files = ["ext/libyajl2/extconf.rb".freeze]
  s.homepage = "https://github.com/opscode/libyajl2-gem".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Installs a vendored copy of libyajl2 for distributions which lack it".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<mime-types>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_development_dependency(%q<ffi>.freeze, ["~> 1.9"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9"])
      s.add_dependency(%q<mime-types>.freeze, ["~> 1.16"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
      s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9"])
    s.add_dependency(%q<mime-types>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14"])
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
  end
end
