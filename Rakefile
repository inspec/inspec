#!/usr/bin/env rake

require "bundler"
require "bundler/gem_helper"
require "rake/testtask"
require "train"
require "fileutils"
require_relative "tasks/docs"

Bundler::GemHelper.install_tasks name: "inspec-core"
Bundler::GemHelper.install_tasks name: "inspec"

task :install do
  inspec_bin_path = ::File.join(::File.dirname(__FILE__), "inspec-bin")
  Dir.chdir(inspec_bin_path)
  sh("rake install")
end

GLOBS = [
  "test/unit/**/*_test.rb",
  "test/functional/**/*_test.rb",
  "lib/plugins/inspec-*/test/**/*_test.rb",
].freeze

# run tests
task default: %w{ test }
task test: %w{ test:default }

namespace :test do

  Rake::TestTask.new(:default) do |t|
    t.libs << "test"
    t.test_files = Dir[*GLOBS].sort
    t.warning = !!ENV["W"]
    t.verbose = !!ENV["V"] # default to off. the test commands are _huge_.
    t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
  end
  task default: [:accept_license]

  begin
    require "chefstyle"
    require "rubocop/rake_task"
    RuboCop::RakeTask.new(:lint) do |task|
      task.options += ["--display-cop-names", "--no-color", "--parallel"]
    end
  rescue LoadError
    puts "rubocop is not available. Install the rubocop gem to run the lint tests."
  end

  task :list do
    puts Dir[*GLOBS].sort
  end

  # rubocop:disable Style/BlockDelimiters,Layout/ExtraSpacing,Lint/AssignmentInCondition

  def n_threads_run(n_workers, jobs)
    queue = Queue.new

    jobs.each do |job|
      queue << job
    end

    n_workers.times.map {
      queue << nil            # 1 quit value per thread
      Thread.new do
        while job = queue.pop # go until quit value
          yield job
        end
      end
    }.each(&:join)
  end

  task :parallel do
    n      = (ENV["K"] || 4).to_i
    warn "Have RUBY_PLATFORM as #{RUBY_PLATFORM}"
    lock   = Mutex.new
    passed = true

    tests = Dir[*GLOBS].sort
    tests.concat([nil] * (n - tests.size % n)) unless # square it up
      tests.size % 4 == 0

    jobs = tests.each_slice(n).to_a.transpose
    t0   = Time.now
    out  = Queue.new

    n_threads_run n, jobs do |job|
      job.compact!
      lock.synchronize do
        warn "Running #{job.size} files in a thread"
      end

      t1 = Time.now
      cmd = "bundle exec minitest #{job.join " "}"
      output = `#{cmd} 2>&1`
      t2 = Time.now - t1

      lock.synchronize do
        if $?.success?
          warn "Finished #{job.size} files successfully in %d seconds" % [t2]
        else
          passed = false
          warn "Finished #{job.size} files with failures in %d seconds" % [t2]
        end
      end

      out << "#{cmd}\n\n#{output}"
    end

    puts "done"
    puts

    out.length.times do
      puts out.shift
      puts
    end

    puts "Ran in %d seconds" % [ Time.now - t0 ]

    exit 1 unless passed
  end
  task parallel: [:accept_license] # given isolated being green, why is this needed?

  desc "Run test files in multiple threads"
  task :isolated do
    require "fileutils"

    # Only needed for local runs, not CI?
    FileUtils.rm_rf File.expand_path "~/.inspec"
    FileUtils.rm_rf File.expand_path "~/.chef"

    # 3 seems to be the magic number... (tho not by that much)
    bad, good, n = {}, [], (ENV.delete("K") || 3).to_i
    t0 = Time.now

    tests = Dir[*GLOBS].sort

    n_threads_run n, tests do |path|
      output = `bundle exec ruby -Ilib -Itest #{path} 2>&1`

      if $?.success?
        $stderr.print "."
        good << path
      else
        $stderr.print "x"
        bad[path] = output
      end
    end

    puts "done"
    puts "Ran in %d seconds" % [ Time.now - t0 ]

    unless good.empty?
      puts
      puts "# Good tests:"
      good.sort.each do |path|
        puts path
      end
    end

    unless bad.empty?
      puts
      puts "# Bad tests:"
      bad.keys.each do |path|
        puts path
      end
      puts
      puts "# Bad Test Output:"
      bad.each do |path, output|
        puts
        puts "# #{path}:"
        puts output
      end
      exit 1
    end
  end

  task :accept_license do
    FileUtils.mkdir_p(File.join(Dir.home, ".chef", "accepted_licenses"))
    # If the user has not accepted the license, touch the acceptance
    # file, but also touch a marker that it is only for testing.
    unless File.exist?(File.join(Dir.home, ".chef", "accepted_licenses", "inspec"))
      puts "\n\nTemporarily accepting Chef user license for the duration of testing...\n"
      FileUtils.touch(File.join(Dir.home, ".chef", "accepted_licenses", "inspec"))
      FileUtils.touch(File.join(Dir.home, ".chef", "accepted_licenses", "inspec.for_testing"))
    end

    # Regardless of what happens, when this process exits, check for cleanup.
    at_exit do
      if File.exist?(File.join(Dir.home, ".chef", "accepted_licenses", "inspec.for_testing"))
        puts "\n\nRemoving temporary Chef user license acceptance file that was placed for test duration.\n"
        FileUtils.rm_f(File.join(Dir.home, ".chef", "accepted_licenses", "inspec"))
        FileUtils.rm_f(File.join(Dir.home, ".chef", "accepted_licenses", "inspec.for_testing"))
      end
    end
  end

  Rake::TestTask.new(:functional) do |t|
    t.libs << "test"
    t.test_files = Dir.glob([
      "test/functional/**/*_test.rb",
      "lib/plugins/inspec-*/test/functional/**/*_test.rb",
    ])
    t.warning = !!ENV["W"]
    t.verbose = !!ENV["V"] # default to off. the test commands are _huge_.
    t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
  end
  # Inject a prerequisite task
  task functional: [:accept_license]

  Rake::TestTask.new(:unit) do |t|
    t.libs << "test"
    t.test_files = Dir.glob([
      "test/unit/**/*_test.rb",
      "lib/plugins/inspec-*/test/unit/**/*_test.rb",
    ])
    t.warning = !!ENV["W"]
    t.verbose = !!ENV["V"] # default to off. the test commands are _huge_.
    t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
  end
  # Inject a prerequisite task
  task unit: [:accept_license]
end

# NOTE: Rakefile clean-up was done in PR #6367 (https://github.com/inspec/inspec/pull/6367)
