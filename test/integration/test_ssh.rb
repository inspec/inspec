# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'train'

backends = {}
backend_conf = {
  'target' => 'ssh://vagrant@localhost',
  'key_files' => '/root/.ssh/id_rsa',
}

backends[:ssh] = proc { |*args|
  conf = Train.target_config(backend_conf)
  Train.create('ssh', conf).connection(args[0])
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test), test, 1)
  end
end
