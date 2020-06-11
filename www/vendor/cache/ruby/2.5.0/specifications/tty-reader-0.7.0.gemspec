# -*- encoding: utf-8 -*-
# stub: tty-reader 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-reader".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/piotrmurach/tty-reader/issues", "changelog_uri" => "https://github.com/piotrmurach/tty-reader/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/tty-reader", "homepage_uri" => "https://piotrmurach.github.io/tty", "source_code_uri" => "https://github.com/piotrmurach/tty-reader" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-11-24"
  s.description = "A set of methods for processing keyboard input in character, line and multiline modes. It maintains history of entered input with an ability to recall and re-edit those inputs. It lets you register to listen for keystroke events and trigger custom key events yourself.".freeze
  s.email = ["me@piotrmurach.com".freeze]
  s.homepage = "https://piotrmurach.github.io/tty".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "A set of methods for processing keyboard input in character, line and multiline modes.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wisper>.freeze, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<tty-screen>.freeze, ["~> 0.7"])
      s.add_runtime_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<wisper>.freeze, ["~> 2.0.0"])
      s.add_dependency(%q<tty-screen>.freeze, ["~> 0.7"])
      s.add_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.5.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<wisper>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<tty-screen>.freeze, ["~> 0.7"])
    s.add_dependency(%q<tty-cursor>.freeze, ["~> 0.7"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.5.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
