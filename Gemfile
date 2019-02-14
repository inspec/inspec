# encoding: utf-8
source 'https://rubygems.org'

gemspec name: 'inspec'

gem 'ffi', '>= 1.9.14'
gem 'aws-sdk', '~> 2'

group :test do
  gem 'minitest', '~> 5.5'
  gem 'rake', '>= 10'
  gem 'rubocop', '= 0.49.1'
  gem 'simplecov', '~> 0.10'
  gem 'concurrent-ruby', '~> 1.0'
  gem 'mocha', '~> 1.1'
  gem 'ruby-progressbar', '~> 1.8'
  gem 'webmock', '~> 2.3.2'
  gem 'jsonschema', '~> 2.0.2'
  gem 'passgen'
  gem 'm'
  gem 'pry-byebug'
end

group :integration do
  # this version check can be removed when inspec no longer support ruby 2.3
  if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.4')
    gem 'berkshelf', '~> 7'
  end
  gem 'test-kitchen', '>= 1.24'
  gem 'kitchen-vagrant'
  # we need winrm v2 support >= 0.15.1
  gem 'kitchen-inspec', '>= 0.15.1'
  gem 'kitchen-ec2'
  gem 'kitchen-dokken'
end

group :tools do
  gem 'pry', '~> 0.10'
  gem 'rb-readline'
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
