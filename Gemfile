source "https://rubygems.org"

gem "inspec", path: "."

# This dependency is NOT used for normal gem deployment
# - instead, inspec-bin gemspec-depends on inspec
#
# However, AppBundler requires a top-level Gemfile.lock with inspec-bin
# in it in order to package the executable. Hence the odd backwards dependency.
gem "inspec-bin", path: "./inspec-bin"

# ffi version v1.17.0 is breaking verify pipeline as it requires
# rubygems version to be upgraded to >= 3.3.22 Ref:https://buildkite.com/chef/inspec-inspec-main-verify-private/builds/812#018fe177-2ccb-45ed-a25e-213c8a6453df/698-707

gem "ffi", ">= 1.15.5", "< 1.17.0"

# We have a build issue 2023-11-13 with unf_ext 0.0.9 so we are pinning to 0.0.8.2
# See https://github.com/knu/ruby-unf_ext/issues/74 https://buildkite.com/chef/inspec-inspec-inspec-5-omnibus-release/builds/22
gem "unf_ext", "= 0.0.8.2"

# inspec tests depend text output that changed in the 3.10 release
# but our runtime dep is still 3.9+
gem "rspec", ">= 3.10"

group :omnibus do
  gem "rb-readline"
  gem "appbundler"
  gem "ed25519" # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
  gem "bcrypt_pbkdf" # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
end

group :test do
  gem "chefstyle"
  gem "concurrent-ruby"
  gem "json_schemer"
  gem "m"
  gem "minitest-sprint", "~> 1.0"
  gem "minitest", "5.15.0"
  gem "mocha"
  # Pinning this version as it breaking for ruby 3.1.0
  gem "nokogiri", "< 1.17.2"
  # Pinning this version as it breaking for ruby 3.0.0
  gem "pry-byebug", "< 3.11.0"
  gem "pry"
  gem "rake"
  gem "simplecov"
  gem "simplecov_json_formatter"
  gem "webmock"
end

group :deploy do
  gem "inquirer"
end

# Build is failing - see: https://buildkite.com/chef-oss/inspec-inspec-inspec-5-verify/builds/442
# Error:
# zeitwerk-2.7.1 requires Ruby >= 3.2, which is incompatible with the current version (Ruby 3.0.7p220)

# Dependency chain:
# zeitwerk → dry-configurable, dry-struct, dry-types → k8s-ruby → train-kubernetes

# Pinning zeitwerk to ~> 2.6 to avoid Ruby >= 3.2 requirement.
# Remove this pin when upgrading to Ruby 3.2 or higher.
gem "zeitwerk", "~> 2.6.0", "< 2.7"

# Pinning dry-core,dry-core,dry-types to < 1.1.0 as it is breaking the build because 1.1.0 is incompatible with the current version, ruby 3.0.x on CI
gem "dry-types", "<= 1.7.2" if RUBY_VERSION < "3.1.0"
gem "dry-core", "> 1.0.0", "< 1.1.0" if RUBY_VERSION < "3.1.0"
gem "dry-inflector", "<= 1.1.0" if RUBY_VERSION < "3.1.0"

# Pinning securerandom to < 0.4.0 as it is breaking the build because 0.4.0 is incompatible with the current version, ruby 3.0.x on CI
# Remove this pin when upgrading to Ruby 3.1 or higher on CI.
gem "securerandom", "< 0.4.0" if RUBY_VERSION < "3.1.0"
