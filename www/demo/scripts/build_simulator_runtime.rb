# encoding: utf-8
require 'train'
require 'docker-api'
require 'fileutils'
require 'json'

simulator = 'inspec-simulator'

backend = Train.create('local')
conn = backend.connection

def build_inspec(backend)
  puts '----> build inspec.gem'
  pwd = File.expand_path(File.dirname(__FILE__))
  cmd = backend.run_command("cd #{pwd}/../../../ && rm -f inspec-*.gem && gem build inspec.gemspec")
  puts cmd.stdout
  # move gem to simulator
  FileUtils.mv(Dir.glob(pwd+'/../../../inspec-*.gem')[0], pwd + '/simulator/install/inspec.gem')
end

def build_inspec_mock(backend)
  puts '----> build inspec-mock.gem'
  pwd = File.expand_path(File.dirname(__FILE__))
  # build gem
  cmd = backend.run_command("cd #{pwd}/inspec-mock && rm -f inspec-mock*.gem && gem build inspec-mock.gemspec")
  puts cmd.stdout
  # move gem to simulator
  FileUtils.mv(Dir.glob(pwd+'/inspec-mock/inspec-mock*.gem')[0], pwd + '/simulator/install/inspec-mock.gem')
end

def build_simulator(name)
  puts '----> build simulator container (this may take a minute)'
  simulator_dir = File.expand_path(File.join(File.dirname(__FILE__), 'simulator'))
  Docker.options[:read_timeout] = 5 * 60
  image = Docker::Image.build_from_dir(simulator_dir) do |v|
    begin
      if (log = JSON.parse(v)) && log.key?('stream')
        puts log['stream']
      end
    rescue JSON::ParserError => _e
      puts v
    end
  end
  image.tag('repo' => name, 'tag' => 'latest', force: true)
end

def copy_examples
  puts '----> copy examples'
  pwd = File.expand_path(File.dirname(__FILE__))
  FileUtils.cp_r(Dir.glob(pwd+'/../../../examples/profile/*'), pwd + '/simulator/filesystem/examples/profile')
end

# prepare everything for the simulator
build_inspec(conn)
build_inspec_mock(conn)
copy_examples

# build simulator container
build_simulator(simulator)

# close connection
conn.close
