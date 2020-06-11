source 'https://rubygems.org'

# Specify your gem's dependencies in rspec-its.gemspec
gemspec

%w[rspec rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
  branch = ENV.fetch('BRANCH','3-1-maintenance')
  library_path = File.expand_path("../../#{lib}", __FILE__)
  if File.exist?(library_path) && !ENV['USE_GIT_REPOS']
    gem lib, :path => library_path
  else
    gem lib, :git => "git://github.com/rspec/#{lib}.git",
             :branch => branch
  end
end

if RUBY_VERSION < '2.0.0' && !!(RbConfig::CONFIG['host_os'] =~ /cygwin|mswin|mingw|bccwin|wince|emx/)
  gem 'ffi', '< 1.9.15' # allow ffi to be installed on older rubies on windows
elsif RUBY_VERSION < '1.9'
  gem 'ffi', '< 1.9.19' # ffi dropped Ruby 1.8 support in 1.9.19
else
  gem 'ffi', '~> 1.9.25'
end

# test coverage
# gem 'simplecov', :require => false

gem 'coveralls', :require => false, :platform => :mri_20

eval File.read('Gemfile-custom') if File.exist?('Gemfile-custom')

platform :rbx do
  gem 'rubysl'
end
