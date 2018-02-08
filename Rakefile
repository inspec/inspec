#!/usr/bin/env rake
# encoding: utf-8

require 'rake/testtask'
require 'rubocop/rake_task'
require 'securerandom'

def prompt(message)
  print(message)
  STDIN.gets.chomp
end

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
  project_dir = File.dirname(__FILE__)
  
  # run inspec check to verify that the profile is properly configured
  task :check do
    sh("bundle exec inspec check #{project_dir}")
  end
  
  namespace :aws do
    ['default', 'minimal'].each do |account|
      integration_dir = File.join(project_dir, 'test', 'integration', account)
      attribute_file = File.join(integration_dir, '.attribute.yml')
      
      task :"setup:#{account}", :tf_workspace do |t, args|
        tf_workspace = args[:tf_workspace] || ENV['INSPEC_TERRAFORM_ENV']
        abort("You must either call the top-level test:aws:#{account} task, or set the INSPEC_TERRAFORM_ENV variable.") unless tf_workspace
        puts "----> Setup"
        abort("You must set the environment variable AWS_REGION") unless ENV['AWS_REGION']
        puts "----> Checking for required AWS profile..."
        sh("aws configure get aws_access_key_id --profile inspec-aws-test-#{account} > /dev/null")
        sh("cd #{integration_dir}/build/ && terraform init")
        sh("cd #{integration_dir}/build/ && terraform workspace new #{tf_workspace}")
        sh("cd #{integration_dir}/build/ && AWS_PROFILE=inspec-aws-test-#{account} terraform plan")
        sh("cd #{integration_dir}/build/ && AWS_PROFILE=inspec-aws-test-#{account} terraform apply")
        Rake::Task["test:aws:dump_attrs:#{account}"].execute
      end
      
      task :"dump_attrs:#{account}" do
        sh("cd #{integration_dir}/build/ && AWS_PROFILE=inspec-aws-test-#{account} terraform output > #{attribute_file}")
        raw_output = File.read(attribute_file)
        yaml_output = raw_output.gsub(" = ", " : ")
        File.open(attribute_file, "w") {|file| file.puts yaml_output}
      end

      task :"run:#{account}" do
        puts "----> Run"
        sh("bundle exec inspec exec #{integration_dir}/verify -t aws://${AWS_REGION}/inspec-aws-test-#{account} --attrs #{attribute_file}")
      end
      
      task :"cleanup:#{account}", :tf_workspace do |t, args|
        tf_workspace = args[:tf_workspace] || ENV['INSPEC_TERRAFORM_ENV']
        abort("You must either call the top-level test:aws:#{account} task, or set the INSPEC_TERRAFORM_ENV variable.") unless tf_workspace
        puts "----> Cleanup"
        sh("cd #{integration_dir}/build/ && AWS_PROFILE=inspec-aws-test-#{account} terraform destroy -force")
        sh("cd #{integration_dir}/build/ && terraform workspace select default")
        sh("cd #{integration_dir}/build && terraform workspace delete #{tf_workspace}")
      end
      
      task :"#{account}" do
        tf_workspace = ENV['INSPEC_TERRAFORM_ENV'] || prompt("Please enter a workspace for your integration tests to run in: ")
        begin
          Rake::Task["test:aws:setup:#{account}"].execute({:tf_workspace => tf_workspace})
          Rake::Task["test:aws:run:#{account}"].execute
        rescue
          abort("Integration testing has failed for the #{account} account")
        ensure
          Rake::Task["test:aws:cleanup:#{account}"].execute({:tf_workspace => tf_workspace})
        end
      end
    end
  end
  task aws: [:'aws:default', :'aws:minimal']  
end