# encoding: utf-8
source 'https://rubygems.org'
gemspec

gem 'train', git: 'git@github.com:chef/train.git'

group :test do
  gem 'bundler', '~> 1.5'
  gem 'minitest', '~> 5.5'
  gem 'rake', '~> 10'
  gem 'rubocop', '~> 0.33.0'
  gem 'simplecov', '~> 0.10'
  gem 'concurrent-ruby', '~> 0.9'
end

group :integration do
  gem 'berkshelf', '~> 4.0'
  gem 'test-kitchen', git: 'https://github.com/chris-rock/test-kitchen', branch: 'test-path'
  gem 'kitchen-vagrant'
end

group :tools do
  gem 'pry', '~> 0.10'
  gem 'license_finder'
end
