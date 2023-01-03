#!/usr/bin/env rake

require "bundler"
require "bundler/gem_helper"
require "rake/testtask"
require "train"
require "open3"
require_relative "tasks/spdx"
require "fileutils"
require 'yaml'

require_relative "lib/inspec/utils/attribute_file_writer"


Bundler::GemHelper.install_tasks name: "inspec-core"
Bundler::GemHelper.install_tasks name: "inspec"

TERRAFORM_DIR = "terraform".freeze
TF_PLAN_FILE_NAME = "inspec-db-testing".freeze
TF_PLAN_FILE = File.join(TERRAFORM_DIR, TF_PLAN_FILE_NAME)
ATTRIBUTES_FILE_NAME = "".freeze
DB_INTEGRATION_DIR = "test/integration/db".freeze


def prompt(message)
  print(message)
  STDIN.gets.chomp
end

# The docs tasks rely on ruby-progressbar. If we can't load it, then don't
# load the docs tasks. This is necessary to allow this Rakefile to work
# when the "tests" gem group in the Gemfile has been excluded, such as
# during an appbundle-updater run.
begin
  require "ruby-progressbar"
  require_relative "tasks/docs"
rescue LoadError
  puts "docs tasks are unavailable because the ruby-progressbar gem is not available."
end

begin
  require "git"
  require_relative "tasks/contrib"
rescue LoadError
  puts "contrib tasks are unavailable because the git gem is not available."
end

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

  task :missing do
    missing = Dir["test/**/*"] - Dir[*GLOBS]

    missing.reject! { |f| ! File.file? f }
    missing.reject! { |f| f =~ %r{test/(integration|cookbooks)} }
    missing.reject! { |f| f =~ %r{test/fixtures} }
    missing.reject! { |f| f =~ /test.*helper/ }
    missing.reject! { |f| f =~ %r{test/docker} }

    puts missing.sort
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

  task :kitchen, [:os] do |task, args|
    concurrency = ENV["CONCURRENCY"] || 1
    os = args[:os] || ENV["OS"] || ""
    ENV["DOCKER"] = "true" if ENV["docker"].nil?
    sh("bundle exec kitchen test -c #{concurrency} #{os}")
  end
  # Inject a prerequisite task
  task kitchen: [:accept_license]

  task :ssh, [:target] do |_t, args|
    tests_path = File.join(File.dirname(__FILE__), "test", "integration", "test", "integration", "default")
    key_files = ENV["key_files"] || File.join(ENV["HOME"], ".ssh", "id_rsa")

    sh_cmd =  "bin/inspec exec #{tests_path}/"
    sh_cmd += ENV["test"] ? "#{ENV["test"]}_spec.rb" : "*"
    sh_cmd += " --sudo" unless args[:target].split("@")[0] == "root"
    sh_cmd += " -t ssh://#{args[:target]}"
    sh_cmd += " --key_files=#{key_files}"
    sh_cmd += " --format=#{ENV["format"]}" if ENV["format"]

    sh("sh", "-c", sh_cmd)
  end

  task :dbintegration, [:controls] => ["tf:write_tf_output_to_file", :setup_env] do |_t, args|
    cmd = %W( bundle exec inspec exec #{DB_INTEGRATION_DIR}
              --input-file terraform/#{ENV["ATTRIBUTES_FILE"]}
              --reporter cli
              --no-distinct-exit
              -t ssh://ec2-user@#{ENV["EC2_PUBLIC_DNS"]}
              -i terraform/inspec-mysql-db-test.pem
              --chef-license accept-silent )

    if args[:controls]
      sh(*cmd, "--controls", args[:controls], *args.extras)
    else
      sh(*cmd)
    end
  end
end

task :setup_env do
  ENV["EC2_PUBLIC_DNS"] = YAML.load_file("terraform/#{ENV["ATTRIBUTES_FILE"]}")["ec2_public_dns"]
end

# Print the current version of this gem or update it.
#
# @param [Type] target the new version you want to set, or nil if you only want to show
def inspec_version(target = nil)
  path = "lib/inspec/version.rb"
  require_relative path.sub(/.rb$/, "")

  nu_version = target.nil? ? "" : " -> #{target}"
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

  msg ||= "Please install it first!"
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
  require_command "git"
end

# Show the current version of this gem.
desc "Show the version of this gem"
task :version do
  inspec_version
end

namespace :tf do
  workspace = ENV["WORKSPACE"]

  task :init do
    Dir.chdir(TERRAFORM_DIR) do
      sh("terraform", "init")
    end
  end

  desc "Creates a Terraform execution plan from the plan file"
  task :plan do
    Dir.chdir(TERRAFORM_DIR) do
      sh("terraform", "get")
      sh("terraform", "plan", "-out", "inspec-db-testing.plan")
    end
    Rake::Task["tf:write_tf_output_to_file"].invoke
  end

  desc "Executes the Terraform plan"
  task :apply, [:optionals] do |_t, args|
    if File.exist?(TF_PLAN_FILE)
      puts "-> Applying an existing terraform plan: #{TF_PLAN_FILE}"
      unless args[:optionals].nil?
        puts "These arguments are ignored: #{Array(args[:optionals]) + args.extras}."
      end
    else
      Rake::Task["tf:plan"].invoke(args[:optionals])
    end
    Dir.chdir(TERRAFORM_DIR) do
      sh("terraform", "apply", "inspec-db-testing.plan")
    end
  end

  desc "Destroys the Terraform environment"
  task :destroy do
    Dir.chdir(TERRAFORM_DIR) do
      sh("terraform", "destroy", "-auto-approve")
    end
    File.delete("terraform/#{ENV["ATTRIBUTES_FILE"]}")
  end

  task :write_tf_output_to_file do
    Dir.chdir(TERRAFORM_DIR) do
      stdout, stderr, status = Open3.capture3("terraform output -json")

      abort(stderr) unless status.success?
      abort("$ATTRIBUTES_FILE not set. Please source .envrc.") if ENV["ATTRIBUTES_FILE"].nil?
      abort("$ATTRIBUTES_FILE has no content. Check .envrc.") if ENV["ATTRIBUTES_FILE"].empty?

      AttributeFileWriter.write_yaml(ENV["ATTRIBUTES_FILE"], stdout)
    end
  end
end