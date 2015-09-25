# encoding: utf-8
require_relative 'helper'
require 'vulcano/backend'

backends = {}
backend_conf = Vulcano::Backend.target_config({
  'target' => 'ssh://vagrant@localhost',
  'key_file' => '/root/.ssh/id_rsa',
})

backends[:specinfra_ssh] = proc {
  backend_class = Vulcano::Backend.registry['specinfra']
  backend_class.new(backend_conf)
}

backends[:ssh] = proc {
  backend_class = Vulcano::Backend.registry['ssh']
  backend_class.new(backend_conf)
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
