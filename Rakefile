#!/usr/bin/env rake
# encoding: utf-8

require 'rake/testtask'
require 'rubocop/rake_task'

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# Minitest
Rake::TestTask.new do |t|
  t.libs << 'libraries'
  t.libs << 'test/unit'
  t.pattern = "test/unit/**/*_test.rb"
end

# lint the project
desc 'Run robocop linter'
task lint: [:rubocop]

# run tests
task default: [:lint, :test]

namespace :test do
  integration_dir = "test/integration"

  # run inspec check to verify that the profile is properly configured
  task :check do
    dir = File.join(File.dirname(__FILE__))
    sh("bundle exec inspec check #{dir}")
  end

  task :setup_integration_tests do
    puts "----> Setup"
    sh("cd #{integration_dir}/build/ && terraform plan")
    sh("cd #{integration_dir}/build/ && terraform apply")
  end

  task :run_integration_tests do
    puts "----> Run"
    sh("bundle exec inspec exec #{integration_dir}/verify")
  end

  task :cleanup_integration_tests do
    puts "----> Cleanup"
    sh("cd #{integration_dir}/build/ && terraform destroy -force")
  end

  task :integration do
    Rake::Task["test:cleanup_integration_tests"].execute
    Rake::Task["test:setup_integration_tests"].execute
    Rake::Task["test:run_integration_tests"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
  end
end
