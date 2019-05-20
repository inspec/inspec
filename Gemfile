source 'https://rubygems.org'

gem 'inspec', path: '.'

# This dependency is NOT used for normal gem deployment
# - instead, inspec-bin gemspec-depends on inspec
#
# However, AppBundler requires a top-level Gemfile.lock with inspec-bin
# in it in order to package the executable. Hence the odd backwards dependency.
gem 'inspec-bin', path: './inspec-bin'

gem 'ffi', '>= 1.9.14'

group :omnibus do
  gem 'rb-readline'
  gem 'appbundler'
  gem 'ed25519' # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
  gem 'bcrypt_pbkdf' # ed25519 ssh key support done here as its a native gem we can't put in the gemspec
end

group :test do
  gem 'coveralls', require: false
  gem 'minitest', '~> 5.5'
  gem 'rake', '>= 10'
  gem 'rubocop', '= 0.49.1'
  gem 'simplecov', '~> 0.10'
  gem 'concurrent-ruby', '~> 1.0'
  gem 'mocha', '~> 1.1'
  gem 'ruby-progressbar', '~> 1.8'
  gem 'webmock', '~> 3.0'
  gem 'jsonschema', '~> 2.0.2'
  gem 'passgen'
  gem 'm'
  gem 'pry-byebug'
end

group :integration do
  gem 'berkshelf', '~> 7'
  gem 'test-kitchen', '~> 1.17'
  gem 'kitchen-vagrant'
  # we need winrm v2 support >= 0.15.1
  gem 'kitchen-inspec', '>= 0.15.1'
  gem 'kitchen-ec2'
  gem 'kitchen-dokken'
end

group :tools do
  gem 'pry', '~> 0.10'
  gem 'license_finder'
  gem 'git', '~> 1.4'
end

# gems for Maintainers.md generation
group :maintenance do
  gem 'tomlrb'

  # To sync maintainers with github
  gem 'octokit'
  gem 'netrc'
end

group :deploy do
  gem 'inquirer'
end

# add these additional dependencies into Gemfile.local
eval_gemfile(__FILE__ + ".local") if File.exist?(__FILE__ + ".local")
