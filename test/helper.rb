# encoding: utf-8

require 'minitest/autorun'
require 'minitest/spec'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
  add_group 'Resources', 'lib/resources'
  add_group 'Matchers', 'lib/matchers'
  add_group 'Backends', 'lib/vulcano/backend'
end

require 'vulcano/backend'
require 'vulcano/resource'

# loads a resource class and instantiates the class with the given arguments
def loadResource (resource, *args)
  scriptpath = ::File.realpath(::File.dirname(__FILE__))

  # create mock backend
  conf = Vulcano::Backend.target_config({
    quiet: true
  })
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
    '/etc/audit/auditd.conf' => mockfile.('auditd.conf'),
    '/etc/mysql/my.cnf' => mockfile.('mysql.conf'),
    '/etc/mysql/mysql2.conf' => mockfile.('mysql2.conf')
  }

  # create all mock commands
  cmd = lambda {|x|
    stdout = ::File.read(::File.join(scriptpath, '/unit/mock/cmd/'+x))
    @backend.mock_command( stdout, '', 0 )
  }
  @backend.commands = {
    'ps aux' => cmd.call('ps-aux'),
    'type win_secpol.cfg' => cmd.call('secedit-export'),
    'secedit /export /cfg win_secpol.cfg' => cmd.call('success'),
    'del win_secpol.cfg' => cmd.call('success'),
    'su - root -c \'echo $PATH\'' => cmd.call('PATH'),
    '(Get-Item \'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule\').GetValue(\'Start\')' => cmd.call('reg_schedule'),
    'Auditpol /get /subcategory:\'User Account Management\' /r' => cmd.call('auditpol'),
    '/sbin/auditctl -l' => cmd.call('auditctl'),
    'yum -v repolist all'  => cmd.call('yum-repolist-all'),
    'dpkg -s curl' => cmd.call('dpkg-s-curl'),
    'rpm -qia curl' => cmd.call('rpm-qia-curl'),
    'pacman -Qi curl' => cmd.call('packman-qi-curl'),
    'gem list --local -a -q ^rubocop$' => cmd.call('gem-list-local-a-q-rubocop'),
    'npm ls -g --json bower' => cmd.call('npm-ls-g--json-bower'),
    'pip show jinja2' => cmd.call('pip-show-jinja2'),
    "Get-Package -Name 'Mozilla Firefox' | ConvertTo-Json" => cmd.call('get-package'),
    "New-Object -Type PSObject | Add-Member -MemberType NoteProperty -Name Service -Value (Get-Service -Name dhcp| Select-Object -Property Name, DisplayName, Status) -PassThru | Add-Member -MemberType NoteProperty -Name WMI -Value (Get-WmiObject -Class Win32_Service | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property StartMode) -PassThru | ConvertTo-Json" => cmd.call('get-service-dhcp'),
    "Get-WindowsFeature | Where-Object {$_.Name -eq 'dhcp' -or $_.DisplayName -eq 'dhcp'} | Select-Object -Property Name,DisplayName,Description,Installed,InstallState | ConvertTo-Json" => cmd.call('get-windows-feature'),
    'lsmod' => cmd.call('lsmod'),
    '/sbin/sysctl -q -n net.ipv4.conf.all.forwarding' => cmd.call('sbin_sysctl'),
  }

  # load resource
  @rclass = Vulcano::Resource.registry[resource]

  # merge arguments
  args = [@backend] | args

  # initialize resource with backend and parameters
  @resource = @rclass.new(*args)
end
