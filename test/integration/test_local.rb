# encoding: utf-8
# author: Dominik Richter

require_relative 'helper'
require 'train'

backends = {}

backends[:local] = proc { |*opts|
  Train.create('local', {}).connection(opts[0])
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test), test, 1)
  end
end
