# -*- encoding: utf-8 -*-
# stub: train-winrm 0.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "train-winrm".freeze
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef InSpec Team".freeze]
  s.date = "2019-12-31"
  s.description = "Allows applictaions using Train to speak to Windows using Remote Management; handles authentication, cacheing, and SDK dependency management.".freeze
  s.email = ["inspec@chef.io".freeze]
  s.homepage = "https://github.com/inspec/train-winrm".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Windows WinRM API Transport for Train".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<winrm>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<winrm>.freeze, ["~> 2.0"])
      s.add_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<winrm>.freeze, ["~> 2.0"])
    s.add_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
  end
end
