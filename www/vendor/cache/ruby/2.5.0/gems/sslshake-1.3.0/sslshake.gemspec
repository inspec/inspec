# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sslshake/version'

Gem::Specification.new do |spec|
  spec.name          = 'sslshake'
  spec.version       = SSLShake::VERSION
  spec.authors       = ['Dominik Richter']
  spec.email         = ['dominik.richter@gmail.com']
  spec.summary       = 'Ruby library for pure SSL/TLS handshake testing.'
  spec.description   = 'This is a library to simulate SSL and TLS handshake from SSLv2, SSLv3, to TLS 1.0-1.2. It does not rely on OpenSSL and is not designed as a replacement either. It targets full support for even older handshakes, which are not available in current releases of OpenSSL anymore. It also aims to be executable on all systems with a sufficiently modern version of Ruby without any additional requirements or pre-compiled binaries.'
  spec.homepage      = 'https://github.com/arlimus/sslshake'
  spec.license       = 'MPL-2.0'

  spec.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
end
