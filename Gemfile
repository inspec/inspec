# encoding: utf-8
source 'https://rubygems.org'
gemspec

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.2.2')
  gem 'json', '~> 1.8'
  gem 'rack', '< 2.0'
end

gem 'ffi', '>= 1.9.14'

group :test do
  gem 'bundler', '~> 1.5'
  gem 'minitest', '~> 5.5'
  gem 'rake', '~> 10'
  gem 'rubocop', '= 0.39.0'
  gem 'simplecov', '~> 0.10'
  gem 'concurrent-ruby', '~> 0.9'
  gem 'mocha', '~> 1.1'
  gem 'ruby-progressbar', '~> 1.8'
  gem 'webmock', '~> 2.3.2'
  gem 'jsonschema', '~> 2.0.2'
  gem 'm'
end

group :integration do
  gem 'berkshelf', '~> 4.3'
  gem 'test-kitchen', '~> 1.6'
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
  gem "github_changelog_generator", git: "https://github.com/chef/github-changelog-generator"
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
