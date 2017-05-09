#!/usr/bin/env rake
# encoding: utf-8

require 'bundler'
require 'bundler/gem_tasks'
require 'rake/testtask'
require_relative 'tasks/changelog'
require_relative 'tasks/maintainers'

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
    sh('sh', '-c', "bundle exec kitchen test -c #{concurrency} #{os}")
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

# Update the version of this gem and create an updated
# changelog. It covers everything short of actually releasing
# the gem.
desc 'Bump the version of this gem'
task :bump_version, [:version] do |_, args|
  v = args[:version] || ENV['to']
  fail "You must specify a target version!  rake bump_version to=1.2.3" if v.empty?
  check_update_requirements
  inspec_version(v)
  Rake::Task['changelog'].invoke
  Rake::Task['docs:cli'].invoke
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

desc 'Release a new Habitat package'
task :release_habitat do
    version = Inspec::VERSION
    ENV['HAB_ORIGIN'] = "chef"
    if Dir.exist?("./results") then
        raise "Please remove the ./results directory"
    end
    if ! ENV.has_key?("HAB_AUTH_TOKEN") then
        raise "Please set the HAB_AUTH_TOKEN environment variable"
    end
    cmd = "echo #{version} > ./habitat/VERSION && "\
          "hab studio build ./habitat && " \
          "hab pkg upload ./results/*.hart"
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

