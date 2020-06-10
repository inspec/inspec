source "https://rubygems.org"

gem "inspec", path: "."

# This dependency is NOT used for normal gem deployment
# - instead, inspec-bin gemspec-depends on inspec
#
# However, AppBundler requires a top-level Gemfile.lock with inspec-bin
# in it in order to package the executable. Hence the odd backwards dependency.
gem "inspec-bin", path: "./inspec-bin"

gem "ffi", [">= 1.9.14", "< 1.13"] # 1.13 does not work on Windows: https://github.com/ffi/ffi/issues/784

group :omnibus do
  gem "rb-readline"
  gem "appbundler"
  gem "ed25519" # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
  gem "bcrypt_pbkdf" # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
end

group :test do
  gem "chefstyle", "~> 0.13.0"
  gem "minitest", "~> 5.5"
  gem "minitest-sprint", "~> 1.0"
  gem "rake", ">= 10"
  gem "simplecov", ["~> 0.10", "<=0.18.2"]
  gem "concurrent-ruby", "~> 1.0"
  gem "nokogiri", "~> 1.9"
  gem "mocha", "~> 1.1"
  gem "ruby-progressbar", "~> 1.8"
  gem "webmock", "~> 3.0"
  gem "m"
  gem "pry", "~> 0.10"
  gem "pry-byebug"
end

group :integration do
  gem "berkshelf"
  gem "test-kitchen"
  gem "kitchen-vagrant"
  gem "chef", "< 15"
  gem "chef-zero", "< 15"
  gem "kitchen-inspec"
  gem "kitchen-ec2"
  gem "kitchen-dokken"
  gem "git"
end

# gems for Maintainers.md generation
group :maintenance do
  gem "tomlrb"

  # To sync maintainers with github
  gem "octokit"
  gem "netrc"
end

group :deploy do
  gem "inquirer"
end

# add these additional dependencies into Gemfile.local
eval_gemfile(__FILE__ + ".local") if File.exist?(__FILE__ + ".local")
