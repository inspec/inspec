lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google/apis/version'

Gem::Specification.new do |spec|
  spec.name          = 'google-api-client'
  spec.version       = Google::Apis::VERSION
  spec.authors       = ['Steven Bazyl', 'Tim Emiola', 'Sergio Gomes', 'Bob Aman']
  spec.email         = ['sbazyl@google.com']
  spec.summary       = 'Client for accessing Google APIs'
  spec.homepage      = 'https://github.com/google/google-api-ruby-client'
  spec.license       = 'Apache-2.0'
  spec.metadata      = {
    "documentation_uri" => "https://googleapis.dev/ruby/google-api-client/v#{Google::Apis::VERSION}"
  }

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .reject { |f| f.match(%r{^(spec|script)/|^api_names_out}) }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib generated]

  spec.required_ruby_version = '~> 2.4'

  spec.add_runtime_dependency 'representable', '~> 3.0'
  spec.add_runtime_dependency 'retriable', '>= 2.0', '< 4.0'
  spec.add_runtime_dependency 'addressable', '~> 2.5', '>= 2.5.1'
  spec.add_runtime_dependency 'mini_mime', '~> 1.0'
  spec.add_runtime_dependency 'signet', '~> 0.12'
  spec.add_runtime_dependency 'googleauth', '~> 0.9'
  spec.add_runtime_dependency 'httpclient', '>= 2.8.1', '< 3.0'
  spec.add_development_dependency 'thor', '~> 0.19'
  spec.add_development_dependency 'activesupport', '>= 4.2', '< 5.1'
end
