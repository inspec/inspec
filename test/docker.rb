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
    rspec_runner = RSpec::Core::Runner.new(nil)

    # test all images
    promises = @conf['images'].map { |n|
      Concurrent::Promise.new {
        container = prepare_image(n)
        runner = test_container(container.id)
        res = runner.run_with(rspec_runner)
        stop_container(container)
        res
      }.execute
    }

    sleep(0.1) until promises.all?(&:fulfilled?)
    promises.map(&:value).all? or fail 'Test failures'
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

  def test_container(container_id)
    puts "--> run test on docker #{container_id}"
    opts = { 'target' => "docker://#{container_id}" }
    runner = Vulcano::Runner.new(nil, opts)
    runner.add_tests(@tests)
    runner
  end

  def prepare_image(name)
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
