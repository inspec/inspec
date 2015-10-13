#!/usr/bin/env rake
# encoding: utf-8

require 'rake/testtask'
require 'rubocop/rake_task'

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
  t.libs << 'test/unit'
  t.pattern = 'test/unit/**/*_test.rb'
  t.warning = true
  t.verbose = true
  t.ruby_opts = ['--dev'] if defined?(JRUBY_VERSION)
end

namespace :test do
  task :docker do
    path = File.join(File.dirname(__FILE__), 'test', 'integration')
    sh('sh', '-c', "cd #{path} && config=test-runner.yaml ruby -I ../../lib docker_test.rb tests/*")
  end

  task :vm do
    concurrency = ENV['CONCURRENCY'] || 4
    path = File.join(File.dirname(__FILE__), 'test', 'integration')
    sh('sh', '-c', "cd #{path} && kitchen test -c #{concurrency}")
  end
end
