require 'rake/clean'
require 'rspec/core/rake_task'

CLOBBER.include('coverage')

namespace :spec do
  RSpec::Core::RakeTask.new(:all)
end

desc 'Alias to spec:all'
task 'spec' => 'spec:all'
