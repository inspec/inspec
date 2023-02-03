source "https://rubygems.org"

gem "inspec", path: "."

# This dependency is NOT used for normal gem deployment
# - instead, inspec-bin gemspec-depends on inspec
#
# However, AppBundler requires a top-level Gemfile.lock with inspec-bin
# in it in order to package the executable. Hence the odd backwards dependency.
gem "inspec-bin", path: "./inspec-bin"

gem "ffi", ">= 1.9.14", "!= 1.13.0", "!= 1.14.2"

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
  gem "chefstyle", "~> 2.2.2"
  gem "concurrent-ruby", "~> 1.0"
  gem "json_schemer", ">= 0.2.1", "< 0.2.19"
  gem "m"
  gem "minitest-sprint", "~> 1.0"
  gem "minitest", "5.15.0"
  gem "mocha", "~> 1.1"
  gem "nokogiri", "~> 1.9"
  gem "pry-byebug"
  gem "pry", "~> 0.10"
  gem "rake", ">= 10"
  gem "simplecov", "~> 0.21"
  gem "simplecov_json_formatter"
  gem "webmock", "~> 3.0"

  if Gem.ruby_version >= Gem::Version.new("3.0.0")
    # html-proofer has a dep on io-event, which is ruby-3 only
    gem "html-proofer", "~> 3.19.4", platforms: :ruby # do not attempt to run proofer on windows. Pinned to 3.19.4 as test is breaking in updated versions.
  end
end

group :deploy do
  gem "inquirer"
end

group :kitchen do
  gem "berkshelf"

  # Chef 18 requires ruby 3
  if Gem.ruby_version >= Gem::Version.new("3.0.0")
    gem "chef", ">= 17.0"
  else
    # Ruby 2.7 presumably - TODO remove this when 2.7 is sunsetted
    gem "chef", "~> 16.0"
  end

  gem "test-kitchen", ">= 2.8"
  gem "kitchen-inspec", ">= 2.0"
  gem "kitchen-dokken", ">= 2.11"
  gem "git"
end
