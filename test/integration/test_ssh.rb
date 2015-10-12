# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'vulcano/backend'

backends = {}
backend_conf = {
  'target' => 'ssh://vagrant@localhost',
  'key_file' => '/root/.ssh/id_rsa',
}

backends[:ssh] = proc {
  conf = Train.target_config(backend_conf)
  Train.create('ssh', conf).connection
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
