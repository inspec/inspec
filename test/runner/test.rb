# encoding: utf-8

# Tests configuration:

# MTime tracks the maximum range of modification time in seconds.
# i.e. MTime == 60*60*1 is 1 hour of modification time range,
# which translates to a modification time range of:
#   [ now-1hour, now ]
MTime = 60 * 60 * 1

# Run all tests
require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

backends = {}

backends[:local] = proc {
  backend_conf = Vulcano::Backend.target_config({})
  backend_class = Vulcano::Backend.registry['local']
  backend_class.new(backend_conf)
}

backends[:specinfra_local] = proc {
  backend_conf = Vulcano::Backend.target_config({ 'backend' => 'exec' })
  backend_class = Vulcano::Backend.registry['specinfra']
  backend_class.new(backend_conf)
}

tests = ARGV

backends.each do |type, get_backend|
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
