# encoding: utf-8
require 'yaml'
require_relative 'docker_run'
require_relative '../lib/vulcano'

tests = ARGV
if tests.empty?
  puts 'Nothing to do.'
  exit 0
end

class DockerTester
  def initialize(tests)
    @tests = tests
    @docker = DockerRunner.new
    @conf = tests_conf
  end

  def run
    puts ['Running tests:', @tests].flatten.join("\n- ")
    puts ''

    conf = RSpec.configuration
    reporter = conf.reporter
    results = nil

    # start reporting loop
    reporter.report(0) do |report|
      results = @docker.run_all do |container|
        status = test_container(container, report)
        # Report either 0 for all ok or an exit code
        status.all? ? 0 : conf.failure_exit_code
      end
    end

    # check if we were successful
    failures = results.find_all { |x| x!=0 }
    failures.empty? or fail 'Test failures'
  end

  def tests_conf
    # get the test configuration
    conf_path = File.join(File.dirname(__FILE__), '..', '.tests.yaml')
    fail "Can't find tests config in #{conf_path}" unless File.file?(conf_path)
    YAML.load(File.read(conf_path))
  end

  def test_container(container, report)
    puts "--> run test on docker #{container.id}"
    opts = { 'target' => "docker://#{container.id}" }
    runner = Vulcano::Runner.new(opts)
    runner.add_tests(@tests)
    tests = runner.tests.ordered_example_groups
    tests.map { |g| g.run(report) }
  end
end

DockerTester.new(tests).run
