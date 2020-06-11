source "https://rubygems.org"

gem "middleman-core", :git => "https://github.com/middleman/middleman.git", :branch => '4.x'

# Specify your gem's dependencies in middleman-syntax.gemspec
gemspec

# Build and doc tools
gem 'rake', '~> 10.3', require: false
gem 'yard', '~> 0.8', require: false

# Test tools
gem 'pry', '~> 0.10', group: :development
gem 'aruba', '~> 0.10.0'
gem 'rspec', '~> 3.0'
gem 'cucumber', '~> 2.0'
gem 'capybara', '~> 2.5.0'

platforms :ruby do
  gem "redcarpet"
end

# Code Quality
gem "cane", :platforms => [:mri_19, :mri_20], :require => false

# For old rubies
gem 'nokogiri', ['~> 1.5', '< 1.7']
