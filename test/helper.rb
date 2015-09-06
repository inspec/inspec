# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

# loads a resource class and instantiates the class with the given arguments
def loadResource (resource, *args)
  scriptpath = ::File.realpath(::File.dirname(__FILE__))

  # create mock backend
  conf = Vulcano::Backend.target_config({})
  backend_class = Vulcano::Backend.registry['mock']
  @backend = backend_class.new(conf)

  # create all mock files
  local = Vulcano::Backend.registry['local'].new({})
  mockfile = lambda { |x|
    path = ::File.join(scriptpath, '/unit/mock/files', x)
    local.file(path)
  }
  @backend.files = {
    '/proc/net/bonding/bond0' => mockfile.('bond0'),
    '/etc/ssh/ssh_config' => mockfile.('ssh_config'),
    '/etc/ssh/sshd_config' => mockfile.('sshd_config'),
    '/etc/passwd' => mockfile.('passwd'),
    '/etc/ntp.conf' => mockfile.('ntp.conf'),
    '/etc/login.defs' => mockfile.('login.defs'),
    '/etc/security/limits.conf' => mockfile.('limits.conf'),
    '/etc/inetd.conf' => mockfile.('inetd.conf'),
    '/etc/group' => mockfile.('group'),
    '/etc/audit/auditd.conf' => mockfile.('auditd.conf')
  }

  # create all mock commands
  Struct.new("MockCommand", :stdout, :stderr, :exit_status)
  cmd = lambda {|x|
    stdout = ::File.read(::File.join(scriptpath, '/unit/mock/cmd/'+x))
    Struct::MockCommand.new( stdout, '', 0 )
  }
  @backend.commands = {
    'ps aux' => cmd.('ps-aux'),
    'type win_secpol.cfg' => cmd.('secedit-export'),
    'secedit /export /cfg win_secpol.cfg' => cmd.('success'),
    'del win_secpol.cfg' => cmd.('success'),
    'su - root -c \'echo $PATH\'' => cmd.('PATH'),
    '(Get-Item \'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule\').GetValue(\'Start\')' => cmd.('reg_schedule'),
    'Auditpol /get /subcategory:\'User Account Management\' /r' => cmd.('auditpol'),
    '/sbin/auditctl -l' => cmd.('auditctl'),
    'yum -v repolist all'  => cmd.('yum-repolist-all'),
  }

  # load resource
  @rclass = Vulcano::Resource.registry[resource]

  # merge arguments
  args = [@backend] | args

  # initialize resource with backend and parameters
  @resource = @rclass.new(*args)
end
