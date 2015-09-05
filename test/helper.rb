# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

# loads a resource class and instantiates the class with the given arguments
def loadResource (resource, *args)
  # test mappings
  scriptpath = IO::File.realpath(IO::File.dirname(__FILE__))
  @mapping = {
    '/proc/net/bonding/bond0' => IO::File.join(scriptpath, '/unit/mock/files/bond0'),
    '/etc/ssh/ssh_config' => IO::File.join(scriptpath, '/unit/mock/files/ssh_config'),
    '/etc/ssh/sshd_config' => IO::File.join(scriptpath, '/unit/mock/files/sshd_config'),
    '/etc/passwd' => IO::File.join(scriptpath, '/unit/mock/files/passwd'),
    '/etc/ntp.conf' => IO::File.join(scriptpath, '/unit/mock/files/ntp.conf'),
    '/etc/login.defs'  => IO::File.join(scriptpath, '/unit/mock/files/login.defs')
  }

  @cmd_mapping = {
    'ps aux' => IO::File.join(scriptpath, '/unit/mock/cmd/ps-aux'),
    'type win_secpol.cfg' => IO::File.join(scriptpath, '/unit/mock/cmd/secedit-export'),
    'secedit /export /cfg win_secpol.cfg' => IO::File.join(scriptpath, '/unit/mock/cmd/success'),
    'del win_secpol.cfg' => IO::File.join(scriptpath, '/unit/mock/cmd/success'),
    'su - root -c \'echo $PATH\'' => IO::File.join(scriptpath, '/unit/mock/cmd/PATH')
  }

  # create mock backend
  conf = Vulcano::Backend.target_config({})
  backend_class = Vulcano::Backend.registry['mock']
  @backend = backend_class.new(conf, @mapping, @cmd_mapping)

  # load resource
  @rclass = Vulcano::Resource.registry[resource]

  # merge arguments
  args = [@backend] | args

  # initialize resource with backend and parameters
  @resource = @rclass.new(*args)
end
