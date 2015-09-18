# encoding: utf-8

require 'docker'
require 'yaml'
require 'concurrent'
require_relative '../lib/vulcano'

tests = ARGV
if tests.empty?
  puts 'Nothing to do.'
  exit 0
end

class DockerTester
  def initialize(tests)
    @tests = tests
    @images = docker_images_by_tag
    @conf = tests_conf
  end

  def run
    puts ['Running tests:', @tests].flatten.join("\n- ")
    puts ''

    conf = RSpec.configuration
    reporter = conf.reporter
    promises = nil

    # start reporting loop
    reporter.report(0) do |report|
      # test all images
      promises = @conf['images'].map do |name|
        run_on_target(name, report, conf)
      end
      # wait for all tests to be finished
      sleep(0.1) until promises.all?(&:fulfilled?)
    end

    # check if we were successful
    failures = promises.map(&:value).find_all { |x| x!=0 }
    failures.empty? or fail 'Test failures'
  end

  def run_on_target(name, report, conf)
    pr = Concurrent::Promise.new {
      container = prepare_container(name)
      status = test_container(container, report)
      stop_container(container)
      # Report either 0 for all ok or an exit code
      status.all? ? 0 : conf.failure_exit_code
    }.execute
    pr.rescue do |err|
      puts err.message
      puts err.backtrace.join("\n")
      conf.failure_exit_code
    end
  end

  def docker_images_by_tag
    # get all docker image tags
    images = {}
    Docker::Image.all.map do |img|
      Array(img.info['RepoTags']).each do |tag|
        images[tag] = img
      end
    end
    images
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

  def prepare_container(name)
    dname = "docker-#{name}:latest"
    image = @images[dname]
    fail "Can't find docker image #{dname}" if image.nil?

    puts "--> start docker #{name}"
    container = Docker::Container.create(
      'Cmd' => ['/bin/bash'],
      'Image' => image.id,
      'OpenStdin' => true,
    )
    container.start
    container
  end

  def stop_container(container)
    puts "--> killrm docker #{container.id}"
    container.kill
    container.delete(force: true)
  end
end

DockerTester.new(tests).run
