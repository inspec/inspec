# encoding: utf-8
require 'vulcano/backend'
require_relative 'helper'

container_id = ENV['CONTAINER'] or
  fail 'You must provide a container ID via CONTAINER env'

tests = ARGV
puts ['Running tests:', tests].flatten.join("\n- ")
puts ''

backends = {}
backends[:docker] = proc {
  opt = { 'host' => container_id }
  Vulcano::Backend.create('docker', opt)
}

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
