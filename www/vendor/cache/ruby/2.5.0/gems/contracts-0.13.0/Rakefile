if RUBY_VERSION >= "2"
  task :default => [:spec, :rubocop]

  require "rubocop/rake_task"
  RuboCop::RakeTask.new
else
  task :default => [:spec]
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)
