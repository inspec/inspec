# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inifile'

Gem::Specification.new do |spec|
  spec.name          = "inifile"
  spec.version       = IniFile::VERSION
  spec.authors       = ["Tim Pease"]
  spec.email         = ["tim.pease@gmail.com"]
  spec.summary       = %q{INI file reader and writer}
  spec.description   = %q{INI file reader and writer}
  spec.description   = %q{IniFile is a pure ruby gem that can read and write most INI file formats}
  spec.homepage      = "https://rubygems.org/gems/inifile"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bones",      "~> 3.8"
  spec.add_development_dependency "bones-git",  "~> 1.3"
end
