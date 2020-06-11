# -*- encoding: utf-8 -*-
# stub: net-ssh 6.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "net-ssh".freeze
  s.version = "6.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/net-ssh/net-ssh/blob/master/CHANGES.txt" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jamis Buck".freeze, "Delano Mandelbaum".freeze, "Mikl\u00F3s Fazekas".freeze]
  s.bindir = "exe".freeze
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDQDCCAiigAwIBAgIBATANBgkqhkiG9w0BAQsFADAlMSMwIQYDVQQDDBpuZXRz\nc2gvREM9c29sdXRpb3VzL0RDPWNvbTAeFw0yMDA0MTEwNTQyMTZaFw0yMTA0MTEw\nNTQyMTZaMCUxIzAhBgNVBAMMGm5ldHNzaC9EQz1zb2x1dGlvdXMvREM9Y29tMIIB\nIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxieE22fR/qmdPKUHyYTyUx2g\nwskLwrCkxay+Tvc97ZZUOwf85LDDDPqhQaTWLvRwnIOMgQE2nBPzwalVclK6a+pW\nx/18KDeZY15vm3Qn5p42b0wi9hUxOqPm3J2hdCLCcgtENgdX21nVzejn39WVqFJO\nlntgSDNW5+kCS8QaRsmIbzj17GKKkrsw39kiQw7FhWfJFeTjddzoZiWwc59KA/Bx\nfBbmDnsMLAtAtauMOxORrbx3EOY7sHku/kSrMg3FXFay7jc6BkbbUij+MjJ/k82l\n4o8o0YO4BAnya90xgEmgOG0LCCxRhuXQFnMDuDjK2XnUe0h4/6NCn94C+z9GsQID\nAQABo3sweTAJBgNVHRMEAjAAMAsGA1UdDwQEAwIEsDAdBgNVHQ4EFgQUBfKiwO2e\nM4NEiRrVG793qEPLYyMwHwYDVR0RBBgwFoEUbmV0c3NoQHNvbHV0aW91cy5jb20w\nHwYDVR0SBBgwFoEUbmV0c3NoQHNvbHV0aW91cy5jb20wDQYJKoZIhvcNAQELBQAD\nggEBAJTylLYXo5AybI+tLq79+OXQ8/nbGZ7iydU1uTHQud1JZQ1MRV5dRDjeBmCT\nlRxaEZT4NopEzuHO0sm3nVpSYtQwTaQyVKmnllNI3kc0f4H6i7dpPd7eUAQ3/O2I\neWjDJlzu0zwqTa+N6vzS8Y3ypDSGgb1gJKzluOv7viVUAthmuuJws7XQq/qMMaNw\n3163oCKuJvMW1w8kdUMQqvlLJkVKaxz9K64r2+a04Ok1cKloTB3OSowfAYFoRlqP\nvoajiJNS75Pw/2j13WnPB4Q6w7dHSb57E/VluBpVKmcQZN0dGdAkEIVty3v7kw9g\ny++VpCpWM/PstIFv4ApZMf501UY=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2020-06-09"
  s.description = "Net::SSH: a pure-Ruby implementation of the SSH2 client protocol. It allows you to write programs that invoke and interact with processes on remote servers, via SSH2.".freeze
  s.email = ["net-ssh@solutious.com".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "https://github.com/net-ssh/net-ssh".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Net::SSH: a pure-Ruby implementation of the SSH2 client protocol.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<ed25519>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<x25519>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.17"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.10"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.11.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.74.0"])
    else
      s.add_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
      s.add_dependency(%q<ed25519>.freeze, ["~> 1.2"])
      s.add_dependency(%q<x25519>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.17"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.10"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.11.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.74.0"])
    end
  else
    s.add_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ed25519>.freeze, ["~> 1.2"])
    s.add_dependency(%q<x25519>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.17"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.10"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.11.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.74.0"])
  end
end
