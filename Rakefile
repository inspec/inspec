#!/usr/bin/env rake
# encoding: utf-8

require 'bundler'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'passgen'
require 'train'
require_relative 'tasks/maintainers'
require_relative 'tasks/spdx'

def prompt(message)
  print(message)
  STDIN.gets.chomp
end

# The docs tasks rely on ruby-progressbar. If we can't load it, then don't
# load the docs tasks. This is necessary to allow this Rakefile to work
# when the "tests" gem group in the Gemfile has been excluded, such as
# during an appbundle-updater run.
begin
  require 'ruby-progressbar'
  require_relative 'tasks/docs'
rescue LoadError
  puts 'docs tasks are unavailable because the ruby-progressbar gem is not available.'
end

# Rubocop
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:lint)
rescue LoadError
  puts 'rubocop is not available. Install the rubocop gem to run the lint tests.'
end

# update command output for demo
desc 'Run inspec commands and save results to www/app/responses'
task :update_demo do
  ruby 'www/tutorial/scripts/build_simulator_runtime.rb'
  ruby 'www/tutorial/scripts/run_simulator_recording.rb'
end

# run tests
task default: [:lint, :test]

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/unit/**/*_test.rb'
  t.warning = true
  t.verbose = true
  t.ruby_opts = ['--dev'] if defined?(JRUBY_VERSION)
end

namespace :test do
  task :isolated do
    Dir.glob('test/unit/*_test.rb').all? do |file|
      sh(Gem.ruby, '-w', '-Ilib:test', file)
    end or fail 'Failures'
  end

  Rake::TestTask.new(:functional) do |t|
    t.libs << 'test'
    t.pattern = 'test/functional/**/*_test.rb'
    t.warning = true
    t.verbose = true
    t.ruby_opts = ['--dev'] if defined?(JRUBY_VERSION)
  end

  task :resources do
    tests = Dir['test/resource/*_test.rb']
    return if tests.empty?
    sh(Gem.ruby, 'test/docker_test.rb', *tests)
  end

  task :integration do
    concurrency = ENV['CONCURRENCY'] || 1
    os = ENV['OS'] || ''
    sh("bundle exec kitchen test -c #{concurrency} #{os}")
  end

  task :ssh, [:target] do |_t, args|
    tests_path = File.join(File.dirname(__FILE__), 'test', 'integration', 'test', 'integration', 'default')
    key_files = ENV['key_files'] || File.join(ENV['HOME'], '.ssh', 'id_rsa')

    sh_cmd =  "bin/inspec exec #{tests_path}/"
    sh_cmd += ENV['test'] ? "#{ENV['test']}_spec.rb" : '*'
    sh_cmd += " --sudo" unless args[:target].split('@')[0] == 'root'
    sh_cmd += " -t ssh://#{args[:target]}"
    sh_cmd += " --key_files=#{key_files}"
    sh_cmd += " --format=#{ENV['format']}" if ENV['format']

    sh('sh', '-c', sh_cmd)
  end

  project_dir = File.dirname(__FILE__)
  namespace :aws do
    ['default', 'minimal'].each do |account|
      integration_dir = File.join(project_dir, 'test', 'integration', 'aws', account)
      attribute_file = File.join(integration_dir, '.attribute.yml')

      task :"setup:#{account}", :tf_workspace do |t, args|
        tf_workspace = args[:tf_workspace] || ENV['INSPEC_TERRAFORM_ENV']
        abort("You must either call the top-level test:aws:#{account} task, or set the INSPEC_TERRAFORM_ENV variable.") unless tf_workspace
        puts "----> Setup"
        abort("You must set the environment variable AWS_REGION") unless ENV['AWS_REGION']
        puts "----> Checking for required AWS profile..."
        sh("aws configure get aws_access_key_id --profile inspec-aws-test-#{account} > /dev/null")
        sh("cd #{integration_dir}/build/ && terraform init -upgrade")
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
  desc "Perform AWS Integration Tests"
  task aws: [:'aws:default', :'aws:minimal']

  namespace :azure do
    # Specify the directory for the integration tests
    integration_dir = File.join(project_dir, 'test', 'integration', 'azure')
    attribute_file = File.join(integration_dir, '.attribute.yml')

    task :setup, :tf_workspace do |t, args|
      tf_workspace = args[:tf_workspace] || ENV['INSPEC_TERRAFORM_ENV']
      abort("You must either call the top-level test:azure task, or set the INSPEC_TERRAFORM_ENV variable.") unless tf_workspace
      puts '----> Setup'
      sh("cd #{integration_dir}/build/ && terraform init")
      sh("cd #{integration_dir}/build/ && terraform workspace new #{tf_workspace}")

      # Generate Azure crendentials
      connection = Train.create('azure').connection
      creds = connection.options

      # Determine the storage account name and the admin password
      sa_name = (0...15).map { (65 + rand(26)).chr }.join.downcase
      admin_password = Passgen::generate(length: 12, uppercase: true, lowercase: true, symbols: true, digits: true)

      # Use the first 4 characters of the storage account to create a suffix
      suffix = sa_name[0..3]

      # Create the plan that can be applied to Azure
      cmd  = ""
      cmd += "cd #{integration_dir}/build/ && terraform plan -out inspec-azure.plan"
      cmd += " -var 'subscription_id=#{creds[:subscription_id]}' "
      cmd += " -var 'client_id=#{creds[:client_id]}' "
      cmd += " -var 'client_secret=#{creds[:client_secret]}' "
      cmd += " -var 'tenant_id=#{creds[:tenant_id]}' "
      cmd += " -var 'storage_account_name=#{sa_name}' "
      cmd += " -var 'admin_password=#{admin_password}' "
      cmd += " -var 'suffix=#{suffix}' "
      sh(cmd)

      # Apply the plan on Azure
      cmd = "cd #{integration_dir}/build/ && terraform apply inspec-azure.plan"
      sh(cmd)

      # Dump TF outputs to InSpec attributes file
      Rake::Task["test:azure:dump_attrs"].execute
    end

    task :"dump_attrs" do
      sh("cd #{integration_dir}/build/ && terraform output > #{attribute_file}")
        raw_output = File.read(attribute_file)
        yaml_output = raw_output.gsub(" = ", " : ")
        File.open(attribute_file, "w") {|file| file.puts yaml_output}
      end

    task :run do
      puts '----> Run'
      sh("bundle exec inspec exec #{integration_dir}/verify -t azure://1e0b427a-d58b-494e-ae4f-ee558463ebbf")
    end

    task :cleanup, :tf_workspace do |t, args|
      tf_workspace = args[:tf_workspace] || ENV['INSPEC_TERRAFORM_ENV']
      abort("You must either call the top-level test:azure task, or set the INSPEC_TERRAFORM_ENV variable.") unless tf_workspace
      puts '----> Cleanup'

      connection = Train.create('azure').connection
      creds = connection.options

      cmd  = ""
      cmd += "cd #{integration_dir}/build/ && terraform destroy -force "
      cmd += " -var 'subscription_id=#{creds[:subscription_id]}' "
      cmd += " -var 'client_id=#{creds[:client_id]}' "
      cmd += " -var 'client_secret=#{creds[:client_secret]}' "
      cmd += " -var 'tenant_id=#{creds[:tenant_id]}' "
      cmd += " -var 'storage_account_name=dummy' "
      cmd += " -var 'admin_password=dummy' "
      cmd += " -var 'suffix=dummy' "

      sh(cmd)

      sh("cd #{integration_dir}/build/ && terraform workspace select default")
      sh("cd #{integration_dir}/build && terraform workspace delete #{tf_workspace}")
    end
  end

  desc "Perform Azure Integration Tests"
  task :azure do
    tf_workspace = ENV['INSPEC_TERRAFORM_ENV'] || prompt("Please enter a workspace for your integration tests to run in: ")
    begin
      Rake::Task["test:azure:setup"].execute({:tf_workspace => tf_workspace})
      Rake::Task["test:azure:run"].execute
    rescue
      abort("Integration testing has failed")
    ensure
      Rake::Task["test:azure:cleanup"].execute({:tf_workspace => tf_workspace})
    end
  end
