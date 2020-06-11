# -*- encoding: utf-8 -*-
# stub: sslshake 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sslshake".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dominik Richter".freeze]
  s.date = "2019-01-21"
  s.description = "This is a library to simulate SSL and TLS handshake from SSLv2, SSLv3, to TLS 1.0-1.2. It does not rely on OpenSSL and is not designed as a replacement either. It targets full support for even older handshakes, which are not available in current releases of OpenSSL anymore. It also aims to be executable on all systems with a sufficiently modern version of Ruby without any additional requirements or pre-compiled binaries.".freeze
  s.email = ["dominik.richter@gmail.com".freeze]
  s.homepage = "https://github.com/arlimus/sslshake".freeze
  s.licenses = ["MPL-2.0".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Ruby library for pure SSL/TLS handshake testing.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version
end
