# -*- encoding: utf-8 -*-
# stub: winrm 2.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "winrm".freeze
  s.version = "2.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Wanek".freeze, "Paul Morton".freeze, "Matt Wrock".freeze, "Shawn Neal".freeze]
  s.date = "2019-12-26"
  s.description = "    Ruby library for Windows Remote Management\n".freeze
  s.email = ["dan.wanek@gmail.com".freeze, "paul@themortonsonline.com".freeze, "matt@mattwrock.com".freeze, "sneal@sneal.net".freeze]
  s.executables = ["rwinrm".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/rwinrm".freeze]
  s.homepage = "https://github.com/WinRb/WinRM".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rdoc_options = ["-x".freeze, "test/".freeze, "-x".freeze, "examples/".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Ruby library for Windows Remote Management".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>.freeze, [">= 2.1.2"])
      s.add_runtime_dependency(%q<erubi>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<gssapi>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<gyoku>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<httpclient>.freeze, ["~> 2.2", ">= 2.2.0.2"])
      s.add_runtime_dependency(%q<logging>.freeze, [">= 1.6.1", "< 3.0"])
      s.add_runtime_dependency(%q<nori>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.3", "< 13"])
      s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
      s.add_runtime_dependency(%q<rubyntlm>.freeze, ["~> 0.6.0", ">= 0.6.1"])
    else
      s.add_dependency(%q<builder>.freeze, [">= 2.1.2"])
      s.add_dependency(%q<erubi>.freeze, ["~> 1.8"])
      s.add_dependency(%q<gssapi>.freeze, ["~> 1.2"])
      s.add_dependency(%q<gyoku>.freeze, ["~> 1.0"])
      s.add_dependency(%q<httpclient>.freeze, ["~> 2.2", ">= 2.2.0.2"])
      s.add_dependency(%q<logging>.freeze, [">= 1.6.1", "< 3.0"])
      s.add_dependency(%q<nori>.freeze, ["~> 2.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 10.3", "< 13"])
      s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
      s.add_dependency(%q<rubyntlm>.freeze, ["~> 0.6.0", ">= 0.6.1"])
    end
  else
    s.add_dependency(%q<builder>.freeze, [">= 2.1.2"])
    s.add_dependency(%q<erubi>.freeze, ["~> 1.8"])
    s.add_dependency(%q<gssapi>.freeze, ["~> 1.2"])
    s.add_dependency(%q<gyoku>.freeze, ["~> 1.0"])
    s.add_dependency(%q<httpclient>.freeze, ["~> 2.2", ">= 2.2.0.2"])
    s.add_dependency(%q<logging>.freeze, [">= 1.6.1", "< 3.0"])
    s.add_dependency(%q<nori>.freeze, ["~> 2.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 10.3", "< 13"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.51.0"])
    s.add_dependency(%q<rubyntlm>.freeze, ["~> 0.6.0", ">= 0.6.1"])
  end
end