end

# Print the current version of this gem or update it.
#
# @param [Type] target the new version you want to set, or nil if you only want to show
def inspec_version(target = nil)
  path = 'lib/inspec/version.rb'
  require_relative path.sub(/.rb$/, '')

  nu_version = target.nil? ? '' : " -> #{target}"
  puts "Inspec: #{Inspec::VERSION}#{nu_version}"

  unless target.nil?
    raw = File.read(path)
    nu = raw.sub(/VERSION.*/, "VERSION = '#{target}'.freeze")
    File.write(path, nu)
    load(path)
  end
end

# Check if a command is available
#
# @param [Type] x the command you are interested in
# @param [Type] msg the message to display if the command is missing
def require_command(x, msg = nil)
  return if system("command -v #{x} || exit 1")
  msg ||= 'Please install it first!'
  puts "\033[31;1mCan't find command #{x.inspect}. #{msg}\033[0m"
  exit 1
end

# Check if a required environment variable has been set
#
# @param [String] x the variable you are interested in
# @param [String] msg the message you want to display if the variable is missing
def require_env(x, msg = nil)
  exists = `env | grep "^#{x}="`
  return unless exists.empty?
  puts "\033[31;1mCan't find environment variable #{x.inspect}. #{msg}\033[0m"
  exit 1
end

# Check the requirements for running an update of this repository.
def check_update_requirements
  require_command 'git'
end

# Show the current version of this gem.
desc 'Show the version of this gem'
task :version do
  inspec_version
end

desc 'Release a new docker image'
task :release_docker do
  version = Inspec::VERSION
  cmd = "rm *.gem; gem build *gemspec && "\
        "mv *.gem inspec.gem && "\
        "docker build -t chef/inspec:#{version} . && "\
        "docker push chef/inspec:#{version} && "\
        "docker tag chef/inspec:#{version} chef/inspec:latest &&"\
        "docker push chef/inspec:latest"
  puts "--> #{cmd}"
  sh('sh', '-c', cmd)
end

desc 'Release the website [deprecated]'
task :www do
  puts 'The Rake tasks for releasing the website are now in the www/ directory.'
  puts 'Run `cd www` and then `rake --tasks` for a list of the www-related tasks available.'
  exit(1)
end

namespace :www do
  desc 'Release the website [deprecated]'
  task :release do
    puts 'The Rake tasks for releasing the website are now in the www/ directory.'
    puts 'Run `cd www` and then `rake --tasks` for a list of the www-related tasks available.'
    exit(1)
  end
end
