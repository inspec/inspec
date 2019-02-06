# A Rakefile defines tasks to help maintain your project.
# Rake provides several task templates that are useful.

#------------------------------------------------------------------#
#                    Test Runner Tasks
#------------------------------------------------------------------#

# This task template will make a task named 'test', and run
# the tests that it finds.
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList[
    'test/unit/*_test.rb',
    'test/functional/*_test.rb',
  ]
  t.verbose = true
  # Ideally, we'd run tests with warnings enabled,
  # but the dependent gems have many warnings. As this
  # is an example, let's disable them so the testing
  # experience is cleaner.
  t.warning = false
end

#------------------------------------------------------------------#
#                    Code Style Tasks
#------------------------------------------------------------------#
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:lint) do |t|
  # Choices of RuboCop rules to enforce are deeply personal.
  # Here, we set things up so that your plugin will use the Bundler-installed
  # inspec gem's copy of the InSpec project's rubocop.yml file (which
  # is indeed packaged with the inspec gem).
  require 'inspec/globals'
  inspec_rubocop_yml = File.join(Inspec.src_root, '.rubocop.yml')

  t.options = ['--display-cop-names', '--config', inspec_rubocop_yml]
end
