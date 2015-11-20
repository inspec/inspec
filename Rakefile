#!/usr/bin/env rake
# encoding: utf-8

require 'bundler'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'
require_relative 'tasks/maintainers'

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# lint the project
desc 'Run robocop linter'
task lint: [:rubocop]

# run tests
task default: [:test, :lint]

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

  task :resources do
    tests = Dir['test/resource/*_test.rb']
    return if tests.empty?
    sh(Gem.ruby, 'test/docker_test.rb', *tests)
  end

  task :vm do
    concurrency = ENV['CONCURRENCY'] || 4
    path = File.join(File.dirname(__FILE__), 'test', 'integration')
    sh('sh', '-c', "cd #{path} && bundle exec kitchen test -c #{concurrency} -t .")
  end
end

# Automatically generate a changelog for this project. Only loaded if
# the necessary gem is installed.
begin
  require 'github_changelog_generator/task'
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.since_tag = '0.7.0'
  end
rescue LoadError
end
