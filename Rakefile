require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
  t.verbose = true
  t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
end

namespace :test do
  task :isolated do
    Dir.glob("test/**/*_test.rb").all? do |file|
      sh(Gem.ruby, '-w', '-Ilib:test', file)
    end or raise "Failures"
  end

  task :integration do
    require 'docker'
    require 'yaml'

    tests = Dir["test/resource/*.rb"]
    return if tests.empty?

    images = {}
    Docker::Image.all.map do |img|
      Array(img.info['RepoTags']).each do |tag|
        images[tag] = img
      end
    end

    conf = YAML.load(File::read '.tests.yaml')
    conf['images'].each do |name|
      dname = "docker-#{name}:latest"
      image = images[dname]
      raise "Can't find docker image #{dname}" if image.nil?

      container = Docker::Container.create(
        'Cmd' => [ '/bin/bash' ],
        'Image' => image.id,
        'OpenStdin' => true,
      )
      container.start

      res = sh(Gem.ruby, '-I', 'lib', 'test/docker.rb', container.id, *tests)

      container.kill
      container.delete(force: true)
      res
    end.all? or raise "Failures"

  end
end
