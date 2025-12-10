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
  gem "net-imap", ">= 0.2.5" # 0.2.5+ required for CVE fix - GHSA-j3g3-5qv5-52mj
end

group :test do
  gem "chefstyle"
  gem "concurrent-ruby"
  gem "json_schemer"
  gem "m"
  # 1.4.0+ requires min ruby 3.2, InSpec5 does not support Ruby 3.2
  gem "minitest-sprint", "~> 1.3.0" , "< 1.4.0"
  gem "minitest", "5.15.0"
  gem "mocha"
  gem "nokogiri", "~> 1.16.5"
  gem "pry-byebug"
  gem "pry"
  gem "rake"
  gem "simplecov"
  gem "simplecov_json_formatter"
  gem "webmock"
  gem "signet", "< 0.22.0" # 0.20.0+ requires min ruby 3.1
  # Pinning to 1.15 as multi_json 1.16 require ruby 3.2 version
  # Ref: https://buildkite.com/chef-oss/inspec-inspec-inspec-5-verify/builds/647#019808ca-087b-43bc-b1f9-40a36f59c5f4
  gem "multi_json", "~> 1.18.0"
end

group :deploy do
  gem "inquirer"
end

# Build is failing - see: https://buildkite.com/chef-oss/inspec-inspec-inspec-5-verify/builds/442
# Error: zeitwerk-2.7.1 requires Ruby >= 3.2, which is incompatible with the current version (Ruby 3.0.7p220)
# Dependency chain:
# zeitwerk → dry-configurable, dry-struct, dry-types → k8s-ruby → train-kubernetes
# Pinning zeitwerk to ~> 2.6 to avoid Ruby >= 3.2 requirement.
# Remove this pin when upgrading to Ruby 3.2 or higher.
gem "zeitwerk", "~> 2.6.0", "< 2.7"

# Pinning connection_pool to < 3.0.0 as 3.0.1 requires Ruby >= 3.2.0
# Remove this pin when upgrading to Ruby 3.2 or higher.
gem "connection_pool", "< 3.0.0" if RUBY_VERSION < "3.2.0"
