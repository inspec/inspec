# encoding: utf-8
require_relative 'helper'
require 'vulcano/backend'

backends = {}

backends[:specinfra_ssh] = proc {
  backend_conf = Vulcano::Backend.target_config({
    'target' => 'ssh://root@localhost',
    'key_file' => '/root/.ssh/id_rsa',
  })
  backend_class = Vulcano::Backend.registry['specinfra']
  backend_class.new(backend_conf)
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
