#!/usr/bin/env rake
# encoding: utf-8

require 'rake/testtask'
require 'rubocop/rake_task'
require 'securerandom'

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
  terraform_env = ENV['INSPEC_TERRAFORM_ENV'] || SecureRandom.urlsafe_base64(5)
  project_dir = File.dirname(__FILE__)
  attribute_file = File.join(project_dir, ".attribute.yml")
  integration_dir = File.join(project_dir, "test/integration")

  # run inspec check to verify that the profile is properly configured
  task :check do
    sh("bundle exec inspec check #{project_dir}")
  end

  task :configure_test_environment do
    puts "----> Creating terraform environment"
    sh("cd #{integration_dir}/build/ && terraform env new #{terraform_env}")
  end

  task :setup_integration_tests do
    puts "----> Setup"
    sh("cd #{integration_dir}/build/ && terraform plan")
    sh("cd #{integration_dir}/build/ && terraform apply")
    sh("cd #{integration_dir}/build/ && terraform output > #{attribute_file}")

    raw_output = File.read(attribute_file)
    yaml_output = raw_output.gsub(" = ", " : ")
    File.open(attribute_file, "w") {|file| file.puts yaml_output}
  end


  task :run_integration_tests do
    puts "----> Run"
    sh("bundle exec inspec exec #{integration_dir}/verify --attrs #{attribute_file}")
  end

  task :cleanup_integration_tests do
    puts "----> Cleanup"
    sh("cd #{integration_dir}/build/ && terraform destroy -force")
  end

  task :destroy_test_environment do
    puts "----> Destroying terraform environment"
    sh("cd #{integration_dir}/build/ && terraform env select default")
    sh("cd #{integration_dir}/build && terraform env delete #{terraform_env}")
  end

  task :integration do
    Rake::Task["test:configure_test_environment"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
    Rake::Task["test:setup_integration_tests"].execute
    Rake::Task["test:run_integration_tests"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
    Rake::Task["test:destroy_test_environment"].execute
  end
end
