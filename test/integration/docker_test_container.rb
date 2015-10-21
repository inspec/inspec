# encoding: utf-8
# author: Dominik Richter

require 'train'
require_relative 'helper'

container_id = ENV['CONTAINER'] or
  fail 'You must provide a container ID via CONTAINER env'

tests = ARGV
puts ['Running tests:', tests].flatten.join("\n- ")
puts ''

backends = {}
backends[:docker] = proc { |*args|
  opt = Train.target_config({ host: container_id })
  Train.create('docker', opt).connection(args[0])
}

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test), test, 1)
  end
end
