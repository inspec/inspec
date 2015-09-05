# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

# loads a resource class and instantiates the class with the given arguments
def loadResource (resource, *args)
  # test mappings
  scriptpath = IO::File.realpath(IO::File.dirname(__FILE__))
  @mapping = {
    '/proc/net/bonding/bond0' => IO::File.join(scriptpath, '/unit/mock/bond0'),
    '/etc/ssh/ssh_config' => IO::File.join(scriptpath, '/unit/mock/ssh_config'),
    '/etc/ssh/sshd_config' => IO::File.join(scriptpath, '/unit/mock/sshd_config')
  }

  # create mock backend
  conf = Vulcano::Backend.target_config({})
  backend_class = Vulcano::Backend.registry['mock']
  @backend = backend_class.new(conf, @mapping)

  # load resource
  @rclass = Vulcano::Resource.registry[resource]

  # merge arguments
  args = [@backend] | args

  # initialize resource with backend and parameters
  @resource = @rclass.new(*args)
end
