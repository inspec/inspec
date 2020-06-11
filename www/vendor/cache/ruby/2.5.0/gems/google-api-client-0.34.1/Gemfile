source 'https://rubygems.org'

# Specify your gem's dependencies in google-apis.gemspec
gemspec


group :development do
  gem 'bundler', '>= 1.7'
  gem 'rake', '~> 11.2'
  gem 'rspec', '~> 3.1'
  gem 'json_spec', '~> 1.1'
  gem 'webmock', '~> 2.1'
  gem 'simplecov', '~> 0.12'
  gem 'coveralls', '~> 0.8'
  gem 'rubocop', '~> 0.49.0'
  gem 'launchy', '~> 2.4'
  gem 'dotenv', '~> 2.0'
  gem 'fakefs', '~> 0.6', require: "fakefs/safe"
  gem 'google-id-token', '~> 1.3'
  gem 'os', '~> 0.9'
  gem 'rmail', '~> 1.1'
  gem 'redis', '~> 3.2'
  gem 'logging', '~> 2.2'
  gem 'opencensus', '~> 0.4'
  gem 'httparty'
end

platforms :jruby do
  group :development do
    gem 'jruby-openssl'
  end
end

platforms :ruby do
  group :development do
    gem 'yard', '~> 0.9', '>= 0.9.11'
    gem 'redcarpet', '~> 3.2'
    gem 'github-markup', '~> 1.3'
    gem 'pry-doc', '~> 0.8'
    gem 'pry-byebug', '~> 3.2'
  end
end

platforms :mri_21, :mri_22, :mri_23 do
  group :development do
    gem 'derailed_benchmarks'
    gem 'stackprof'
    gem 'rack-test'
  end
end

if ENV['RAILS_VERSION']
  gem 'rails', ENV['RAILS_VERSION']
end
