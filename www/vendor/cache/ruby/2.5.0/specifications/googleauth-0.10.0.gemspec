# -*- encoding: utf-8 -*-
# stub: googleauth 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "googleauth".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tim Emiola".freeze]
  s.date = "2019-10-09"
  s.description = "   Allows simple authorization for accessing Google APIs.\n   Provide support for Application Default Credentials, as described at\n   https://developers.google.com/accounts/docs/application-default-credentials\n".freeze
  s.email = "temiola@google.com".freeze
  s.homepage = "https://github.com/google/google-auth-library-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Google Auth Library for Ruby".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.12"])
      s.add_runtime_dependency(%q<jwt>.freeze, [">= 1.4", "< 3.0"])
      s.add_runtime_dependency(%q<memoist>.freeze, ["~> 0.16"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.11"])
      s.add_runtime_dependency(%q<os>.freeze, [">= 0.9", "< 2.0"])
      s.add_runtime_dependency(%q<signet>.freeze, ["~> 0.12"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.12"])
      s.add_dependency(%q<jwt>.freeze, [">= 1.4", "< 3.0"])
      s.add_dependency(%q<memoist>.freeze, ["~> 0.16"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1.11"])
      s.add_dependency(%q<os>.freeze, [">= 0.9", "< 2.0"])
      s.add_dependency(%q<signet>.freeze, ["~> 0.12"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.12"])
    s.add_dependency(%q<jwt>.freeze, [">= 1.4", "< 3.0"])
    s.add_dependency(%q<memoist>.freeze, ["~> 0.16"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.11"])
    s.add_dependency(%q<os>.freeze, [">= 0.9", "< 2.0"])
    s.add_dependency(%q<signet>.freeze, ["~> 0.12"])
  end
end
