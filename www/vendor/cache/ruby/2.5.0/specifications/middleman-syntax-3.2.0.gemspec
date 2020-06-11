# -*- encoding: utf-8 -*-
# stub: middleman-syntax 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-syntax".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ben Hollis".freeze]
  s.date = "2019-07-06"
  s.description = "Code syntax highlighting plugin via rouge for Middleman".freeze
  s.email = ["ben@benhollis.net".freeze]
  s.homepage = "https://github.com/middleman/middleman-syntax".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Code syntax highlighting plugin via rouge for Middleman".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<middleman-core>.freeze, [">= 3.2"])
      s.add_runtime_dependency(%q<rouge>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<aruba>.freeze, ["~> 0.5.1"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 1.3.1"])
      s.add_development_dependency(%q<fivemat>.freeze, [">= 0"])
      s.add_development_dependency(%q<haml>.freeze, [">= 0"])
      s.add_development_dependency(%q<kramdown>.freeze, [">= 0"])
      s.add_development_dependency(%q<slim>.freeze, [">= 0"])
    else
      s.add_dependency(%q<middleman-core>.freeze, [">= 3.2"])
      s.add_dependency(%q<rouge>.freeze, ["~> 3.2"])
      s.add_dependency(%q<aruba>.freeze, ["~> 0.5.1"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.1"])
      s.add_dependency(%q<fivemat>.freeze, [">= 0"])
      s.add_dependency(%q<haml>.freeze, [">= 0"])
      s.add_dependency(%q<kramdown>.freeze, [">= 0"])
      s.add_dependency(%q<slim>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<middleman-core>.freeze, [">= 3.2"])
    s.add_dependency(%q<rouge>.freeze, ["~> 3.2"])
    s.add_dependency(%q<aruba>.freeze, ["~> 0.5.1"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 1.3.1"])
    s.add_dependency(%q<fivemat>.freeze, [">= 0"])
    s.add_dependency(%q<haml>.freeze, [">= 0"])
    s.add_dependency(%q<kramdown>.freeze, [">= 0"])
    s.add_dependency(%q<slim>.freeze, [">= 0"])
  end
end
