# encoding: utf-8

require 'docker'
require 'yaml'
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
    # test all images
    @conf['images'].each do |n|
      test_image(n)
    end.all? or fail 'Test failures'
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
    opts = { 'target' => "specinfra+docker://#{container_id}" }
    runner = Vulcano::Runner.new(nil, opts)
    runner.add_tests(@tests)
    runner.run
  end

  def test_image(name)
    dname = "docker-#{name}:latest"
    image = @images[dname]
    fail "Can't find docker image #{dname}" if image.nil?

    puts "--> start docker #{name}"
    container = Docker::Container.create(
      'Cmd' => %w{ /bin/bash },
      'Image' => image.id,
      'OpenStdin' => true
    )
    container.start

    puts "--> run test on docker #{name}"
    res = test_container(container.id)

    puts "--> killrm docker #{name}"
    container.kill
    container.delete(force: true)
    res
  end
end

DockerTester.new(tests).run
