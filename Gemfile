# encoding: utf-8
source 'https://rubygems.org'
gemspec

group :test do
  gem 'bundler', '~> 1.5'
  gem 'minitest', '~> 5.5'
  gem 'rake', '~> 10'
  gem 'rubocop', '~> 0.36.0'
  gem 'simplecov', '~> 0.10'
  gem 'concurrent-ruby', '~> 0.9'
end

group :integration do
  gem 'berkshelf', '~> 4.0'
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-inspec'
  gem 'winrm-transport', '~> 1.0'
  gem 'kitchen-ec2'
end

group :tools do
  gem 'pry', '~> 0.10'
  gem 'license_finder'
  gem 'github_changelog_generator', '~> 1'
end

# gems for Maintainers.md generation
group :maintenance do
  gem 'tomlrb'

  # To sync maintainers with github
  gem 'octokit'
  gem 'netrc'
end
