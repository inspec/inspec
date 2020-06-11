# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-syntax/version"

Gem::Specification.new do |s|
  s.name = "middleman-syntax"
  s.version = Middleman::Syntax::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ben Hollis"]
  s.email = ["ben@benhollis.net"]
  s.homepage = "https://github.com/middleman/middleman-syntax"
  s.summary = %q{Code syntax highlighting plugin via rouge for Middleman}
  s.description = %q{Code syntax highlighting plugin via rouge for Middleman}
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -z -- {fixtures,features}/*`.split("\0")
  s.require_paths = ["lib"]
  s.add_runtime_dependency("middleman-core", [">= 3.2"])
  s.add_runtime_dependency("rouge", ["~> 3.2"])
  s.add_development_dependency("aruba", "~> 0.5.1")
  s.add_development_dependency("cucumber", "~> 1.3.1")
  s.add_development_dependency("fivemat")
  s.add_development_dependency("haml")
  s.add_development_dependency("kramdown")
  s.add_development_dependency("slim")
end
