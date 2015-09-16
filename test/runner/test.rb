# encoding: utf-8

# Tests configuration:
module Test
  class << self
    # MTime tracks the maximum range of modification time in seconds.
    # i.e. MTime == 60*60*1 is 1 hour of modification time range,
    # which translates to a modification time range of:
    #   [ now-1hour, now ]
    def mtime
      60 * 60 * 24 * 1
    end

    def dup(o)
      Marshal.load(Marshal.dump(o))
    end

    def selinux_label(os, path = nil)
      labels = {}

      h = {}
      h.default = Hash.new(nil)
      h['redhat'] = {}
      h['redhat'].default = 'unconfined_u:object_r:user_tmp_t:s0'
      h['redhat']['5.11'] = 'user_u:object_r:tmp_t'
      labels.default = dup(h)

      h['redhat'].default = 'unconfined_u:object_r:tmp_t:s0'
      labels['/tmp/block_device'] = dup(h)

      h = {}
      h.default = Hash.new(nil)
      h['redhat'] = {}
      h['redhat'].default = 'system_u:object_r:null_device_t:s0'
      h['redhat']['5.11'] = 'system_u:object_r:null_device_t'
      labels['/dev/null'] = dup(h)

      labels[path][os[:family]][os[:release]]
    end
  end
end

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
