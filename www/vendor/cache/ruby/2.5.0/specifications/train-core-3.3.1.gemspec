# -*- encoding: utf-8 -*-
# stub: train-core 3.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "train-core".freeze
  s.version = "3.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/inspec/train/issues", "changelog_uri" => "https://github.com/inspec/train/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/inspec/train", "source_code_uri" => "https://github.com/inspec/train" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef InSpec Team".freeze]
  s.date = "2020-06-10"
  s.description = "A minimal Train with a backends for ssh and winrm.".freeze
  s.email = ["inspec@chef.io".freeze]
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Transport interface to talk to a selected set of backends.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_runtime_dependency(%q<ffi>.freeze, ["!= 1.13.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 1.8", "< 3.0"])
      s.add_runtime_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
      s.add_runtime_dependency(%q<net-scp>.freeze, [">= 1.2", "< 4.0"])
      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 2.9", "< 7.0"])
    else
      s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_dependency(%q<ffi>.freeze, ["!= 1.13.0"])
      s.add_dependency(%q<json>.freeze, [">= 1.8", "< 3.0"])
      s.add_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
      s.add_dependency(%q<net-scp>.freeze, [">= 1.2", "< 4.0"])
      s.add_dependency(%q<net-ssh>.freeze, [">= 2.9", "< 7.0"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_dependency(%q<ffi>.freeze, ["!= 1.13.0"])
    s.add_dependency(%q<json>.freeze, [">= 1.8", "< 3.0"])
    s.add_dependency(%q<mixlib-shellout>.freeze, [">= 2.0", "< 4.0"])
    s.add_dependency(%q<net-scp>.freeze, [">= 1.2", "< 4.0"])
    s.add_dependency(%q<net-ssh>.freeze, [">= 2.9", "< 7.0"])
  end
end
