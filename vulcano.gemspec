# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vulcano'

Gem::Specification.new do |spec|
  spec.name          = "vulcano"
  spec.version       = Vulcano::VERSION
  spec.authors       = ["Dominik Richter"]
  spec.email         = ["dominik@vulcanosec.com"]
  spec.summary       = %q{Validate Vulcano compliance checks.}
  spec.description   = %q{Validate Vulcano compliance checks.}
  spec.homepage      = "https://github.com/..."
  spec.license       = "Proprietary"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "pry", "~> 0.10"

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'rainbow', '~> 2'
  spec.add_dependency 'serverspec', '~> 2.18'
  spec.add_dependency 'method_source', '~> 0.8'
  spec.add_dependency 'rubyzip', '~> 1.1'
  spec.add_dependency 'rspec', '~> 3.3'
end
