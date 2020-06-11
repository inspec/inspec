$LOAD_PATH.push File.expand_path("lib", __dir__)
require "signet/version"

Gem::Specification.new do |gem|
  gem.name = "signet"
  gem.version = Signet::VERSION

  gem.required_rubygems_version = ">= 1.3.5"
  gem.require_paths = ["lib"]
  gem.authors = ["Bob Aman", "Steven Bazyl"]
  gem.license = "Apache-2.0"
  gem.description = "Signet is an OAuth 1.0 / OAuth 2.0 implementation.\n"
  gem.email = "sbazyl@google.com"
  gem.extra_rdoc_files = ["README.md"]
  gem.files = ["signet.gemspec", "Rakefile", "LICENSE", "CHANGELOG.md", "README.md", "Gemfile"]
  gem.files += Dir.glob "lib/**/*.rb"
  gem.files += Dir.glob "spec/**/*.{rb,opts}"
  gem.files += Dir.glob "vendor/**/*.rb"
  gem.files += Dir.glob "tasks/**/*"
  gem.files += Dir.glob "website/**/*"
  gem.homepage = "https://github.com/googleapis/signet"
  gem.rdoc_options = ["--main", "README.md"]
  gem.summary = "Signet is an OAuth 1.0 / OAuth 2.0 implementation."
  gem.required_ruby_version = ">= 2.4.0"

  gem.add_runtime_dependency "addressable", "~> 2.3"
  gem.add_runtime_dependency "faraday", ">= 0.17.3", "< 2.0"
  gem.add_runtime_dependency "jwt", ">= 1.5", "< 3.0"
  gem.add_runtime_dependency "multi_json", "~> 1.10"

  gem.add_development_dependency "google-style", "~> 0.3"
  gem.add_development_dependency "kramdown", "~> 1.5"
  gem.add_development_dependency "launchy", "~> 2.4"
  gem.add_development_dependency "rake", "~> 12.0"
  gem.add_development_dependency "rspec", "~> 3.1"
  gem.add_development_dependency "simplecov", "~> 0.9"
  gem.add_development_dependency "yard", "~> 0.9", ">= 0.9.12"

  if gem.respond_to? :metadata
    gem.metadata["changelog_uri"] = "https://github.com/googleapis/signet/blob/master/CHANGELOG.md"
    gem.metadata["source_code_uri"] = "https://github.com/googleapis/signet"
    gem.metadata["bug_tracker_uri"] = "https://github.com/googleapis/signet/issues"
  end
end
