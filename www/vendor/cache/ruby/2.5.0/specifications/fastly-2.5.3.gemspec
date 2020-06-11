# -*- encoding: utf-8 -*-
# stub: fastly 2.5.3 ruby lib

Gem::Specification.new do |s|
  s.name = "fastly".freeze
  s.version = "2.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fastly".freeze]
  s.date = "2020-06-09"
  s.description = "Client library for the Fastly acceleration system".freeze
  s.email = ["simon@fastly.com".freeze, "zeke@templ.in".freeze, "tyler@fastly.com".freeze]
  s.executables = ["fastly_create_domain".freeze, "fastly_upload_vcl".freeze]
  s.files = ["bin/fastly_create_domain".freeze, "bin/fastly_upload_vcl".freeze]
  s.homepage = "http://github.com/fastly/fastly-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Client library for the Fastly acceleration system".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version
end
