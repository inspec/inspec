# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'vulcano/backend'

backends = {}
backend_conf = {
  'target' => 'ssh://vagrant@localhost',
  'key_file' => '/root/.ssh/id_rsa',
}

backends[:specinfra_ssh] = proc {
  conf = Vulcano::Backend.target_config(backend_conf)
  Vulcano::Backend.create('specinfra', conf).backend
}

backends[:ssh] = proc {
  conf = Vulcano::Backend.target_config(backend_conf)
  Vulcano::Backend.create('ssh', conf).backend
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
