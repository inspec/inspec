# encoding: utf-8
# author: Dominik Richter

require 'docker'
require 'yaml'
require 'concurrent'

class DockerRunner
  def initialize(conf_path = nil)
    @conf_path = conf_path || ENV['config']
    unless File.file?(@conf_path)
      fail "Can't find configuration in #{@conf_path}"
    end

    @conf = YAML.load_file(@conf_path)
    if @conf.nil? or @conf.empty?
      fail "Can't read coniguration in #{@conf_path}"
    end
    if @conf['images'].nil?
      fail "You must configure test images in your #{@conf_path}"
    end

    @images = docker_images_by_tag
    @image_pull_tickets = Concurrent::Semaphore.new(2)
    @docker_run_tickets = Concurrent::Semaphore.new(5)
  end

  def run_all(&block)
    fail 'You must provide a block for run_all' unless block_given?

    promises = @conf['images'].map do |id|
      run_on_target(id, &block)
    end

    # wait for all tests to be finished
    sleep(0.1) until promises.all?(&:fulfilled?)

    # return resulting values
    promises.map(&:value)
  end

  def run_on_target(name, &block)
    pr = Concurrent::Promise.new {
      begin
        container = start_container(name)
        res = block.call(name, container)
      # special rescue block to handle not implemented error
      rescue NotImplementedError => err
        raise err.message
      end
      # always stop the container
      stop_container(container)
      res
    }.execute

    # failure handling
    pr.rescue do |err|
      msg = "\033[31;1m#{err.message}\033[0m"
      puts msg
      msg + "\n" + err.backtrace.join("\n")
    end
  end

  def provision_image(image, prov, files)
    tries ||= 3
    return image if prov['script'].nil?
    path = File.join(File.dirname(@conf_path), prov['script'])
    unless File.file?(path)
      puts "Can't find script file #{path}"
      return image
    end
    puts "    script #{path}"
    dst = "/bootstrap#{files.length}.sh"
    files.push(dst)
    image.insert_local('localPath' => path, 'outputPath' => dst)
  rescue StandardError => _
    retry unless (tries -= 1).zero?
  end

  def bootstrap_image(name, image)
    files = []
    provisions = Array(@conf['provision'])
    puts "--> provision docker #{name}" unless provisions.empty?
    provisions.each do |prov|
      image = provision_image(image, prov, files)
    end
    [image, files]
  end

  def start_container(name, version = nil)
    unless name.include?(':')
      version ||= 'latest'
      name = "#{name}:#{version}"
    end
    puts "--> schedule docker #{name}"

    image = @images[name]
    if image.nil?
      puts "\033[35;1m--> pull docker images #{name} "\
           "(this may take a while)\033[0m"

      @image_pull_tickets.acquire(1)
      puts "... start pull image #{name}"
      image = Docker::Image.create('fromImage' => name)
      @image_pull_tickets.release(1)

      unless image.nil?
        puts "\033[35;1m--> pull docker images finished for #{name}\033[0m"
      end
    end

    fail "Can't find nor pull docker image #{name}" if image.nil?

    @docker_run_tickets.acquire(1)

    image, scripts = bootstrap_image(name, image)

    puts "--> start docker #{name}"
    container = Docker::Container.create(
      'Cmd' => %w{sleep 3600},
      'Image' => image.id,
      'OpenStdin' => true,
    )
    container.start

    scripts.each do |script|
      container.exec(%w{chmod +x}.push(script))
      container.exec(%w{sh -c}.push(script))
    end

    container
  end

  def stop_container(container)
    @docker_run_tickets.release(1)
    puts "--> killrm docker #{container.id}"
    container.kill
    container.delete(force: true)
  end

  private

  # get all docker image tags
  def docker_images_by_tag
    images = {}
    Docker::Image.all.map do |img|
      Array(img.info['RepoTags']).each do |tag|
        images[tag] = img
      end
    end
    images
  end
end
