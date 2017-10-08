#!/usr/bin/env rake

require 'rake/testtask'
require 'rubocop/rake_task'
require 'inifile'
require 'passgen'
require_relative 'libraries/azure_backend'

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# lint the project
desc 'Run robocop linter'
task lint: [:rubocop]

# run tests
task default: [:lint]

namespace :test do

  # Specify the directory for the integration tests
  integration_dir = "test/integration"

  # run inspec check to verify that the profile is properly configured
  #task :check do
  #  dir = File.join(File.dirname(__FILE__))
  #  sh("bundle exec inspec check #{dir}")
  #end

  task :init_workspace do
    # Initialize terraform workspace
    cmd = format("cd %s/build/ && terraform init", integration_dir)
    sh(cmd)
  end

  task :setup_integration_tests do

    azure_backend = AzureConnection.new
    creds = azure_backend.spn

    # Determine the storage account name and the admin password
    sa_name = (0...15).map { (65 + rand(26)).chr }.join.downcase
    admin_password = Passgen::generate(length: 12, uppercase: true, lowercase: true, symbols: true, digits: true)

    puts "----> Setup"

    # Create the plan that can be applied to Azure
    cmd = format("cd %s/build/ && terraform plan -var 'subscription_id=%s' -var 'client_id=%s' -var 'client_secret=%s' -var 'tenant_id=%s' -var='storage_account_name=%s' -var='admin_password=%s' -out inspec-azure.plan", integration_dir, creds[:subscription_id], creds[:client_id], creds[:client_secret], creds[:tenant_id], sa_name, admin_password)
    sh(cmd)

    # Apply the plan on Azure
    cmd = format("cd %s/build/ && terraform apply inspec-azure.plan", integration_dir)
    sh(cmd)
  end

  task :run_integration_tests do
    puts "----> Run"

    cmd = format("bundle exec inspec exec %s/verify", integration_dir)
    sh(cmd)
  end

  task :cleanup_integration_tests do

    azure_backend = AzureConnection.new
    creds = azure_backend.spn

    puts "----> Cleanup"
    cmd = format("cd %s/build/ && terraform destroy -force -var 'subscription_id=%s' -var 'client_id=%s' -var 'client_secret=%s' -var 'tenant_id=%s' -var='admin_password=dummy' -var='storage_account_name=dummy'", integration_dir, creds[:subscription_id], creds[:client_id], creds[:client_secret], creds[:tenant_id])
    sh(cmd)

  end

  desc "Perform Integration Tests"
  task :integration do
    Rake::Task["test:init_workspace"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
    Rake::Task["test:setup_integration_tests"].execute
    Rake::Task["test:run_integration_tests"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
  end
end

# Automatically generate a changelog for this project. Only loaded if
# the necessary gem is installed.
# use `rake changelog to=1.2.0`
begin
  v = ENV['to']
  require 'github_changelog_generator/task'
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = v
  end
rescue LoadError
  puts '>>>>> GitHub Changelog Generator not loaded, omitting tasks'
end
