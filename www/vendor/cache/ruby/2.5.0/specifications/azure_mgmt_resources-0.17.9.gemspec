# -*- encoding: utf-8 -*-
# stub: azure_mgmt_resources 0.17.9 ruby lib

Gem::Specification.new do |s|
  s.name = "azure_mgmt_resources".freeze
  s.version = "0.17.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/Azure/azure-sdk-for-ruby/issues", "changelog_uri" => "https://github.com/Azure/azure-sdk-for-ruby/blob/master/ChangeLog.md", "documentation_uri" => "https://azure.microsoft.com/en-us/develop/ruby/", "homepage_uri" => "https://aka.ms/azure-sdk-for-ruby", "source_code_uri" => "https://github.com/Azure/azure-sdk-for-ruby/tree/master/management/azure_mgmt_resources" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Microsoft Corporation".freeze]
  s.date = "2020-06-02"
  s.description = "Microsoft Azure Resource Management Client Library for Ruby".freeze
  s.email = "azrubyteam@microsoft.com".freeze
  s.homepage = "https://aka.ms/azure-sdk-for-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Official ruby client library to consume Microsoft Azure Resource Management services.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<dotenv>.freeze, ["~> 2"])
      s.add_runtime_dependency(%q<ms_rest_azure>.freeze, ["~> 0.12.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_dependency(%q<rake>.freeze, ["~> 10"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<dotenv>.freeze, ["~> 2"])
      s.add_dependency(%q<ms_rest_azure>.freeze, ["~> 0.12.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rake>.freeze, ["~> 10"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<dotenv>.freeze, ["~> 2"])
    s.add_dependency(%q<ms_rest_azure>.freeze, ["~> 0.12.0"])
  end
end
