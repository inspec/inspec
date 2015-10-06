# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'vulcano/backend'

backends = {}

backends[:local] = proc {
  Vulcano::Backend.create('local', {}).backend
}

backends[:specinfra_local] = proc {
  c = { 'backend' => 'exec' }
  opt = Vulcano::Backend.target_config(c)
  Vulcano::Backend.create('specinfra', opt).backend
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
