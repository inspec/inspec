$:.push File.expand_path("../lib", __FILE__)
require "gyoku/version"

Gem::Specification.new do |s|
  s.name        = "gyoku"
  s.version     = Gyoku::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Daniel Harrington"
  s.email       = "me@rubiii.com"
  s.homepage    = "https://github.com/savonrb/#{s.name}"
  s.summary     = "Translates Ruby Hashes to XML"
  s.description = "Gyoku translates Ruby Hashes to XML"
  s.required_ruby_version = '>= 1.9.2'

  s.rubyforge_project = "gyoku"
  s.license = "MIT"

  s.add_dependency "builder", ">= 2.1.2"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
