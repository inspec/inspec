# encoding: utf-8
require_relative 'helper'
require 'vulcano/backend'

backends = {}
backend_conf = {
  'target' => 'ssh://vagrant@localhost',
  'key_file' => '/root/.ssh/id_rsa',
}

backends[:specinfra_ssh] = proc {
  Vulcano::Backend.create('specinfra', backend_conf).backend
}

backends[:ssh] = proc {
  Vulcano::Backend.create('ssh', backend_conf).backend
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
